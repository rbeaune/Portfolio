#===============================================================================
# Battle_EffectPopup
# Edited    March 6 2020
#===============================================================================
# ██████╗  █████╗ ███╗   ███╗███████╗    ██████╗  █████╗ ████████╗████████╗██╗     ███████╗██████╗     ██████╗  █████╗ ███████╗███████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝██╔══██╗    ██╔══██╗██╔══██╗██╔════╝██╔════╝
#██║  ███╗███████║██╔████╔██║█████╗      ██████╔╝███████║   ██║      ██║   ██║     █████╗  ██████╔╝    ██████╔╝███████║███████╗█████╗
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝  ██╔══██╗    ██╔══██╗██╔══██║╚════██║██╔══╝
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗██║  ██║    ██████╔╝██║  ██║███████║███████╗
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
class Game_BattlerBase

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :popups
  #--------------------------------------------------------------------------
  # * create_popup
  #--------------------------------------------------------------------------
  def create_popup(data, rule = :default)
    return unless SceneManager.scene_is?(Scene_Battle)
    @popups ||= []
    @popups.push([data, rule])
  end
  #--------------------------------------------------------------------------
  # * make_damage_popups
  #--------------------------------------------------------------------------
  def make_damage_popups(user)
    if @result.hp_drain != 0
      rule = :drained
      user.create_popup(["", nil], rule)
      rule = :hp_dmg  if @result.hp_drain < 0
      rule = :hp_heal if @result.hp_drain > 0
      value = @result.hp_drain.abs
      user.create_popup(["#{value}", nil], rule)
    end
    if @result.mp_drain != 0
      rule = :drained
      user.create_popup(["", nil], rule)
      rule = :mp_dmg  if @result.mp_drain < 0
      rule = :mp_heal if @result.mp_drain > 0
      value = @result.mp_drain.abs
      user.create_popup(["#{value}", nil], rule)
    end
    #---
    rule = :critical
    create_popup(["", nil], rule) if @result.critical
    if @result.hp_damage != 0
      rule = :hp_dmg  if @result.hp_damage > 0
      rule = :hp_heal if @result.hp_damage < 0
      value = @result.hp_damage.abs
      create_popup(["#{value}", nil], rule)
    end
    if @result.mp_damage != 0
      rule = :mp_dmg  if @result.mp_damage > 0
      rule = :mp_heal if @result.mp_damage < 0
      value = @result.mp_damage.abs
      create_popup(["#{value}", nil], rule)
    end
  end
  #--------------------------------------------------------------------------
  # * erase_state
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_gamebattlerbase_erasestate erase_state
  def erase_state(state_id)
    make_state_popup(state_id, :rem_state) if @states.include?(state_id)
    mscr_battlepopups_gamebattlerbase_erasestate(state_id)
  end
  #--------------------------------------------------------------------------
  # * make_during_state_popup
  #--------------------------------------------------------------------------
  def make_during_state_popup
    state_id = most_important_state_id
    return if state_id == 0
    make_state_popup(state_id, :dur_state)
  end
  #--------------------------------------------------------------------------
  # * most_important_state_id
  #--------------------------------------------------------------------------
  def most_important_state_id
    states.each {|state| return state.id unless state.message3.empty? }
    return 0
  end
  #--------------------------------------------------------------------------
  # * make_state_popup
  #--------------------------------------------------------------------------
  def make_state_popup(state_id, type)
    state = $data_states[state_id]
    return if state.icon_index == 0
    create_popup(["#{state.name}", state.icon_index], type)
  end
  #--------------------------------------------------------------------------
  # * make_miss_popups
  #--------------------------------------------------------------------------
  def make_miss_popups(user, item)
    return if dead?
    if @result.missed
      rule = :missed
      create_popup(["", nil], rule)
    end
    if @result.evaded
      rule = :evaded
      create_popup(["", nil], rule)
    end
    if @result.hit? && !@result.success
      rule = :failed
      create_popup(["", nil], rule)
    end
    if @result.hit? && item.damage.to_hp?
      if @result.hp_damage == 0 && @result.mp_damage == 0
        rule = :nulled
        create_popup(["", nil], rule)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * make_rate_popup
  #--------------------------------------------------------------------------
  def make_rate_popup(rate)
    return if rate == 1.0
    if rate > 1.0
      rule = :weakpoint
    elsif rate == 0.0
      rule = :immune
    elsif rate < 0.0
      rule = :absorbed
    else
      rule = :resistant
    end
    create_popup(["", nil], rule)
  end

end #Game_BattlerBase

