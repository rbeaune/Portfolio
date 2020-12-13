#==============================================================================
# Menu_LoadGame
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
  # * Initialize Module
  #--------------------------------------------------------------------------
  class << self; alias mscr_loadgame_datamanager_init init; end
  def self.init
    mscr_loadgame_datamanager_init
    refresh_savefile_hash
  end
  #--------------------------------------------------------------------------
  # * Load the global savefile hash to be referenced anywhere
  #   Automatically creates a "Saves" folder if one does not exist
  #--------------------------------------------------------------------------
  def self.refresh_savefile_hash
    check_savefile_directory
    $data_savefiles = {}
    Dir.foreach('Saves') do |filename|
      next if File.extname(filename) != ".rvdata2"
      File.open("Saves/#{filename}", "rb") do |file|
        $data_savefiles[filename] = Marshal.load(file)
      end
    end
    check_savefile_hash_size unless $data_savefiles.empty?
  end
  #--------------------------------------------------------------------------
  # * check_savefile_directory
  #--------------------------------------------------------------------------
  def self.check_savefile_directory
    Dir.mkdir("./Saves") unless File.exists?("./Saves")
  end
  #--------------------------------------------------------------------------
  # * check_savefile_hash_size
  #--------------------------------------------------------------------------
  def self.check_savefile_hash_size
    if $data_savefiles.size > savefile_max
      lastkey = $data_savefiles.keys[0]
      delete_save_file(lastkey)
      $data_savefiles.delete($data_savefiles.keys[0])
    end
  end
  #--------------------------------------------------------------------------
  # * Determine Existence of Save File
  #--------------------------------------------------------------------------
  def self.save_file_exists?
    !Dir.glob('Saves/*.rvdata2').empty?
  end
  #--------------------------------------------------------------------------
  # * savefile_max
  #--------------------------------------------------------------------------
  def self.savefile_max
    return MSCR::SYS::SAVEFILEMAX
  end
  #--------------------------------------------------------------------------
  # * Delete Save File
  #--------------------------------------------------------------------------
  def self.delete_save_file(filename)
    File.delete("Saves/#{filename}") rescue nil
    refresh_savefile_hash
  end
  #--------------------------------------------------------------------------
  # * Execute Load
  #--------------------------------------------------------------------------
  def self.load_game(filename)
    load_game_without_rescue(filename) rescue false
  end
  #--------------------------------------------------------------------------
  # * Execute Load (No Exception Processing)
  #--------------------------------------------------------------------------
  def self.load_game_without_rescue(filename)
    File.open("Saves/#{filename}", "rb") do |file|
      Marshal.load(file)
      extract_save_contents(Marshal.load(file))
      reload_map_if_updated
    end
    return true
  end

end #DataManager

#██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗    ███████╗██╗██╗     ███████╗    ███████╗███████╗██╗     ███████╗ ██████╗████████╗
#██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║    ██╔════╝██║██║     ██╔════╝    ██╔════╝██╔════╝██║     ██╔════╝██╔════╝╚══██╔══╝
#██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    █████╗  ██║██║     █████╗      ███████╗█████╗  ██║     █████╗  ██║        ██║
#██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║    ██╔══╝  ██║██║     ██╔══╝      ╚════██║██╔══╝  ██║     ██╔══╝  ██║        ██║
#╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝    ██║     ██║███████╗███████╗    ███████║███████╗███████╗███████╗╚██████╗   ██║
# ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝     ╚═╝     ╚═╝╚══════╝╚══════╝    ╚══════╝╚══════╝╚══════╝╚══════╝ ╚═════╝   ╚═╝
class Window_FileSelect < Window_Selectable

  include FileDataCard
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    dw = Graphics.width / 2 + 40
    dh = Graphics.height - 64
    dx = Graphics.width / 2 - dw / 2
    dy = 32
    super(dx,dy,dw,dh)
    self.arrows_visible = true
    select(item_max - 1)
  end
  #--------------------------------------------------------------------------
  # * Get Item Height
  #--------------------------------------------------------------------------
  def item_height
    128
  end
  #--------------------------------------------------------------------------
  # * item_max
  #--------------------------------------------------------------------------
  def item_max; return $data_savefiles.size; end
  #--------------------------------------------------------------------------
  # * item_rect
  #--------------------------------------------------------------------------
  def item_rect(index)
    rect = Rect.new
    rect.width = contents.width
    rect.height = 128
    rect.x = 0
    rect.y = index * rect.height
    return rect
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = $data_savefiles.keys[index]
    if item
      rect = item_rect(index)
      draw_card_contents(rect,$data_savefiles[item])
    end
  end
  #--------------------------------------------------------------------------
  # * get_item
  #--------------------------------------------------------------------------
  def get_item
    return $data_savefiles.keys[index]
  end

