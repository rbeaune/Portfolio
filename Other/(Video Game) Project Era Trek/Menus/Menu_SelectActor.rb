#===============================================================================
# Menu_SelectActor
# Edited    July 19 2019
#===============================================================================
#███████╗███████╗██╗     ███████╗ ██████╗████████╗     █████╗  ██████╗████████╗ ██████╗ ██████╗
#██╔════╝██╔════╝██║     ██╔════╝██╔════╝╚══██╔══╝    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
#███████╗█████╗  ██║     █████╗  ██║        ██║       ███████║██║        ██║   ██║   ██║██████╔╝
#╚════██║██╔══╝  ██║     ██╔══╝  ██║        ██║       ██╔══██║██║        ██║   ██║   ██║██╔══██╗
#███████║███████╗███████╗███████╗╚██████╗   ██║       ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║
#╚══════╝╚══════╝╚══════╝╚══════╝ ╚═════╝   ╚═╝       ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
class Window_SelectActor < Window_Selectable

  #--------------------------------------------------------------------------
  # public instance variables
  #--------------------------------------------------------------------------
  attr_accessor :info_window
  #--------------------------------------------------------------------------
  # * Includes module ActorRibbon
  #--------------------------------------------------------------------------
  include ActorRibbon
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(:left)
    self.z = 200
    @info_window = nil
    deactivate
    hide
  end
  #--------------------------------------------------------------------------
  # * info_window=
  #--------------------------------------------------------------------------
  def info_window=(window)
    @info_window = window
    update
  end
  #--------------------------------------------------------------------------
  # * activate
  #--------------------------------------------------------------------------
  alias mscr_window_selectactor_activate activate
  def activate
    mscr_window_selectactor_activate
    self.x = -self.width
    opening_animation
    @info_window.show.activate unless @info_window.nil?
    @info_window.x = self.width * 2 unless @info_window.nil?
    @info_window.opening_animation unless @info_window.nil?
  end
  #--------------------------------------------------------------------------
  # * deactivate
  #--------------------------------------------------------------------------
  alias mscr_window_selectactor_deactivate deactivate
  def deactivate
    mscr_window_selectactor_deactivate
    @info_window.hide.deactivate unless @info_window.nil?
  end
  #--------------------------------------------------------------------------
  # * Processing When OK Button Is Pressed
  #--------------------------------------------------------------------------
  def process_ok
    $game_party.target_actor = $game_party.members[index] unless @cursor_all
    call_ok_handler
  end
  #--------------------------------------------------------------------------
  # * Restore Previous Selection Position
  #--------------------------------------------------------------------------
  def select_last
    select($game_party.target_actor.index || 0)
  end
  #--------------------------------------------------------------------------
  # * Set Position of Cursor for Item
  #--------------------------------------------------------------------------
  def select_for_item(item)
    @cursor_fix = item.for_user?
    @cursor_all = item.for_all?
    if @cursor_fix
      select($game_party.menu_actor.index)
    elsif @cursor_all
      select(0)
    else
      select_last
    end
  end

end #Window_MenuActor

#███████╗███████╗██╗     ███████╗ ██████╗████████╗     █████╗  ██████╗████████╗ ██████╗ ██████╗     ██╗███╗   ██╗███████╗ ██████╗
#██╔════╝██╔════╝██║     ██╔════╝██╔════╝╚══██╔══╝    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗    ██║████╗  ██║██╔════╝██╔═══██╗
#███████╗█████╗  ██║     █████╗  ██║        ██║       ███████║██║        ██║   ██║   ██║██████╔╝    ██║██╔██╗ ██║█████╗  ██║   ██║
#╚════██║██╔══╝  ██║     ██╔══╝  ██║        ██║       ██╔══██║██║        ██║   ██║   ██║██╔══██╗    ██║██║╚██╗██║██╔══╝  ██║   ██║
#███████║███████╗███████╗███████╗╚██████╗   ██║       ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║    ██║██║ ╚████║██║     ╚██████╔╝
#╚══════╝╚══════╝╚══════╝╚══════╝ ╚═════╝   ╚═╝       ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝
class Window_SelectActorInfo < Window_Base

  #--------------------------------------------------------------------------
  # initialize
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height)
    super(x, y, width, height)
    self.z = 200
    refresh
  end

  def opening_animation
    @new_x = 120
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
  # draw_window_contents
  #--------------------------------------------------------------------------
  def draw_window_contents
    dh = 96
    for i in 0...$game_party.all_members.size
      actor = $game_party.all_members[i]
      draw_level(32, (dh * i) + 4, actor, 24)
      draw_stat_gauge(8, (dh * i) + 20, (self.width - 40),
                      "#{Vocab::hp}:", "#{actor.hp} /#{actor.mhp}", actor.hp_rate, MSCR::SYS::HP_GAUGE_COLOR, 10)
      draw_stat_gauge(8, (dh * i) + 50, (self.width - 40),
                      "#{Vocab::mp}:", "#{actor.mp} /#{actor.mmp}", actor.mp_rate, MSCR::SYS::MP_GAUGE_COLOR, 10)
    end
  end

end #Window_SelectActorInfo

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ██╗████████╗███████╗███╗   ███╗    ██████╗  █████╗ ███████╗███████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██║╚══██╔══╝██╔════╝████╗ ████║    ██╔══██╗██╔══██╗██╔════╝██╔════╝
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ██║   ██║   █████╗  ██╔████╔██║    ██████╔╝███████║███████╗█████╗
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██║   ██║   ██╔══╝  ██║╚██╔╝██║    ██╔══██╗██╔══██║╚════██║██╔══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ██║   ██║   ███████╗██║ ╚═╝ ██║    ██████╔╝██║  ██║███████║███████╗
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚═╝   ╚═╝   ╚══════╝╚═╝     ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
class Scene_ItemBase < Scene_MenuBase

  #--------------------------------------------------------------------------
  # * alias start
  #--------------------------------------------------------------------------
  alias mscr_sceneitembase_start start
  def start
    mscr_sceneitembase_start
    create_actorinfo_window
  end
  #--------------------------------------------------------------------------
  # * create_actor_window
  #--------------------------------------------------------------------------
  def create_actor_window
    @actor_window = Window_SelectActor.new
    @actor_window.set_handler(:ok,     method(:on_actor_ok))
    @actor_window.set_handler(:cancel, method(:on_actor_cancel))
  end
  #--------------------------------------------------------------------------
  # * create_actorinfo_window
  #--------------------------------------------------------------------------
  def create_actorinfo_window
    dw = 240
    dx = @actor_window.width + (dw / 2)
    dy = @actor_window.y
    dh = @actor_window.height
    @actorinfo_window = Window_SelectActorInfo.new(dx, dy, dw, dh)
    @actorinfo_window.hide.deactivate
    @actor_window.info_window = @actorinfo_window
  end
  #--------------------------------------------------------------------------
  # * show_sub_window
  #--------------------------------------------------------------------------
  def show_sub_window(window)
    window.show.activate
    window.opening_animation
  end
  #--------------------------------------------------------------------------
  # * hide_sub_window
  #--------------------------------------------------------------------------
  def hide_sub_window(window)
    window.hide.deactivate
    activate_item_window
  end
  #--------------------------------------------------------------------------
  # * alias use_item
  #--------------------------------------------------------------------------
  alias mscr_sceneitembase_useitem use_item
  def use_item
    mscr_sceneitembase_useitem
    @actorinfo_window.refresh
  end

end #Scene_ItemBase
