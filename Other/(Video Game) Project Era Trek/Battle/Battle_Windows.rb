#===============================================================================
# Battle_Windows
# Edited    April 3 2020
#===============================================================================
#██████╗  █████╗ ████████╗████████╗██╗     ███████╗    ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗
#██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗
#██████╔╝███████║   ██║      ██║   ██║     █████╗      ██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝
#██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝      ██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗
#██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║
#╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
module BattleManager

  #--------------------------------------------------------------------------
  # * Battle Start
  #--------------------------------------------------------------------------
  def self.battle_start
    $game_system.battle_count += 1
    $game_party.on_battle_start
    $game_troop.on_battle_start
    wait_for_message
  end

end #BattleManager

#██████╗  █████╗ ████████╗████████╗██╗     ███████╗    ███████╗████████╗ █████╗ ████████╗██╗   ██╗███████╗███████╗███████╗
#██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝    ██╔════╝╚══██╔══╝██╔══██╗╚══██╔══╝██║   ██║██╔════╝██╔════╝██╔════╝
#██████╔╝███████║   ██║      ██║   ██║     █████╗      ███████╗   ██║   ███████║   ██║   ██║   ██║███████╗█████╗  ███████╗
#██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝      ╚════██║   ██║   ██╔══██║   ██║   ██║   ██║╚════██║██╔══╝  ╚════██║
#██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗    ███████║   ██║   ██║  ██║   ██║   ╚██████╔╝███████║███████╗███████║
#╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝    ╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚══════╝
class Window_BattleStatuses < Window_Base

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(-16,-16,Graphics.width,Graphics.height)
    self.opacity = 0
    @members = $game_party.battle_members
  end
  #--------------------------------------------------------------------------
  # * refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    reset_font_settings
    draw_battle_info
  end
  #--------------------------------------------------------------------------
  # * draw_battle_info
  #--------------------------------------------------------------------------
  def draw_battle_info
    draw_mana
    draw_health
    draw_states
  end
  #--------------------------------------------------------------------------
  # * draw_mana
  #--------------------------------------------------------------------------
  def draw_mana
    actor = $game_actors[1]
    draw_stat_gauge(8,0,192,"#{Vocab::mp}:","#{actor.mp} /#{actor.mmp}",actor.mp_rate,MSCR::SYS::MP_GAUGE_COLOR,10)
  end
  #--------------------------------------------------------------------------
  # * draw_health
  #--------------------------------------------------------------------------
  def draw_health
    @members.each_with_index do |member, i|
      #draw_stat_gauge(8,42+(41*i),136,"","#{member.hp} /#{member.mhp}",member.hp_rate,MSCR::SYS::HP_GAUGE_COLOR,10)
      draw_stat_gauge(144+(128*i),Graphics.height-84,120,"","#{member.hp} /#{member.hp}",member.hp_rate,MSCR::SYS::HP_GAUGE_COLOR,10)
    end
  end
  #--------------------------------------------------------------------------
  # * draw_states
  #--------------------------------------------------------------------------
  def draw_states
    @members.each_with_index do |member, i|
      draw_actor_icons(member,208+(128*i),Graphics.height-104)
    end
  end

end #Window_BattleStatuses

#██████╗  █████╗ ████████╗████████╗██╗     ███████╗    ██╗      ██████╗  ██████╗
#██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝    ██║     ██╔═══██╗██╔════╝
#██████╔╝███████║   ██║      ██║   ██║     █████╗      ██║     ██║   ██║██║  ███╗
#██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝      ██║     ██║   ██║██║   ██║
#██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗    ███████╗╚██████╔╝╚██████╔╝
#╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝    ╚══════╝ ╚═════╝  ╚═════╝
class Window_BattleLog < Window_Selectable

  #--------------------------------------------------------------------------
  # * Draw Background
  #--------------------------------------------------------------------------
  def draw_background
  end

end #Window_BattleLog

