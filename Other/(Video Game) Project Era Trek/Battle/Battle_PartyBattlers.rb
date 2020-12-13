#===============================================================================
# Battle_PartyBattlers
# Edited    March 24 2020
#===============================================================================
# ██████╗  █████╗ ███╗   ███╗███████╗     █████╗  ██████╗████████╗ ██████╗ ██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ███████║██║        ██║   ██║   ██║██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔══██║██║        ██║   ██║   ██║██╔══██╗
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
class Game_Actor

  #-------------------------------------------------------------------------
  # * use_sprite?
  #-------------------------------------------------------------------------
  def use_sprite?
    true
  end
  #-------------------------------------------------------------------------
  # * screen_x
  #-------------------------------------------------------------------------
  def screen_x
    x = (Graphics.width / 2) - 42
    x += MSCR::BATTLE::BATTLERSPACING / 2 if $game_party.battle_members.size.even?
    x -= ($game_party.battle_members.size / 2 - index) * MSCR::BATTLE::BATTLERSPACING
    return x
  end
  #-------------------------------------------------------------------------
  # * screen_y
  #-------------------------------------------------------------------------
  def screen_y
    320
  end
  #-------------------------------------------------------------------------
  # * screen_z
  #-------------------------------------------------------------------------
  def screen_z
    101 + index
  end

end #Game_Actor

# ██████╗  █████╗ ███╗   ███╗███████╗    ██████╗  █████╗ ██████╗ ████████╗██╗   ██╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝╚██╗ ██╔╝
#██║  ███╗███████║██╔████╔██║█████╗      ██████╔╝███████║██████╔╝   ██║    ╚████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔═══╝ ██╔══██║██╔══██╗   ██║     ╚██╔╝
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║     ██║  ██║██║  ██║   ██║      ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝      ╚═╝
class Game_Party < Game_Unit

  #--------------------------------------------------------------------------
  # * Get Maximum Number of Battle Members
  #--------------------------------------------------------------------------
  def max_battle_members
    return MSCR::BATTLE::MAXBATTLERS
  end

end #Game_Party

#███████╗██████╗ ██████╗ ██╗████████╗███████╗    ██████╗  █████╗ ████████╗████████╗██╗     ███████╗██████╗
#██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝██╔══██╗
#███████╗██████╔╝██████╔╝██║   ██║   █████╗      ██████╔╝███████║   ██║      ██║   ██║     █████╗  ██████╔╝
#╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝      ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝  ██╔══██╗
#███████║██║     ██║  ██║██║   ██║   ███████╗    ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗██║  ██║
#╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═╝
class Sprite_Battler < Sprite_Base

  #-------------------------------------------------------------------------
  # * update_bitmap
  #-------------------------------------------------------------------------
  alias mscr_partybattler_spritebattler_updatebitmap update_bitmap
  def update_bitmap(*args, &block)
    if @battler.actor?
      actor_update_bitmap
    else
      mscr_partybattler_spritebattler_updatebitmap(*args, &block)
    end
  end
  #-------------------------------------------------------------------------
  # * actor_update_bitmap
  #-------------------------------------------------------------------------
  def actor_update_bitmap
    their_turn = BattleManager.actor_index == @battler.index || $game_troop.all_dead?
    if !their_turn
      @timer ||= 0
      @index ||= 1
      @char_index ||= @battler.character_index
      @back_time ||= false
      index = @index
      char_index = @char_index
      @timer += 1
      (@index += (@back_time ? -1 : 1); @timer = 0) if @timer == MSCR::BATTLE::BATTLERIDLESPD
      if @index == 3
        @back_time = true
        @index = 1
      elsif @index == -1
        @back_time = false
        @index = 1
      end
    end
    @char_index = @battler.character_index
    bitmap = Cache.character(@battler.character_name)
    return if bitmap == @bitmap && index == @index && @char_index == char_index
    self.bitmap = bitmap
    sign = @battler.character_name[/^[\!\$]./]
    if sign && sign.include?('$')
      cw = bitmap.width / 3
      ch = bitmap.height / 4
    else
      cw = bitmap.width / 12
      ch = bitmap.height / 8
    end
    sx = (@battler.character_index % 4 * 3) * cw + (their_turn ? 32 : (cw * @index))
    sy = (@battler.character_index / 4 * 4 + (their_turn ? 0 : 3)) * ch
    self.src_rect.set(sx, sy, cw, ch)
    self.zoom_x = MSCR::BATTLE::BATTLERZOOM
    self.zoom_y = MSCR::BATTLE::BATTLERZOOM
  end
  #-------------------------------------------------------------------------
  # * update_origin
  #-------------------------------------------------------------------------
  alias mscr_partybattler_spritebattler_updateorigin update_origin
  def update_origin(*args, &block)
    if @battler.actor?
      actor_update_origin
    else
      mscr_partybattler_spritebattler_updateorigin(*args, &block)
    end
  end
  #-------------------------------------------------------------------------
  # * actor_update_origin
  #-------------------------------------------------------------------------
  def actor_update_origin
    self.ox = (@actor_ox ||= 0)
    self.oy = (@actor_oy ||= 0)
  end
  #-------------------------------------------------------------------------
  # * revert_to_normal
  #-------------------------------------------------------------------------
  def revert_to_normal
    self.blend_type = 0
    self.color.set(0, 0, 0, 0)
    self.opacity = 255
    if bitmap && @battler && !@battler.actor?
      self.ox = bitmap.width / 2 if bitmap
      self.src_rect.y = 0
    end
  end
  #-------------------------------------------------------------------------
  # * slide_forward
  #-------------------------------------------------------------------------
  def slide_forward(amount = MSCR::BATTLE::BATTLERSLIDEAMT, frame = MSCR::BATTLE::BATTLERSLIDEFRM)
    affect = :@actor_oy
    amount *= -1
    orig_amount = amount
    until (orig_amount < 0 ? amount >= 0 : amount <= 0)
      instance_variable_set(affect, instance_variable_get(affect) + frame)
      amount += frame
      SceneManager.scene.spriteset.update
      Graphics.update
    end
  end
  #-------------------------------------------------------------------------
  # * slide_backward
  #-------------------------------------------------------------------------
  def slide_backward(amount = MSCR::BATTLE::BATTLERSLIDEAMT, frame = MSCR::BATTLE::BATTLERSLIDEFRM)
    affect = :@actor_oy
    frame *= -1
    orig_amount = amount
    until (orig_amount < 0 ? amount >= 0 : amount <= 0)
      instance_variable_set(affect, instance_variable_get(affect) + frame)
      amount += frame
      SceneManager.scene.spriteset.update
      Graphics.update
    end
  end