# ██████╗  █████╗ ███╗   ███╗███████╗    ██████╗  █████╗ ████████╗████████╗██╗     ███████╗██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ██████╔╝███████║   ██║      ██║   ██║     █████╗  ██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝  ██╔══██╗
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═╝
class Game_Battler < Game_BattlerBase

  #--------------------------------------------------------------------------
  # * on_battle_end
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_gamebattler_onbattleend on_battle_end
  def on_battle_end
    mscr_battlepopups_gamebattler_onbattleend
    @popups ||= []
    @popups.clear
  end
  #--------------------------------------------------------------------------
  # * item_apply
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_gamebattler_itemapply item_apply
  def item_apply(user, item)
    mscr_battlepopups_gamebattler_itemapply(user, item)
    make_miss_popups(user, item)
  end
  #--------------------------------------------------------------------------
  # * make_damage_value
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_gamebattler_makedamagevalue make_damage_value
  def make_damage_value(user, item)
    mscr_battlepopups_gamebattler_makedamagevalue(user, item)
    rate = item_element_rate(user, item)
    make_rate_popup(rate)
  end
  #--------------------------------------------------------------------------
  # * execute_damage
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_gamebattler_executedamage execute_damage
  def execute_damage(user)
    mscr_battlepopups_gamebattler_executedamage(user)
    make_damage_popups(user)
  end
  #--------------------------------------------------------------------------
  # * item_effect_recover_hp
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_gamebattler_itemeffectrecoverhp item_effect_recover_hp
  def item_effect_recover_hp(user, item, effect)
    mscr_battlepopups_gamebattler_itemeffectrecoverhp(user, item, effect)
    make_damage_popups(user)
  end
  #--------------------------------------------------------------------------
  # * item_effect_recover_mp
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_gamebattler_itemeffectrecovermp item_effect_recover_mp
  def item_effect_recover_mp(user, item, effect)
    mscr_battlepopups_gamebattler_itemeffectrecovermp(user, item, effect)
    make_damage_popups(user)
  end
  #--------------------------------------------------------------------------
  # * add_new_state
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_gamebattler_addnewstate add_new_state
  def add_new_state(state_id)
    mscr_battlepopups_gamebattler_addnewstate(state_id)
    make_state_popup(state_id, :add_state) if @states.include?(state_id)
  end
  #--------------------------------------------------------------------------
  # * remove_state
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_gamebattler_removestate remove_state
  def remove_state(state_id)
    mscr_battlepopups_gamebattler_removestate(state_id)
    make_state_popup(state_id, :remove_state) if @states.include?(state_id)
  end
  #--------------------------------------------------------------------------
  # * regenerate_all
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_gamebattler_regenerateall regenerate_all
  def regenerate_all
    mscr_battlepopups_gamebattler_regenerateall
    return unless alive?
    make_damage_popups(self)
  end

end # Game_Battler

#███████╗██████╗ ██████╗ ██╗████████╗███████╗    ██████╗  █████╗ ████████╗████████╗██╗     ███████╗██████╗
#██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝██╔══██╗
#███████╗██████╔╝██████╔╝██║   ██║   █████╗      ██████╔╝███████║   ██║      ██║   ██║     █████╗  ██████╔╝
#╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝      ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝  ██╔══██╗
#███████║██║     ██║  ██║██║   ██║   ███████╗    ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗██║  ██║
#╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═╝
class Sprite_Battler < Sprite_Base

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_spritebattler_initialize initialize
  def initialize(viewport, battler = nil)
    mscr_battlepopups_spritebattler_initialize(viewport, battler)
    @popups = []
    @popup_delay = 0
  end
  #--------------------------------------------------------------------------
  # * setup_new_effect
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_spritebattler_setupneweffect setup_new_effect
  def setup_new_effect
    mscr_battlepopups_spritebattler_setupneweffect
    setup_popups
  end
  #--------------------------------------------------------------------------
  # * setup_popups
  #--------------------------------------------------------------------------
  def setup_popups
    return unless @battler.use_sprite?
    @battler.popups ||= []
    @popup_delay -= 1
    return if @popup_delay > 0
    array = @battler.popups.shift
    return if array.nil?
    create_new_popup(array[0], array[1])
    return if @battler.popups.size == 0
    @popup_delay = MSCR::BATTLE::POPUPDELAY
  end
  #--------------------------------------------------------------------------
  # * create_new_popup
  #--------------------------------------------------------------------------
  def create_new_popup(data, rule)
    return unless @battler
    return unless SceneManager.scene.is_a?(Scene_Battle)
    viewport = self.viewport
    popup = Sprite_EffectPopup.new(viewport, @battler, data, rule)
    @popups.push(popup)
  end
  #--------------------------------------------------------------------------
  # * update
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_spritebattler_update update
  def update
    mscr_battlepopups_spritebattler_update
    update_popups
  end
  #--------------------------------------------------------------------------
  # * update_popups
  #--------------------------------------------------------------------------
  def update_popups
    @popups.each { |popup| popup.update }
    @popups.each_with_index { |sprite, index|
      next unless sprite.disposed?
      @popups[index] = nil
    }
    @popups.compact!
  end
  #--------------------------------------------------------------------------
  # * dispose
  #--------------------------------------------------------------------------
  alias mscr_battlepopups_spritebattler_dispose dispose
  def dispose
    @popups.each { |popup| popup.dispose }
    @popups.clear
    mscr_battlepopups_spritebattler_dispose
  end

end #Sprite_Battler