# █████╗  ██████╗████████╗ ██████╗ ██████╗      ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗
#██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗
#███████║██║        ██║   ██║   ██║██████╔╝    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║
#██╔══██║██║        ██║   ██║   ██║██╔══██╗    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║
#██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝
#╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝
class Window_ActorHorzCommand < Window_HorzCommand

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(0,0)
  end
  #--------------------------------------------------------------------------
  # * window_width
  #--------------------------------------------------------------------------
  def window_width
    return Graphics.width
  end
  #--------------------------------------------------------------------------
  # * Sets to 5 Columns
  #--------------------------------------------------------------------------
  def col_max
    return 5
  end
  #--------------------------------------------------------------------------
  # * Create Command List
  #--------------------------------------------------------------------------
  def make_command_list
    return unless @actor
    add_command(Vocab::attack,  :attack, @actor.attack_usable?)
    add_command(Vocab::skill,   :skill)
    add_command(Vocab::item,    :item)
    add_command(Vocab::guard,   :guard, @actor.guard_usable?)
    add_command(Vocab::escape,  :escape, BattleManager.can_escape?)
  end
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(actor)
    @actor = actor
    clear_command_list
    make_command_list
    refresh
    select(0)
    activate
    open
  end

end #Window_ActorHorzCommand

# █████╗  ██████╗████████╗ ██████╗ ██████╗      █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗
#██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗    ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║
#███████║██║        ██║   ██║   ██║██████╔╝    ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║
#██╔══██║██║        ██║   ██║   ██║██╔══██╗    ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║
#██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║    ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║
#╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
class Window_ActorAction < Window_Base

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(0,0,255,fitting_height(1))
    self.arrows_visible = false
    @text = ""
    @icon = nil
    hide
  end
  #--------------------------------------------------------------------------
  # * update_info
  #--------------------------------------------------------------------------
  def update_info
    action = BattleManager.actor.current_action.item
    if action == $data_skills[1]
      if BattleManager.actor.equips[0].nil?
        @text = $data_dialogue[MSCR::BATTLE::BATTLEWINDOWTEXT_UNARMED]
        @icon = action.icon_index
      else
        @text = BattleManager.actor.equips[0].name
        @icon = BattleManager.actor.equips[0].icon_index
      end
    else
      @text = action.name
      @icon = action.icon_index
    end
  end
  #--------------------------------------------------------------------------
  # * adjust_width
  #--------------------------------------------------------------------------
  def adjust_width
    self.width = 64 + text_size(@text).width
    self.x = BattleManager.actor.screen_x - ((self.width / 2) / 2) + 12
  end
  #--------------------------------------------------------------------------
  # * Draws the weapon info
  #--------------------------------------------------------------------------
  def draw_info
    draw_icon(@icon,0,0)
    draw_text(32,0,width,line_height,@text)
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    update_info
    adjust_width
    draw_info
  end
  #--------------------------------------------------------------------------
  # * show
  #--------------------------------------------------------------------------
  def show
    super
    refresh
  end

end

#██████╗  █████╗ ████████╗████████╗██╗     ███████╗    ██╗████████╗███████╗███╗   ███╗
#██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝    ██║╚══██╔══╝██╔════╝████╗ ████║
#██████╔╝███████║   ██║      ██║   ██║     █████╗      ██║   ██║   █████╗  ██╔████╔██║
#██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝      ██║   ██║   ██╔══╝  ██║╚██╔╝██║
#██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗    ██║   ██║   ███████╗██║ ╚═╝ ██║
#╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝    ╚═╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
class Window_BattleItem < Window_ItemList

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(0, 0, 256, fitting_height(4))
    hide
  end
  #--------------------------------------------------------------------------
  # * Include in Item List?
  #--------------------------------------------------------------------------
  def include?(item)
    $game_party.usable?(item)
  end
  #--------------------------------------------------------------------------
  # * Show Window
  #--------------------------------------------------------------------------
  def show
    select(0)
    super
  end
  #--------------------------------------------------------------------------
  # * Hide Window
  #--------------------------------------------------------------------------
  def hide
    super
  end

end #Window_BattleItemList

#██████╗  █████╗ ████████╗████████╗██╗     ███████╗    ███████╗██╗  ██╗██╗██╗     ██╗
#██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝    ██╔════╝██║ ██╔╝██║██║     ██║
#██████╔╝███████║   ██║      ██║   ██║     █████╗      ███████╗█████╔╝ ██║██║     ██║
#██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝      ╚════██║██╔═██╗ ██║██║     ██║
#██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗    ███████║██║  ██╗██║███████╗███████╗
#╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝    ╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝
class Window_BattleSkill < Window_SkillList

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super
    self.height = fitting_height(4)
    hide
  end
  #--------------------------------------------------------------------------
  # * Show Window
  #--------------------------------------------------------------------------
  def show
    select(0)
    super
  end
  #--------------------------------------------------------------------------
  # * Hide Window
  #--------------------------------------------------------------------------
  def hide
    super
  end