end #Sprite_Battler

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ██████╗  █████╗ ████████╗████████╗██╗     ███████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ██████╔╝███████║   ██║      ██║   ██║     █████╗
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝
class Scene_Battle

  #-------------------------------------------------------------------------
  # * Public instance variables
  #-------------------------------------------------------------------------
  attr_reader :spriteset
  #-------------------------------------------------------------------------
  # * use_item
  #-------------------------------------------------------------------------
  alias mscr_partybattler_scenebattle_useitem use_item
  def use_item(*args, &block)
    sprite = @spriteset.battler_to_sprite(@subject)
    if @subject.actor? && !@subject.current_action.guard?
      sprite.slide_forward if @subject.actor? && !@subject.current_action.guard?
    end
    mscr_partybattler_scenebattle_useitem(*args, &block)
    if @subject.actor? && !@subject.current_action.guard?
      sprite.slide_backward if @subject.actor? && !@subject.current_action.guard?
    end
  end

end #Scene_Battle

#███████╗██████╗ ██████╗ ██╗████████╗███████╗███████╗███████╗████████╗    ██████╗  █████╗ ████████╗████████╗██╗     ███████╗
#██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝██╔════╝██╔════╝╚══██╔══╝    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝
#███████╗██████╔╝██████╔╝██║   ██║   █████╗  ███████╗█████╗     ██║       ██████╔╝███████║   ██║      ██║   ██║     █████╗
#╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝  ╚════██║██╔══╝     ██║       ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝
#███████║██║     ██║  ██║██║   ██║   ███████╗███████║███████╗   ██║       ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗
#╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝╚══════╝╚══════╝   ╚═╝       ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝
class Spriteset_Battle

  #-------------------------------------------------------------------------
  # * battler_to_sprite
  #-------------------------------------------------------------------------
  def battler_to_sprite(actor)
    battler_sprites.each {|a|
      return a if a.battler == actor
    }
    return false
  end

end #Spriteset_Battle

# ██████╗  █████╗ ███╗   ███╗███████╗     █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║
#██║  ███╗███████║██╔████╔██║█████╗      ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
class Game_Action

  #-------------------------------------------------------------------------
  # * guard?
  #-------------------------------------------------------------------------
  def guard?
    item == $data_skills[subject.guard_skill_id]
  end

end #Game_Action