end #Window_FileSelect

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ██╗      ██████╗  █████╗ ██████╗      ██████╗  █████╗ ███╗   ███╗███████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██║     ██╔═══██╗██╔══██╗██╔══██╗    ██╔════╝ ██╔══██╗████╗ ████║██╔════╝
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ██║     ██║   ██║███████║██║  ██║    ██║  ███╗███████║██╔████╔██║█████╗
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██║     ██║   ██║██╔══██║██║  ██║    ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ███████╗╚██████╔╝██║  ██║██████╔╝    ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
class Scene_LoadGame < Scene_MenuBase

  #--------------------------------------------------------------------------
  # * Start Processing
  #--------------------------------------------------------------------------
  def start
    super
    create_command_window
    create_datacard_window
    create_filelist_window
  end
  #--------------------------------------------------------------------------
  # * Pre-Termination Processing
  #--------------------------------------------------------------------------
  def pre_terminate
    super
    close_command_window
  end
  #--------------------------------------------------------------------------
  # * Create Command Window
  #--------------------------------------------------------------------------
  def create_command_window
    @command_window = Window_SaveLoadCommand.new(:load)
    @command_window.set_handler(:load,   method(:command_load))
    @command_window.set_handler(:delete, method(:command_delete))
    @command_window.set_handler(:cancel, method(:command_loadcancel))
    @command_window.deactivate
    @command_window.hide
  end
  #--------------------------------------------------------------------------
  # * Create Data Card Window
  #--------------------------------------------------------------------------
  def create_datacard_window
    @datacard_window = Window_FileDataCard.new
    @datacard_window.hide
  end
  #--------------------------------------------------------------------------
  # * Create File List Window
  #--------------------------------------------------------------------------
  def create_filelist_window
    @filelist_window = Window_FileSelect.new
    @filelist_window.set_handler(:ok,     method(:on_file_ok))
    @filelist_window.set_handler(:cancel, method(:return_scene))
    @filelist_window.refresh
    @filelist_window.activate
  end
  #--------------------------------------------------------------------------
  # * Close Command Window
  #--------------------------------------------------------------------------
  def close_command_window
    @command_window.close
    update until @command_window.close?
  end
  #--------------------------------------------------------------------------
  # * [FileSelect] Command
  #--------------------------------------------------------------------------
  def on_file_ok
    @filelist_window.deactivate
    @filelist_window.hide
    @datacard_window.show
    @datacard_window.update_header($data_savefiles[@filelist_window.get_item])
    @command_window.show
    @command_window.activate
    @command_window.select(1)
  end
  #--------------------------------------------------------------------------
  # * [LoadCancel] Command
  #--------------------------------------------------------------------------
  def command_loadcancel
    @command_window.deactivate
    @command_window.hide
    @datacard_window.hide
    @filelist_window.show
    @filelist_window.activate
  end
  #--------------------------------------------------------------------------
  # * [Delete] Command
  #--------------------------------------------------------------------------
  def command_delete
    DataManager.delete_save_file(@filelist_window.get_item)
    @filelist_window.refresh
    command_loadcancel
  end
  #--------------------------------------------------------------------------
  # * [Load] Command
  #--------------------------------------------------------------------------
  def command_load
    if DataManager.load_game(@filelist_window.get_item)
      on_load_success
    else
      Sound.play_buzzer
    end
  end
  #--------------------------------------------------------------------------
  # * Processing When Load Is Successful
  #--------------------------------------------------------------------------
  def on_load_success
    Sound.play_load
    fadeout_all
    $game_system.on_after_load
    SceneManager.goto(Scene_Map)
  end

end #Scene_SaveGame
