#==============================================================================
# Battle_ManaSystem
# Edited    April 17 2020
#==============================================================================
# ██████╗  █████╗ ███╗   ███╗███████╗     █████╗  ██████╗████████╗ ██████╗ ██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ███████║██║        ██║   ██║   ██║██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔══██║██║        ██║   ██║   ██║██╔══██╗
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
class Game_Actor < Game_Battler

  def mp;  $game_variables[MSCR::VAR::PARTYMANA];    end			   #  MP  Magic Points
  def mmp; $game_variables[MSCR::VAR::PARTYMAXMANA]; end               # MMP  Maximum Magic Points

  #--------------------------------------------------------------------------
  # * Change MP
  #--------------------------------------------------------------------------
  def mp=(mp)
    $game_variables[MSCR::VAR::PARTYMANA] = mp
    refresh
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    state_resist_set.each {|state_id| erase_state(state_id) }
    @hp = [[@hp, mhp].min, 0].max
    $game_variables[MSCR::VAR::PARTYMANA] = [[$game_variables[MSCR::VAR::PARTYMANA], mmp].min, 0].max
    @hp == 0 ? add_state(death_state_id) : remove_state(death_state_id)
  end
  #--------------------------------------------------------------------------
  # * Recover All
  #--------------------------------------------------------------------------
  def recover_all
    clear_states
    @hp = mhp
    $game_variables[MSCR::VAR::PARTYMANA] = mmp
  end
  #--------------------------------------------------------------------------
  # * Get Percentage of MP
  #--------------------------------------------------------------------------
  def mp_rate
    mmp > 0 ? $game_variables[MSCR::VAR::PARTYMANA].to_f / mmp : 0
  end
  #--------------------------------------------------------------------------
  # * Determine if Cost of Using Skill Can Be Paid
  #--------------------------------------------------------------------------
  def skill_cost_payable?(skill)
    $game_variables[MSCR::VAR::PARTYMANA] >= skill_mp_cost(skill)
  end
  #--------------------------------------------------------------------------
  # * Pay Cost of Using Skill
  #--------------------------------------------------------------------------
  def pay_skill_cost(skill)
    $game_variables[MSCR::VAR::PARTYMANA] -= skill_mp_cost(skill)
  end

end #Game_Actor