end #Window_BattleSkillList

#██████╗  █████╗ ████████╗████████╗██╗     ███████╗     █████╗  ██████╗████████╗ ██████╗ ██████╗ ███████╗
#██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
#██████╔╝███████║   ██║      ██║   ██║     █████╗      ███████║██║        ██║   ██║   ██║██████╔╝███████╗
#██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝      ██╔══██║██║        ██║   ██║   ██║██╔══██╗╚════██║
#██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗    ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║███████║
#╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
class Window_BattleActors < Window_Selectable

  #-------------------------------------------------------------------------
  # * Object Initialization
  #-------------------------------------------------------------------------
  def initialize
    super(-32,-32,10,10)
    hide
  end
  #--------------------------------------------------------------------------
  # * Get Item
  #--------------------------------------------------------------------------
  def item
    $game_party.battle_members[@index]
  end
  #--------------------------------------------------------------------------
  # * Get Number of Items
  #--------------------------------------------------------------------------
  def item_max
    $game_party.battle_members.size
  end
  #--------------------------------------------------------------------------
  # * Cursor Movement Processing
  #--------------------------------------------------------------------------
  def process_cursor_move
    return unless cursor_movable?
    last_index = @index
    cursor_down(Input.trigger?(:DOWN) || Input.trigger?(:RIGHT))  if Input.repeat?(:DOWN) || Input.repeat?(:RIGHT)
    cursor_up(Input.trigger?(:UP) || Input.trigger?(:LEFT))       if Input.repeat?(:UP) || Input.trigger?(:LEFT)
    Sound.play_cursor if @index != last_index
  end
  #--------------------------------------------------------------------------
  # * Update Cursor Position
  #--------------------------------------------------------------------------
  def update_cursor_position
    return if !can_update_cursor_position?
    $game_temp.menu_cursor[2] = item.screen_x
    $game_temp.menu_cursor[3] = item.screen_y + 32
    $game_temp.menu_cursor[1] = 13
    item.sprite_effect_type = :whiten
  end
  #--------------------------------------------------------------------------
  # * Show Window
  #--------------------------------------------------------------------------
  def show
    select(0)
    super
  end

end #Window_BattleActors

#██████╗  █████╗ ████████╗████████╗██╗     ███████╗    ███████╗███╗   ██╗███████╗███╗   ███╗██╗   ██╗███████╗
#██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝    ██╔════╝████╗  ██║██╔════╝████╗ ████║╚██╗ ██╔╝██╔════╝
#██████╔╝███████║   ██║      ██║   ██║     █████╗      █████╗  ██╔██╗ ██║█████╗  ██╔████╔██║ ╚████╔╝ ███████╗
#██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝      ██╔══╝  ██║╚██╗██║██╔══╝  ██║╚██╔╝██║  ╚██╔╝  ╚════██║
#██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗    ███████╗██║ ╚████║███████╗██║ ╚═╝ ██║   ██║   ███████║
#╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝    ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝     ╚═╝   ╚═╝   ╚══════╝
class Window_BattleEnemys < Window_Selectable

  #-------------------------------------------------------------------------
  # * Object Initialization
  #-------------------------------------------------------------------------
  def initialize
    super(-32,-32,10,10)
    hide
  end
  #--------------------------------------------------------------------------
  # * Get Item
  #--------------------------------------------------------------------------
  def enemy
    $game_troop.alive_members[@index]
  end
  #--------------------------------------------------------------------------
  # * Get Number of Items
  #--------------------------------------------------------------------------
  def item_max
    $game_troop.alive_members.size
  end
  #--------------------------------------------------------------------------
  # * Cursor Movement Processing
  #--------------------------------------------------------------------------
  def process_cursor_move
    return unless cursor_movable?
    last_index = @index
    cursor_down(Input.trigger?(:DOWN) || Input.trigger?(:RIGHT))  if Input.repeat?(:DOWN) || Input.repeat?(:RIGHT)
    cursor_up(Input.trigger?(:UP) || Input.trigger?(:LEFT))       if Input.repeat?(:UP) || Input.trigger?(:LEFT)
    Sound.play_cursor if @index != last_index
  end
  #--------------------------------------------------------------------------
  # * Update Cursor Position
  #--------------------------------------------------------------------------
  def update_cursor_position
    return if !can_update_cursor_position?
    $game_temp.menu_cursor[2] = enemy.screen_x - 35
    $game_temp.menu_cursor[3] = enemy.screen_y - 64
    $game_temp.menu_cursor[1] = 13
    enemy.sprite_effect_type = :whiten
  end
  #--------------------------------------------------------------------------
  # * Show Window
  #--------------------------------------------------------------------------
  def show
    select(0)
    super
  end

