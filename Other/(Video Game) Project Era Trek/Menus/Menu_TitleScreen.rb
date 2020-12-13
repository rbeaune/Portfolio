#==============================================================================
# Menu_TitleScreen
# Edited    May 1 2020
#==============================================================================
#████████╗██╗████████╗██╗     ███████╗     ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗
#╚══██╔══╝██║╚══██╔══╝██║     ██╔════╝    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗
#   ██║   ██║   ██║   ██║     █████╗      ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║
#   ██║   ██║   ██║   ██║     ██╔══╝      ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║
#   ██║   ██║   ██║   ███████╗███████╗    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝
#   ╚═╝   ╚═╝   ╚═╝   ╚══════╝╚══════╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝
class Window_TitleCommand < Window_Command

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(Graphics.width,0)
    update_placement
    select_symbol(:new_game) if !continue_enabled
  end
  def opening_animation
    @slide_speed = 20
    @new_x = Graphics.width - window_width
  end

  def closing_animation
    @new_x = Graphics.width
  end
  #--------------------------------------------------------------------------
  # * Get Item Height
  #--------------------------------------------------------------------------
  def item_height
    line_height * 2
  end
  #--------------------------------------------------------------------------
  # * Update Window Position
  #--------------------------------------------------------------------------
  def update_placement
    self.height = @list.size * item_height + line_height
    self.y = (Graphics.height / 2) - (self.height / 2)
  end
  #--------------------------------------------------------------------------
  # * Get Window Width
  #--------------------------------------------------------------------------
  def window_width
    return 224
  end
  #--------------------------------------------------------------------------
  # * Get Alignment
  #--------------------------------------------------------------------------
  def alignment
    return 1
  end
  def back_opacity
    return 0
  end
  #--------------------------------------------------------------------------
  # * Create Command List
  #--------------------------------------------------------------------------
  def make_command_list
    add_command(Vocab::continue, :continue, continue_enabled)
    add_command(Vocab::new_game, :new_game)
    add_command($data_dialogue[MSCR::WINDOWS::SYSTEMCAT_LOAD], :load_game, continue_enabled)
    add_command($data_dialogue[MSCR::WINDOWS::SYSTEMCAT_OPTN], :options, false)
    add_command($data_dialogue[MSCR::WINDOWS::SYSTEMCAT_CRED], :credits, false)
    add_command(Vocab::shutdown, :shutdown)
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index)
    change_color(normal_color, command_enabled?(index))
    contents.font.size = 32
    draw_text(item_rect_for_text(index), command_name(index), alignment)
    reset_font_settings
  end

end #Window_TitleCommand

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ████████╗██╗████████╗██╗     ███████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ╚══██╔══╝██║╚══██╔══╝██║     ██╔════╝
#███████╗██║     █████╗  ██╔██╗ ██║█████╗         ██║   ██║   ██║   ██║     █████╗
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝         ██║   ██║   ██║   ██║     ██╔══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗       ██║   ██║   ██║   ███████╗███████╗
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝       ╚═╝   ╚═╝   ╚═╝   ╚══════╝╚══════╝
class Scene_Title < Scene_Base

  #--------------------------------------------------------------------------
  # * Start Processing
  #--------------------------------------------------------------------------
  def start
    super
    SceneManager.clear
    Graphics.freeze
    create_background
    create_foreground
    create_command_window
    #command_new_game if MSCR::SKIPTITLE
    create_load_command_window
    create_datacard_window
    play_title_music
  end
  #--------------------------------------------------------------------------
  # * Draw Game Title
  #--------------------------------------------------------------------------
  def draw_game_title
    @foreground_sprite.bitmap.font.size = 70
    rect = Rect.new(0, 0, Graphics.width, 64)
    @foreground_sprite.bitmap.draw_text(rect, $data_system.game_title)
  end
  #--------------------------------------------------------------------------
  # * Create Command Window
  #--------------------------------------------------------------------------
  def create_command_window
    @command_window = Window_TitleCommand.new
    @command_window.set_handler(:continue, method(:command_continue))
    @command_window.set_handler(:new_game, method(:command_new_game))
    @command_window.set_handler(:load_game,method(:command_load_game))
    @command_window.set_handler(:options,  method(:command_options))
    @command_window.set_handler(:credits,  method(:command_credits))
    @command_window.set_handler(:shutdown, method(:command_shutdown))
  end
  #--------------------------------------------------------------------------
  # * Create Load Command Window
  #--------------------------------------------------------------------------
  def create_load_command_window
    @load_command_window = Window_SaveLoadCommand.new(:load)
    @load_command_window.set_handler(:load,   method(:command_load))
    @load_command_window.set_handler(:cancel, method(:command_loadcancel))
    @load_command_window.deactivate
    @load_command_window.hide
  end
  #--------------------------------------------------------------------------
  # * Create Data Card Window
  #--------------------------------------------------------------------------
  def create_datacard_window
    @datacard_window = Window_FileDataCard.new
    @datacard_window.hide
  end
  #--------------------------------------------------------------------------
  # * Close Command Window
  #--------------------------------------------------------------------------
  def close_command_window
    @command_window.close
    update until @command_window.close?
  end
  #--------------------------------------------------------------------------
  # * [Continue] Command
  #--------------------------------------------------------------------------
  def command_continue
    @command_window.deactivate
    @command_window.hide
    @datacard_window.show
    @datacard_window.update_header($data_savefiles[$data_savefiles.keys.last])
    @load_command_window.show
    @load_command_window.activate
    @load_command_window.select(1)
  end
  #--------------------------------------------------------------------------
  # * [New Game] Command
  #--------------------------------------------------------------------------
  def command_new_game
    DataManager.setup_new_game
    close_command_window
    fadeout_all
    $game_map.autoplay
    SceneManager.goto(Scene_Map)
  end
  #--------------------------------------------------------------------------
  # * [Load Game] Command
  #--------------------------------------------------------------------------
  def command_load_game
    close_command_window
    SceneManager.call(Scene_LoadGame)
  end
  #--------------------------------------------------------------------------
  # * [Options] Command
  #--------------------------------------------------------------------------
  def command_options
    puts "command_options UNIMPLEMENTED"
  end
  #--------------------------------------------------------------------------
  # * [Credits] Command
  #--------------------------------------------------------------------------
  def command_credits
    puts "command_credits UNIMPLEMENTED"
  end
  #--------------------------------------------------------------------------
  # * [Shut Down] Command
  #--------------------------------------------------------------------------
  def command_shutdown
    close_command_window
    fadeout_all
    SceneManager.exit
  end
  #--------------------------------------------------------------------------
  # * [Shut Down] Command
  #--------------------------------------------------------------------------
  def command_load
    if DataManager.load_game($data_savefiles.keys.last)
      on_load_success
    else
      Sound.play_buzzer
    end
  end
  #--------------------------------------------------------------------------
  # * [Loadcancel] Command
  #--------------------------------------------------------------------------
  def command_loadcancel
    @load_command_window.deactivate
    @load_command_window.hide
    @datacard_window.hide
    @command_window.show
    @command_window.activate
  end
  #--------------------------------------------------------------------------
  # * Play Title Screen Music
  #--------------------------------------------------------------------------
  def play_title_music
    $data_system.title_bgm.play
    RPG::BGS.stop
    RPG::ME.stop
  end

end #Scene_Title
