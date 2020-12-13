#===============================================================================
# Battle_TurnBased
# Edited    August 13 2019
#===============================================================================
#██████╗  █████╗ ████████╗████████╗██╗     ███████╗    ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗
#██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗
#██████╔╝███████║   ██║      ██║   ██║     █████╗      ██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝
#██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝      ██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗
#██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║
#╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
module BattleManager

  #--------------------------------------------------------------------------
  # * battle_order
  #--------------------------------------------------------------------------
  def self.battle_order
    battle_order = []
    battle_order = $game_party.members + $game_troop.members
    battle_order.sort! { |x,y| y.agi <=> x.agi }
    return battle_order
  end
  #--------------------------------------------------------------------------
  # * actor_index=
  #--------------------------------------------------------------------------
  def self.actor_index=(value)
    @actor_index = value
  end
  #--------------------------------------------------------------------------
  # * actor_index
  #--------------------------------------------------------------------------
  def self.actor_index
    @actor_index
  end
  #--------------------------------------------------------------------------
  # * Start Command Input
  #--------------------------------------------------------------------------
  def self.input_start
    $game_party.make_actions
    return $game_party.inputable?
  end

end #BattleManager

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ██████╗  █████╗ ████████╗████████╗██╗     ███████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ██████╔╝███████║   ██║      ██║   ██║     █████╗
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝
class Scene_Battle < Scene_Base

  #--------------------------------------------------------------------------
  # * Battle Start
  #--------------------------------------------------------------------------
  def battle_start
    BattleManager.battle_start
    process_event
    @battler_index = -1
    @battler_list = BattleManager.battle_order
    #enter_actor_battlers
    select_next_member
  end
  #--------------------------------------------------------------------------
  # * enter_actor_battlers
  #--------------------------------------------------------------------------
  def enter_actor_battlers
  end
  #--------------------------------------------------------------------------
  # * select_next_member
  #--------------------------------------------------------------------------
  def select_next_member
    @battler_index += 1
    @battler_index = 0 if @battler_index >= @battler_list.size
    select_battler_action
  end
  #--------------------------------------------------------------------------
  # * select_battler_action
  #--------------------------------------------------------------------------
  def select_battler_action
    @subject = @battler_list[@battler_index]
    select_next_member if @subject.nil?
    @subject.on_turn_end
    if @subject.inputable?
      if @subject.actor?
        BattleManager.actor_index = @subject.index
        BattleManager.actor.make_actions
        start_party_command_selection
      else
        BattleManager.clear_actor
        perform_battler_action
      end
    else
      select_next_member
    end
  end
  #--------------------------------------------------------------------------
  # * next_command
  #--------------------------------------------------------------------------
  def next_command
    if turn_action?
      perform_battler_action
    else
      start_actor_command_selection
    end
  end
  #--------------------------------------------------------------------------
  # * turn_action?
  #--------------------------------------------------------------------------
  def turn_action?
    return false if BattleManager.actor.nil?
    return false if BattleManager.actor.current_action.nil?
    return !BattleManager.actor.current_action.item.nil?
  end
  #--------------------------------------------------------------------------
  # * perform_battler_action
  #--------------------------------------------------------------------------
  def perform_battler_action
    return if @subject.nil?
    hide_action_windows
    BattleManager.clear_actor
    @subject.make_actions if @subject.enemy?
    execute_action
    process_event
    loop do
      @subject.remove_current_action
      break if $game_party.all_dead? if @subject.enemy?
      break if $game_troop.all_dead? if @subject.actor?
      break unless @subject.current_action
      @subject.current_action.prepare
      execute_action if @subject.current_action.valid?
    end
    @subject.on_action_end
    return if $game_party.alive_members.size <= 0 if @subject.enemy?
    return if $game_troop.alive_members.size <= 0 if @subject.actor?
    process_action_end
    @subject = nil
    end_action
  end
  #--------------------------------------------------------------------------
  # * hide_action_windows
  #--------------------------------------------------------------------------
  def hide_action_windows
    @actor_command_window.close
    @actoraction_window.hide
  end
  #--------------------------------------------------------------------------
  # * end_action
  #--------------------------------------------------------------------------
  def end_action
    select_next_member unless scene_changing?
  end
  #--------------------------------------------------------------------------
  # * [Escape] Command
  #--------------------------------------------------------------------------
  def command_escape
    select_next_member unless BattleManager.process_escape
  end

end #Scene_Battle
