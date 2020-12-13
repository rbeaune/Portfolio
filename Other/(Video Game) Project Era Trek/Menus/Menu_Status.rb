#===============================================================================
# Menu_Status
# Edited    May 25 2020
#===============================================================================
#███████╗████████╗ █████╗ ████████╗██╗   ██╗███████╗     ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗
#██╔════╝╚══██╔══╝██╔══██╗╚══██╔══╝██║   ██║██╔════╝    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗
#███████╗   ██║   ███████║   ██║   ██║   ██║███████╗    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║
#╚════██║   ██║   ██╔══██║   ██║   ██║   ██║╚════██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║
#███████║   ██║   ██║  ██║   ██║   ╚██████╔╝███████║    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝
#╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚══════╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝
class Window_StatusCommand < Window_Selectable

  #--------------------------------------------------------------------------
  # public instance variables
  #--------------------------------------------------------------------------
  attr_accessor :info_window
  #--------------------------------------------------------------------------
  # * Includes ActorRibbon module
  #--------------------------------------------------------------------------
  include ActorRibbon
  #--------------------------------------------------------------------------
  # info_window=
  #--------------------------------------------------------------------------
  def info_window=(window)
    @info_window = window
    update
  end
  #--------------------------------------------------------------------------
  # * process_ok
  #--------------------------------------------------------------------------
  def process_ok
  end
  #--------------------------------------------------------------------------
  # * Move Cursor Left
  #--------------------------------------------------------------------------
  alias mscr_window_statuscommand_cursor_left cursor_left
  def cursor_left(wrap = true)
    mscr_window_statuscommand_cursor_left(wrap)
    @info_window.index = @index
  end
  #--------------------------------------------------------------------------
  # * Move Cursor Right
  #--------------------------------------------------------------------------
  alias mscr_window_statuscommand_cursor_right cursor_right
  def cursor_right(wrap = true)
    mscr_window_statuscommand_cursor_right(wrap)
    @info_window.index = @index
  end

end #Window_StatusCommand

#███████╗████████╗ █████╗ ████████╗██╗   ██╗███████╗    ██╗███╗   ██╗███████╗ ██████╗
#██╔════╝╚══██╔══╝██╔══██╗╚══██╔══╝██║   ██║██╔════╝    ██║████╗  ██║██╔════╝██╔═══██╗
#███████╗   ██║   ███████║   ██║   ██║   ██║███████╗    ██║██╔██╗ ██║█████╗  ██║   ██║
#╚════██║   ██║   ██╔══██║   ██║   ██║   ██║╚════██║    ██║██║╚██╗██║██╔══╝  ██║   ██║
#███████║   ██║   ██║  ██║   ██║   ╚██████╔╝███████║    ██║██║ ╚████║██║     ╚██████╔╝
#╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚══════╝    ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝
class Window_StatusInfo < Window_Base

  #--------------------------------------------------------------------------
  # initialize
  #--------------------------------------------------------------------------
  def initialize
    dy = fitting_height(4)
    dw = Graphics.width / 1.5
    dx = Graphics.width / 2 - dw / 2
    dh = Graphics.height - dy
    super(dx, dy, dw, dh)
    @index = 0
    refresh
  end
  #--------------------------------------------------------------------------
  # refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    reset_font_settings
    draw_window_contents
  end
  #--------------------------------------------------------------------------
  # index=
  #--------------------------------------------------------------------------
  def index=(index)
    @index = index
    refresh
  end
  #--------------------------------------------------------------------------
  # draw_window_contents
  #--------------------------------------------------------------------------
  def draw_window_contents
    page_general
  end
  #--------------------------------------------------------------------------
  # page_general
  #--------------------------------------------------------------------------
  def page_general
    actor = $game_party.all_members[@index]
    draw_text(0,0,self.width,line_height,actor.name,1)
    draw_level(self.width/2-40,24,actor)
    draw_level_progress(self.width/2-120,48,240,actor)
    draw_apparel(106,92,actor)
    draw_stat_gauge(self.width/2-112,176,224,"#{Vocab::hp}:","#{actor.hp} /#{actor.mhp}",actor.hp_rate,
                    MSCR::SYS::HP_GAUGE_COLOR)
    draw_main_stats(self.width/2-120,224,actor)
    draw_stat_gauge(18,self.height-line_height*3,self.width-64,"#{Vocab::mp}:","#{actor.mp} /#{actor.mmp}",actor.mp_rate,
                    MSCR::SYS::MP_GAUGE_COLOR) unless actor.mmp <= 0
  end
  #--------------------------------------------------------------------------
  # draw_apparel
  #--------------------------------------------------------------------------
  def draw_apparel(x, y, actor)
    actor.equips[0].nil? ? draw_text(x+28, y, 172, line_height, $data_dialogue[MSCR::WINDOWS::STATUS_NOWEAP],1)
    : draw_item_name(actor.equips[0], x+28, y, true, 200)
    actor.equips[1].nil? ? draw_text(x+28, y + 26, 172, line_height, $data_dialogue[MSCR::WINDOWS::STATUS_NOARM],1)
    : draw_item_name(actor.equips[1], x+28, y + 26, true, 200)
    actor.equips[2].nil? ? draw_text(x+28, y + 52, 172, line_height, $data_dialogue[MSCR::WINDOWS::STATUS_NOACC],1)
    : draw_item_name(actor.equips[2], x+28, y + 52, true, 200)
  end
  #--------------------------------------------------------------------------
  # draw_main_stats
  #--------------------------------------------------------------------------
  def draw_main_stats(x, y, actor)
    n = 0
    for i in 2..7
      dx = (n % 2 == 0 ? x : x + 128)
      dy = y + line_height * ((n % 2 == 1 ? n - 1 : n) / 2)
      change_color(system_color)
      draw_text(dx,dy,128,line_height,"#{Vocab::param(i)}:")
      change_color(normal_color)
      draw_text(dx,dy,112,line_height,"#{actor.param(i)}",2)
      n += 1
    end
  end

end #Window_StatusInfo

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ███████╗████████╗ █████╗ ████████╗██╗   ██╗███████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██╔════╝╚══██╔══╝██╔══██╗╚══██╔══╝██║   ██║██╔════╝
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ███████╗   ██║   ███████║   ██║   ██║   ██║███████╗
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ╚════██║   ██║   ██╔══██║   ██║   ██║   ██║╚════██║
#███████║╚██████╗███████╗██║ ╚████║███████╗    ███████║   ██║   ██║  ██║   ██║   ╚██████╔╝███████║
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚══════╝
class Scene_Status < Scene_MenuBase

  #--------------------------------------------------------------------------
  # start
  #--------------------------------------------------------------------------
  def start
    super
    create_command_window
    create_info_window
  end
  #--------------------------------------------------------------------------
  # create_command_window
  #--------------------------------------------------------------------------
  def create_command_window
    @command_window = Window_StatusCommand.new
    @command_window.viewport = @viewport
    @command_window.set_handler(:cancel,   method(:return_scene))
  end
  #--------------------------------------------------------------------------
  # create_info_window
  #--------------------------------------------------------------------------
  def create_info_window
    @info_window = Window_StatusInfo.new
    @info_window.viewport = @viewport
    @info_window.z -= 1
    @command_window.info_window = @info_window
  end

end #Scene_Status
