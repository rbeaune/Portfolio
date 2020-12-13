#==============================================================================
# Menu_SaveGame
# Edited    April 8 2020
#==============================================================================
#██████╗  █████╗ ████████╗ █████╗     ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗
#██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗
#██║  ██║███████║   ██║   ███████║    ██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝
#██║  ██║██╔══██║   ██║   ██╔══██║    ██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗
#██████╔╝██║  ██║   ██║   ██║  ██║    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║
#╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
module DataManager

  #--------------------------------------------------------------------------
  # * Create Filename
  #--------------------------------------------------------------------------
  def self.make_filename(save_header)
    savetime = save_header[:savetime].to_s.gsub!(/\s/,'').gsub!(/:/,'').gsub!(/-/,'')
    return sprintf("Saves/%s.rvdata2", savetime)
  end
  #--------------------------------------------------------------------------
  # * Execute Save
  #--------------------------------------------------------------------------
  def self.save_game(save_header)
    begin
      save_game_without_rescue(save_header)
    rescue
      delete_save_file(save_header)
      false
    end
  end
  #--------------------------------------------------------------------------
  # * Execute Save (No Exception Processing)
  #--------------------------------------------------------------------------
  def self.save_game_without_rescue(save_header)
    check_savefile_directory
    File.open(make_filename(save_header), "wb") do |file|
      $game_system.on_before_save
      Marshal.dump(save_header, file)
      Marshal.dump(make_save_contents, file)
    end
    refresh_savefile_hash
    return true
  end
  #--------------------------------------------------------------------------
  # * self.make_save_header
  #--------------------------------------------------------------------------
  def self.make_save_header
    header = {}
    header[:savetime]   = Time.now
    header[:mapname]    = $game_map.display_name
    header[:characters] = $game_party.characters_for_savefile
    header[:playtime]   = $game_system.playtime_s
    header[:steps]      = $game_party.steps
    header[:gold]       = $game_party.gold
    #header[:percent]    = $game_system.completion_percent_s
    header
  end

end #DataManager

#███████╗██╗██╗     ███████╗    ██████╗  █████╗ ████████╗ █████╗      ██████╗ █████╗ ██████╗ ██████╗
#██╔════╝██║██║     ██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗    ██╔════╝██╔══██╗██╔══██╗██╔══██╗
#█████╗  ██║██║     █████╗      ██║  ██║███████║   ██║   ███████║    ██║     ███████║██████╔╝██║  ██║
#██╔══╝  ██║██║     ██╔══╝      ██║  ██║██╔══██║   ██║   ██╔══██║    ██║     ██╔══██║██╔══██╗██║  ██║
#██║     ██║███████╗███████╗    ██████╔╝██║  ██║   ██║   ██║  ██║    ╚██████╗██║  ██║██║  ██║██████╔╝
#╚═╝     ╚═╝╚══════╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝
class Window_FileDataCard < Window_Base

  include FileDataCard
  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize
    dw = Graphics.width / 2 + 40
    dh = 144
    dx = (Graphics.width / 2) - (dw / 2)
    dy = (Graphics.height / 2) - dh
    super(dx,dy,dw,dh)
    @header = nil
  end
  #--------------------------------------------------------------------------
  # * update_header
  #--------------------------------------------------------------------------
  def update_header(header)
    @header = header
    refresh
  end
  #--------------------------------------------------------------------------
  # * refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    reset_font_settings
    rect = Rect.new(0,0,self.width,self.height)
    draw_card_contents(rect,@header)
  end

end #Window_FileDataCard

#███████╗ █████╗ ██╗   ██╗███████╗    ██╗      ██████╗  █████╗ ██████╗      ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗
#██╔════╝██╔══██╗██║   ██║██╔════╝    ██║     ██╔═══██╗██╔══██╗██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗
#███████╗███████║██║   ██║█████╗      ██║     ██║   ██║███████║██║  ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║
#╚════██║██╔══██║╚██╗ ██╔╝██╔══╝      ██║     ██║   ██║██╔══██║██║  ██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║
#███████║██║  ██║ ╚████╔╝ ███████╗    ███████╗╚██████╔╝██║  ██║██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝
#╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝    ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝
class Window_SaveLoadCommand < Window_Command

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(type = :none)
    @command_type = type
    super(0, 0)
    update_placement
    self.openness = 0
    select(1)
    open
  end
  #--------------------------------------------------------------------------
  # * Get Window Width
  #--------------------------------------------------------------------------
  def window_width
    return 160
  end
  #--------------------------------------------------------------------------
  # * Update Window Position
  #--------------------------------------------------------------------------
  def update_placement
    self.x = (Graphics.width - width) / 2
    self.y = (Graphics.height - height) / 2 + 64
  end
  #--------------------------------------------------------------------------
  # * Get Alignment
  #--------------------------------------------------------------------------
  def alignment
    return 1
  end
  #--------------------------------------------------------------------------
  # * Create Command List
  #--------------------------------------------------------------------------
  def make_command_list
    add_command($data_dialogue[MSCR::SYS::SAVEFILE_SAVETEXT], :save) if @command_type == :save
    add_command($data_dialogue[MSCR::SYS::SAVEFILE_LOADTEXT], :load) if @command_type == :load
    add_command(Vocab::cancel,   :cancel)
    add_command($data_dialogue[MSCR::SYS::SAVEFILE_DELETETEXT], :delete) if @command_type == :load && !SceneManager.scene_is?(Scene_Title)
  end

end #Window_System

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ███████╗ █████╗ ██╗   ██╗███████╗     ██████╗  █████╗ ███╗   ███╗███████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██╔════╝██╔══██╗██║   ██║██╔════╝    ██╔════╝ ██╔══██╗████╗ ████║██╔════╝
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ███████╗███████║██║   ██║█████╗      ██║  ███╗███████║██╔████╔██║█████╗
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ╚════██║██╔══██║╚██╗ ██╔╝██╔══╝      ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ███████║██║  ██║ ╚████╔╝ ███████╗    ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
class Scene_SaveGame < Scene_MenuBase

  #--------------------------------------------------------------------------
  # * Start Processing
  #--------------------------------------------------------------------------
  def start
    super
    @save_header = DataManager.make_save_header
    create_datacard_window
    create_command_window
  end
  #--------------------------------------------------------------------------
  # * Pre-Termination Processing
  #--------------------------------------------------------------------------
  def pre_terminate
    super
    close_command_window
  end
  #--------------------------------------------------------------------------
  # * Create Data Card Window
  #--------------------------------------------------------------------------
  def create_datacard_window
    @datacard_window = Window_FileDataCard.new
    @datacard_window.update_header(@save_header)
  end
  #--------------------------------------------------------------------------
  # * Create Command Window
  #--------------------------------------------------------------------------
  def create_command_window
    @command_window = Window_SaveLoadCommand.new(:save)
    @command_window.set_handler(:save,   method(:command_save))
    @command_window.set_handler(:cancel, method(:return_scene))
  end
  #--------------------------------------------------------------------------
  # * Close Command Window
  #--------------------------------------------------------------------------
  def close_command_window
    @command_window.close
    update until @command_window.close?
  end
  #--------------------------------------------------------------------------
  # * [Save] Command
  #--------------------------------------------------------------------------
  def command_save
    if DataManager.save_game(@save_header)
      on_save_success
    else
      Sound.play_buzzer
    end
  end
  #--------------------------------------------------------------------------
  # * Processing When Save Is Successful
  #--------------------------------------------------------------------------
  def on_save_success
    Sound.play_save
    return_scene
  end

end #Scene_SaveGame
