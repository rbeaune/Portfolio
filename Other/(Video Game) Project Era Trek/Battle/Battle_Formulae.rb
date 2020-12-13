#===============================================================================
# Battle_Formulae
# Edited    July 4 2019
#===============================================================================
# ██████╗  █████╗ ███╗   ███╗███████╗     █████╗  ██████╗████████╗ ██████╗ ██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ███████║██║        ██║   ██║   ██║██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔══██║██║        ██║   ██║   ██║██╔══██╗
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
class Game_Actor < Game_Battler

  #--------------------------------------------------------------------------
  # * Get the barehand value of an attacking actor
  #--------------------------------------------------------------------------
  def barehand
    value = param_base(2) + @param_plus[2]
    for armor in armors
      value += armor.params[2]
    end
    value *= param_rate(2) * param_buff_rate(2)
    [[value, param_max(2)].min, param_min(2)].max.to_i
  end

end #Game_Actor

# ██████╗  █████╗ ███╗   ███╗███████╗    ██████╗  █████╗ ████████╗████████╗██╗     ███████╗██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ██████╔╝███████║   ██║      ██║   ██║     █████╗  ██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝  ██╔══██╗
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═╝
class Game_Battler < Game_BattlerBase

  #--------------------------------------------------------------------------
  # * public instance variables
  #--------------------------------------------------------------------------
  attr_accessor :timed
  #--------------------------------------------------------------------------
  # * Processing at End of Action
  #--------------------------------------------------------------------------
  alias mscr_battleformulae_gamebattler_onactionend on_action_end
  def on_action_end
    mscr_battleformulae_gamebattler_onactionend
    @timed = false
  end
  #--------------------------------------------------------------------------
  # * Check who is attacking (Actor? OR Enemy?)
  #--------------------------------------------------------------------------
  def check_attacker(a,b)
    if a.actor?
      actor_neutral_attack(a,b)
    else
      enemy_neutral_attack(a,b)
    end
  end
  #--------------------------------------------------------------------------
  # * A regular actor attack
  #--------------------------------------------------------------------------
  def actor_neutral_attack(a,b)
    pa = a.barehand           #Get the barehand value
    wp = a.atk - pa           #Get the weapon value
    p = 0.1 * wp              #Calculate p value (New variance)

    if wp > 0
      return [((a.atk + rand_between(-p,p) - b.def) * (@timed ? 1.5 : 1)),1].max
    else
      return [((a.atk - b.def) * (@timed ? 1.5 : 1)),1].max
    end
  end
  #--------------------------------------------------------------------------
  # * A regular enemy attack
  #--------------------------------------------------------------------------
  def enemy_neutral_attack(a,b)
    value = (a.atk - b.def) #Base damage value

    if b.state?(2)               #-- Defend
      value = value * (@timed ? 0.25 : 0.5)
    elsif b.state?(3)            #-- Invincible
      return 0
    else                         #-- No state
      value = value * (@timed ? 0.5 : 1)
    end

    return [value,1].max
  end
  #--------------------------------------------------------------------------
  # * A special actor attack
  #--------------------------------------------------------------------------
  def actor_magic_attack(a,b,pow)
    return [((a.mat + pow - b.mdf)),1].max
  end
  #--------------------------------------------------------------------------
  # * A special enemy attack
  #--------------------------------------------------------------------------
  def enemy_magic_attack(a,b,pow)
    value  = 0
    nvalue = 0

    value = (a.mat + pow - b.mdf)

    if b.state?(2)     #-- Defend
      nvalue = value * 0.50
    elsif b.state?(3)  #-- Invincible
      return 0
    else               #-- No state
      nvalue = value
    end

    return [nvalue,1].max
  end
  #--------------------------------------------------------------------------
  # * Instant KO actor attack
  #--------------------------------------------------------------------------
  def actor_OHKO_attack(a,b,pow)
    if b.element_rate(7) == 0   #-- Resist Dark type?
      return actor_magic_attack(a,b,pow)
    else                        #-- Ultimate damage!
      return @timed ? 9999 : actor_magic_attack(a,b,pow)
    end
  end
  #--------------------------------------------------------------------------
  # * Instant KO enemy attack
  #--------------------------------------------------------------------------
  def enemy_OHKO_attack(a,b)
    if b.state?(2)    #-- Defend
      return @timed ? b.hp / 2 : b.hp - (b.hp + 1)
    elsif b.state(3)  #-- Invincible
      return 0
    else              #-- No state
      return @timed ? b.hp - (b.hp + 1) : 9999
    end
  end
  #--------------------------------------------------------------------------
  # * A special actor heal spell
  #--------------------------------------------------------------------------
  def actor_magic_heal(a,b,pow)
    return [((a.mat + pow) * (@timed ? 1.5 : 1)),1].max
  end
  #--------------------------------------------------------------------------
  # * A special enemy heal spell
  #--------------------------------------------------------------------------
  def enemy_magic_heal(a,b,pow)
    return [(a.mat + pow),1].max
  end

end #Game_Battler