#███████╗███████╗███████╗███████╗ ██████╗████████╗    ██████╗  ██████╗ ██████╗ ██╗   ██╗██████╗
#██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝╚══██╔══╝    ██╔══██╗██╔═══██╗██╔══██╗██║   ██║██╔══██╗
#█████╗  █████╗  █████╗  █████╗  ██║        ██║       ██████╔╝██║   ██║██████╔╝██║   ██║██████╔╝
#██╔══╝  ██╔══╝  ██╔══╝  ██╔══╝  ██║        ██║       ██╔═══╝ ██║   ██║██╔═══╝ ██║   ██║██╔═══╝
#███████╗██║     ██║     ███████╗╚██████╗   ██║       ██║     ╚██████╔╝██║     ╚██████╔╝██║
#╚══════╝╚═╝     ╚═╝     ╚══════╝ ╚═════╝   ╚═╝       ╚═╝      ╚═════╝ ╚═╝      ╚═════╝ ╚═╝
class Sprite_EffectPopup < Sprite

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize(viewport, battler, data, rule)
    super(viewport)
    @data = data
    @rule = rule
    #---
    @style = rule
    @style = :default unless MSCR::BATTLE::POPUPSTYLE.has_key?(@style)
    @style = MSCR::BATTLE::POPUPSTYLE[@style]
    #---
    @effects = rule
    @effects = :default unless MSCR::BATTLE::POPUPEFFECT.has_key?(@effects)
    @effects = MSCR::BATTLE::POPUPEFFECT[@effects].dup
    #---
    @current_effect = nil
    @duration = 0
    @battler = battler
    #---
    start_popup
    start_effect
    update
  end
  #--------------------------------------------------------------------------
  # * start_popup
  #--------------------------------------------------------------------------
  def start_popup
    self.bitmap = create_bitmap
    self.x = @battler.screen_x  + (@battler.actor? ? 16 * MSCR::BATTLE::BATTLERZOOM : 0)
    self.y = @battler.screen_y  + (@battler.actor? ? 16 * MSCR::BATTLE::BATTLERZOOM : 0)
    self.ox = self.bitmap.width / 2
    self.oy = self.bitmap.height
    self.z = @battler.screen_z + 350
  end
  #--------------------------------------------------------------------------
  # * create_bitmap
  #--------------------------------------------------------------------------
  def create_bitmap
    bw = Graphics.width
    bw = bw + 48 if @data[1]
    bh = @style[3] * 2
    bitmap = Bitmap.new(bw, bh)
    #---
    bitmap.font.color.set(@style[0], @style[1], @style[2])
    bitmap.font.size   = @style[3]
    #---
    dx = @data[1] ? 24 : 0; dy = 0
    text = $data_dialogue[MSCR::BATTLE::POPUPWORDS[@rule]]
    text = $data_dialogue[MSCR::BATTLE::POPUPWORDS[:default]] unless text
    text = sprintf(text, @data[0])
    bitmap.draw_text(dx, dy, bw - dx, bh, text, 1)
    #---
    text_width = bitmap.text_size(text).width
    if @data[1]
      icon_bitmap = Cache.system("Iconset")
      icon_index = @data[1].to_i
      rect = Rect.new(icon_index % 16 * 24, icon_index / 16 * 24, 24, 24)
      bitmap.blt((bw-text_width)/2-16, (bh - 24)/2, icon_bitmap, rect)
    end
    bitmap
  end
  #--------------------------------------------------------------------------
  # * start_effect
  #--------------------------------------------------------------------------
  def start_effect
    @current_effect = @effects.shift
    return dispose if @current_effect.nil?
    effect = MSCR::BATTLE::POPUPEFFECT_SETUP[@current_effect]
    @duration = effect[8]
    #---
    @zoom_x_rate = (effect[0] - self.zoom_x) / @duration
    @zoom_y_rate = (effect[1] - self.zoom_y) / @duration
    #---
    @move_x = effect[4]
    @move_y = effect[5]
    #---
    @gravity = effect[6]
    #---
    @opacity_rate = (effect[7] - self.opacity) / @duration.to_f
    #---
    self.x += effect[2]
    self.y += effect[3]
  end
  #--------------------------------------------------------------------------
  # * update
  #--------------------------------------------------------------------------
  def update
    super
    update_zoom
    update_move
    update_opacity
    update_effect
  end
  #--------------------------------------------------------------------------
  # * update_effect
  #--------------------------------------------------------------------------
  def update_effect
    @duration -= 1
    return if @duration > 0
    start_effect
  end
  #--------------------------------------------------------------------------
  # * update_zoom
  #--------------------------------------------------------------------------
  def update_zoom
    self.zoom_x += @zoom_x_rate
    self.zoom_y += @zoom_y_rate
  end
  #--------------------------------------------------------------------------
  # * update_move
  #--------------------------------------------------------------------------
  def update_move
    self.x += @move_x
    self.y += @move_y
    @move_y += @gravity
  end
  #--------------------------------------------------------------------------
  # * update_opacity
  #--------------------------------------------------------------------------
  def update_opacity
    self.opacity += @opacity_rate
  end
  #--------------------------------------------------------------------------
  # * dispose
  #--------------------------------------------------------------------------
  def dispose
    self.bitmap.dispose if self.bitmap
    super
  end

end # Sprite_EffectPopup