end #Window_BattleEnemys

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ██████╗  █████╗ ████████╗████████╗██╗     ███████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ██████╔╝███████║   ██║      ██║   ██║     █████╗
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝
class Scene_Battle < Scene_Base

  #--------------------------------------------------------------------------
  # * Update Information Display Viewport
  #--------------------------------------------------------------------------
  def update_info_viewport
  end
  #--------------------------------------------------------------------------
  # * Move Information Display Viewport
  #--------------------------------------------------------------------------
  def move_info_viewport(ox)
    current_ox = @info_viewport.ox
    @info_viewport.ox = [ox, current_ox + 16].min if current_ox < ox
    @info_viewport.ox = [ox, current_ox - 16].max if current_ox > ox
  end
  #--------------------------------------------------------------------------
  # * Update Processing for Opening Message Window
  #    Set openness to 0 until the status window and so on are finished closing.
  #--------------------------------------------------------------------------
  def update_message_open
    if $game_message.busy? && !@actor_command_window.close?
      @message_window.openness = 0
      @actor_command_window.close
    end
  end
  #--------------------------------------------------------------------------
  # * Create All Windows - OVERWRITTEN IN Battle_VictoryWindows.rb
  #--------------------------------------------------------------------------
  # def create_all_windows
  #   create_message_window
  #   create_log_window
  #   create_status_window
  #   create_info_viewport
  #   create_actor_command_window
  #   create_actoraction_window
  #   create_skill_window
  #   create_item_window
  #   create_actor_window
  #   create_enemy_window
  #   @log_window.visible = false
  # end
  #--------------------------------------------------------------------------
  # * Create Message Window
  #--------------------------------------------------------------------------
  def create_message_window
    @message_window = Window_Message.new
  end
  #--------------------------------------------------------------------------
  # * Create Status Window
  #--------------------------------------------------------------------------
  def create_status_window
    @status_window = Window_BattleStatuses.new
  end
  #--------------------------------------------------------------------------
  # * Create Information Display Viewport
  #--------------------------------------------------------------------------
  def create_info_viewport
    @info_viewport = Viewport.new
    @info_viewport.rect.y = Graphics.height - @status_window.height
    @info_viewport.rect.height = @status_window.height
    @info_viewport.z = 100
    @info_viewport.ox = 64
  end
  #--------------------------------------------------------------------------
  # * Create Actor Commands Window
  #--------------------------------------------------------------------------
  def create_actor_command_window
    @actor_command_window = Window_ActorHorzCommand.new
    @actor_command_window.set_handler(:attack, method(:command_attack))
    @actor_command_window.set_handler(:skill,  method(:command_skill))
    @actor_command_window.set_handler(:guard,  method(:command_guard))
    @actor_command_window.set_handler(:item,   method(:command_item))
    @actor_command_window.set_handler(:escape, method(:command_escape))
    @actor_command_window.y = (Graphics.height - @actor_command_window.height)
  end
  #--------------------------------------------------------------------------
  # * Create Weapon Window
  #--------------------------------------------------------------------------
  def create_actoraction_window
    @actoraction_window = Window_ActorAction.new
    @actoraction_window.y = Graphics.height - (@actor_command_window.height + @actoraction_window.height)
  end
  #--------------------------------------------------------------------------
  # * Create Skill Window
  #--------------------------------------------------------------------------
  def create_skill_window
    @skill_window = Window_BattleSkill.new
    @skill_window.set_handler(:ok,     method(:on_skill_ok))
    @skill_window.set_handler(:cancel, method(:on_skill_cancel))
    @skill_window.x = (Graphics.width - (@skill_window.width + 255))
    @skill_window.y = (Graphics.height - (@actor_command_window.height + @skill_window.height))
  end
  #--------------------------------------------------------------------------
  # * Create Item Window
  #--------------------------------------------------------------------------
  def create_item_window
    @item_window = Window_BattleItem.new
    @item_window.set_handler(:ok,     method(:on_item_ok))
    @item_window.set_handler(:cancel, method(:on_item_cancel))
    @item_window.x = (Graphics.width - (@item_window.width + 255))
    @item_window.y = (Graphics.height - (@actor_command_window.height + @item_window.height))
  end
  #--------------------------------------------------------------------------
  # * Create Actor Window
  #--------------------------------------------------------------------------
  def create_actor_window
    @actor_window = Window_BattleActors.new
    @actor_window.set_handler(:ok,     method(:on_actor_ok))
    @actor_window.set_handler(:cancel, method(:on_actor_cancel))
    @actor_window.opacity = 0
  end
  #--------------------------------------------------------------------------
  # * Create Enemy Window
  #--------------------------------------------------------------------------
  def create_enemy_window
    @enemy_window = Window_BattleEnemys.new
    @enemy_window.set_handler(:ok,     method(:on_enemy_ok))
    @enemy_window.set_handler(:cancel, method(:on_enemy_cancel))
  end
  #--------------------------------------------------------------------------
  # * Start Party Command Selection
  #--------------------------------------------------------------------------
  def start_party_command_selection
    unless scene_changing?
      refresh_status
      start_actor_command_selection
    end
  end
  #--------------------------------------------------------------------------
  # * Start Actor Command Selection
  #--------------------------------------------------------------------------
  def start_actor_command_selection
    @actor_command_window.setup(BattleManager.actor)
  end
  #--------------------------------------------------------------------------
  # * [Attack] Command
  #--------------------------------------------------------------------------
  alias mscr_battlewindows_scenebattle_commandattack command_attack
  def command_attack
    mscr_battlewindows_scenebattle_commandattack
    @actoraction_window.show
  end
  #--------------------------------------------------------------------------
  # * [Skill] Command
  #--------------------------------------------------------------------------
  def command_skill
    @skill_window.actor = BattleManager.actor
    @skill_window.refresh
    @skill_window.show.activate
  end
  #--------------------------------------------------------------------------
  # * Start Actor Selection
  #--------------------------------------------------------------------------
  alias mscr_battlewindows_scenebattle_selectactorselection select_actor_selection
  def select_actor_selection
    mscr_battlewindows_scenebattle_selectactorselection
    case @actor_command_window.current_symbol
    when :skill
      @skill_window.hide
    when :item
      @item_window.hide
    end
    @actoraction_window.show
  end
  #--------------------------------------------------------------------------
  # * Actor [Cancel]
  #--------------------------------------------------------------------------
  alias mscr_battlewindows_scenebattle_onactorcancel on_actor_cancel
  def on_actor_cancel
    mscr_battlewindows_scenebattle_onactorcancel
    case @actor_command_window.current_symbol
    when :skill
      @skill_window.show.activate.select_last
    when :item
      @item_window.show.activate.select_last
    end
    @actoraction_window.hide
  end
  #--------------------------------------------------------------------------
  # * Start Enemy Selection
  #--------------------------------------------------------------------------
  alias mscr_battlewindows_scenebattle_selectenemyselection select_enemy_selection
  def select_enemy_selection
    mscr_battlewindows_scenebattle_selectenemyselection
    case @actor_command_window.current_symbol
    when :skill
      @skill_window.hide
    when :item
      @item_window.hide
    end
    @actoraction_window.show
  end
  #--------------------------------------------------------------------------
  # * Enemy [Cancel]
  #--------------------------------------------------------------------------
  alias mscr_battlewindows_scenebattle_onenemycancel on_enemy_cancel
  def on_enemy_cancel
    mscr_battlewindows_scenebattle_onenemycancel
    case @actor_command_window.current_symbol
    when :skill
      @skill_window.show.activate.select_last
    when :item
      @item_window.show.activate.select_last
    end
    @actoraction_window.hide
  end
  #--------------------------------------------------------------------------
  # * Start Turn
  #--------------------------------------------------------------------------
  def turn_start
    @actor_command_window.close
    @status_window.unselect
    @subject =  nil
    BattleManager.turn_start
    @log_window.wait
    @log_window.clear
  end
  #--------------------------------------------------------------------------
  # * Show Animation
  #--------------------------------------------------------------------------
  alias mscr_battlewindows_scenebattle_showanimation show_animation
  def show_animation(targets, animation_id)
    mscr_battlewindows_scenebattle_showanimation(targets, animation_id)
    abs_wait(15)
  end

end #Scene_Battle
