#===============================================================================
# Battle_VictoryWindows
# Edited    March 30 2020
#===============================================================================
#██████╗  █████╗ ████████╗████████╗██╗     ███████╗    ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗
#██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗
#██████╔╝███████║   ██║      ██║   ██║     █████╗      ██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝
#██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝      ██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗
#██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║
#╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
module BattleManager

  #--------------------------------------------------------------------------
  # * self.process_victory
  #--------------------------------------------------------------------------
  def self.process_victory
    return skip_aftermath if $game_switches[MSCR::BATTLE::SKIPVICTORYSWITCH]
    play_battle_end_me unless $game_switches[MSCR::BATTLE::SKIPVICTORYMUSICSWITCH]
    SceneManager.scene.close_battle_windows
    display_exp
    gain_exp
    gain_gold
    gain_drop_items
    close_windows
    SceneManager.return
    replay_bgm_and_bgs
    battle_end(0)
    return true
  end
  #--------------------------------------------------------------------------
  # * self.skip_aftermath
  #--------------------------------------------------------------------------
  def self.skip_aftermath
    $game_party.all_members.each do |actor|
      actor.gain_exp($game_troop.exp_total)
    end
    $game_party.gain_gold($game_troop.gold_total)
    $game_troop.make_drop_items.each do |item|
      $game_party.gain_item(item, 1)
    end
    close_windows
    SceneManager.return
    replay_bgm_and_bgs
    battle_end(0)
  end
  #--------------------------------------------------------------------------
  # * self.play_battle_end_me
  #--------------------------------------------------------------------------
  def self.play_battle_end_me
    $game_system.battle_end_me.play
    MSCR::SOUND::BGM_BATTLE_VICTORY.play
  end
  #--------------------------------------------------------------------------
  # * self.set_victory_text
  #--------------------------------------------------------------------------
  def self.set_victory_text(text = "", back = 2)
    $game_message.background = back
    $game_message.add(text)
    wait_for_message
  end
  #--------------------------------------------------------------------------
  # * self.display_exp
  #--------------------------------------------------------------------------
  def self.display_exp
    SceneManager.scene.show_victory_display_exp
    set_victory_text
  end
  #--------------------------------------------------------------------------
  # * self.gain_exp
  #--------------------------------------------------------------------------
  def self.gain_exp
    $game_party.all_members.each do |actor|
      temp_actor = Marshal.load(Marshal.dump(actor))
      actor.gain_exp($game_troop.exp_total)
      next if actor.level == temp_actor.level
      SceneManager.scene.show_victory_level_up(actor, temp_actor)
      if actor.skills.size == temp_actor.skills.size
        set_victory_text
      else
        skills = actor.skills - temp_actor.skills
        text = sprintf($data_dialogue[MSCR::BATTLE::VICTORY_TEXTLEARN], actor.name, skills[0].name)
        set_victory_text(text, 0)
      end
      wait_for_message
    end
  end
  #--------------------------------------------------------------------------
  # * self.gain_gold
  #--------------------------------------------------------------------------
  def self.gain_gold
    $game_party.gain_gold($game_troop.gold_total)
  end
  #--------------------------------------------------------------------------
  # * self.gain_drop_items
  #--------------------------------------------------------------------------
  def self.gain_drop_items
    drops = []
    $game_troop.make_drop_items.each do |item|
      $game_party.gain_item(item, 1)
      drops.push(item)
    end
    SceneManager.scene.show_victory_spoils($game_troop.gold_total, drops)
    set_victory_text
    wait_for_message
  end
  #--------------------------------------------------------------------------
  # * self.close_windows
  #--------------------------------------------------------------------------
  def self.close_windows
    $game_message.clear
    SceneManager.scene.close_victory_windows
  end

end #BattleManager

# ██████╗  █████╗ ███╗   ███╗███████╗     █████╗  ██████╗████████╗ ██████╗ ██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ███████║██║        ██║   ██║   ██║██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔══██║██║        ██║   ██║   ██║██╔══██╗
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
class Game_Actor < Game_Battler

  #--------------------------------------------------------------------------
  # * gain_exp
  #--------------------------------------------------------------------------
  def gain_exp(exp)
    enabled = !SceneManager.scene_is?(Scene_Battle)
    change_exp(self.exp + (exp * final_exp_rate).to_i, enabled)
  end

end #Game_Actor

#██╗   ██╗██╗ ██████╗████████╗ ██████╗ ██████╗ ██╗   ██╗    ████████╗██╗████████╗██╗     ███████╗
#██║   ██║██║██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗╚██╗ ██╔╝    ╚══██╔══╝██║╚══██╔══╝██║     ██╔════╝
#██║   ██║██║██║        ██║   ██║   ██║██████╔╝ ╚████╔╝        ██║   ██║   ██║   ██║     █████╗
#╚██╗ ██╔╝██║██║        ██║   ██║   ██║██╔══██╗  ╚██╔╝         ██║   ██║   ██║   ██║     ██╔══╝
# ╚████╔╝ ██║╚██████╗   ██║   ╚██████╔╝██║  ██║   ██║          ██║   ██║   ██║   ███████╗███████╗
#  ╚═══╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝          ╚═╝   ╚═╝   ╚═╝   ╚══════╝╚══════╝
class Window_VictoryTitle < Window_Base

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize
    super((Graphics.width / 2) / 2, 0, Graphics.width / 2, fitting_height(1))
    self.openness = 0
  end
  #--------------------------------------------------------------------------
  # * refresh
  #--------------------------------------------------------------------------
  def refresh(message = "")
    contents.clear
    draw_text(0, 0, contents.width, line_height, message, 1)
  end

end # Window_VictoryTitle

#██╗   ██╗██╗ ██████╗████████╗ ██████╗ ██████╗ ██╗   ██╗    ███████╗██╗  ██╗██████╗
#██║   ██║██║██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗╚██╗ ██╔╝    ██╔════╝╚██╗██╔╝██╔══██╗
#██║   ██║██║██║        ██║   ██║   ██║██████╔╝ ╚████╔╝     █████╗   ╚███╔╝ ██████╔╝
#╚██╗ ██╔╝██║██║        ██║   ██║   ██║██╔══██╗  ╚██╔╝      ██╔══╝   ██╔██╗ ██╔═══╝
# ╚████╔╝ ██║╚██████╗   ██║   ╚██████╔╝██║  ██║   ██║       ███████╗██╔╝ ██╗██║
#  ╚═══╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝       ╚══════╝╚═╝  ╚═╝╚═╝
class Window_VictoryExp < Window_Selectable

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize
    super(0, fitting_height(1), Graphics.width, window_height)
    self.openness = 0
    @ticks = 0
    @counter = 30
    contents.font.size = 20
  end
  #--------------------------------------------------------------------------
  # * update
  #--------------------------------------------------------------------------
  def update
    super
    update_tick
  end
  #--------------------------------------------------------------------------
  # update_tick
  #--------------------------------------------------------------------------
  def update_tick
    return unless self.openness >= 255
    return unless self.visible
    return if complete_ticks?
    @counter -= 1
    return unless @counter <= 0
    return if @ticks >= MSCR::BATTLE::VICTORY_EXPTICKS
    MSCR::SOUND::SE_BATTLE_EXPTICK.play
    @counter = 4
    @ticks += 1
    refresh
  end
  #--------------------------------------------------------------------------
  # complete_ticks?
  #--------------------------------------------------------------------------
  def complete_ticks?
    for actor in $game_party.all_members
      total_ticks = MSCR::BATTLE::VICTORY_EXPTICKS
      bonus_exp = actor_exp_gain(actor) * @ticks / total_ticks
      now_exp = actor.exp - actor.current_level_exp + bonus_exp
      next_exp = actor.next_level_exp - actor.current_level_exp
      rate = now_exp * 1.0 / next_exp
      return false if rate < 1.0
    end
    return true
  end
  #--------------------------------------------------------------------------
  # * window_height
  #--------------------------------------------------------------------------
  def window_height
    return Graphics.height - fitting_height(4) - fitting_height(1)
  end
  #--------------------------------------------------------------------------
  # * col_max
  #--------------------------------------------------------------------------
  def col_max; return item_max; end
  #--------------------------------------------------------------------------
  # * spacing
  #--------------------------------------------------------------------------
  def spacing; return 8; end
  #--------------------------------------------------------------------------
  # * item_max
  #--------------------------------------------------------------------------
  def item_max; return $game_party.all_members.size; end
  #--------------------------------------------------------------------------
  # * open
  #--------------------------------------------------------------------------
  def open
    @exp_total = $game_troop.exp_total
    super
  end
  #--------------------------------------------------------------------------
  # * item_rect
  #--------------------------------------------------------------------------
  def item_rect(index)
    rect = Rect.new
    rect.width = item_width
    rect.height = contents.height
    rect.x = index % col_max * (item_width + spacing)
    rect.y = index / col_max * item_height
    return rect
  end
  #--------------------------------------------------------------------------
  # * draw_item
  #--------------------------------------------------------------------------
  def draw_item(index)
    actor = $game_party.all_members[index]
    return if actor.nil?
    rect = item_rect(index)
    reset_font_settings
    draw_actor_name(actor, rect)
    draw_exp_gain(actor, rect)
    draw_actor_exp(actor, rect)
    draw_actor_face(actor, rect)
  end
  #--------------------------------------------------------------------------
  # * draw_actor_name
  #--------------------------------------------------------------------------
  def draw_actor_name(actor, rect)
    name = actor.name
    draw_text(rect.x, rect.y+line_height, rect.width, line_height, name, 1)
  end
  #--------------------------------------------------------------------------
  # * draw_actor_exp
  #--------------------------------------------------------------------------
  def draw_actor_exp(actor, rect)
    if actor.max_level?
      draw_exp_gauge(actor, rect, 1.0)
      return
    end
    total_ticks = MSCR::BATTLE::VICTORY_EXPTICKS
    bonus_exp = actor_exp_gain(actor) * @ticks / total_ticks
    now_exp = actor.exp - actor.current_level_exp + bonus_exp
    next_exp = actor.next_level_exp - actor.current_level_exp
    rate = now_exp * 1.0 / next_exp
    draw_exp_gauge(actor, rect, rate)
  end
  #--------------------------------------------------------------------------
  # * draw_exp_gauge
  #--------------------------------------------------------------------------
  def draw_exp_gauge(actor, rect, rate)
    rate = [[rate, 1.0].min, 0.0].max
    dx = (rect.width - [rect.width, 96].min) / 2 + rect.x
    dy = rect.y + line_height * 2 + 96
    dw = [rect.width, 96].min
    colour1 = MSCR::SYS::LV_GAUGE_COLOR[0]
    colour2 = MSCR::SYS::LV_GAUGE_COLOR[1]
    draw_gauge_ex(dx, dy + 8, dw, 12, rate, colour1, colour2)
    fmt = $data_dialogue[MSCR::BATTLE::VICTORY_TEXTEXPPERC]
    text = sprintf(fmt, [rate * 100, 100].min)
    if [rate * 100, 100.00].min == 100.00
      change_color(power_up_color)
      text = $data_dialogue[MSCR::BATTLE::VICTORY_TEXTLEVELUP]
      text = $data_dialogue[MSCR::BATTLE::VICTORY_TEXTLEVELMAX] if actor.max_level?
    end
    draw_text(dx, dy, dw, line_height, text, 1)
  end
  #--------------------------------------------------------------------------
  # * draw_actor_face
  #--------------------------------------------------------------------------
  def draw_actor_face(actor, rect)
    face_name = actor.face_name
    face_index = actor.face_index
    bitmap = Cache.face(face_name)
    rw = [rect.width, 96].min
    face_rect = Rect.new(face_index % 4 * 96, face_index / 4 * 96, rw, 96)
    rx = (rect.width - rw) / 2 + rect.x
    contents.blt(rx, rect.y + line_height * 2, bitmap, face_rect, 255)
  end
  #--------------------------------------------------------------------------
  # * draw_exp_gain
  #--------------------------------------------------------------------------
  def draw_exp_gain(actor, rect)
    dw = rect.width - (rect.width - [rect.width, 96].min) / 2
    dy = rect.y + line_height * 3 + 96
    fmt = $data_dialogue[MSCR::BATTLE::VICTORY_TEXTEXP]
    text = sprintf(fmt, actor_exp_gain(actor))
    #change_color(power_up_color)
    draw_text(rect.x, dy + 8, dw, line_height, text, 2)
  end
  #--------------------------------------------------------------------------
  # * actor_exp_gain
  #--------------------------------------------------------------------------
  def actor_exp_gain(actor)
    n = @exp_total * actor.final_exp_rate
    return n.to_i
  end

end #Window_VictoryEXP

#██╗   ██╗██╗ ██████╗████████╗ ██████╗ ██████╗ ██╗   ██╗    ██╗     ███████╗██╗   ██╗███████╗██╗         ██╗   ██╗██████╗
#██║   ██║██║██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗╚██╗ ██╔╝    ██║     ██╔════╝██║   ██║██╔════╝██║         ██║   ██║██╔══██╗
#██║   ██║██║██║        ██║   ██║   ██║██████╔╝ ╚████╔╝     ██║     █████╗  ██║   ██║█████╗  ██║         ██║   ██║██████╔╝
#╚██╗ ██╔╝██║██║        ██║   ██║   ██║██╔══██╗  ╚██╔╝      ██║     ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║         ██║   ██║██╔═══╝
# ╚████╔╝ ██║╚██████╗   ██║   ╚██████╔╝██║  ██║   ██║       ███████╗███████╗ ╚████╔╝ ███████╗███████╗    ╚██████╔╝██║
#  ╚═══╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝       ╚══════╝╚══════╝  ╚═══╝  ╚══════╝╚══════╝     ╚═════╝ ╚═╝
class Window_VictoryLevelUp < Window_Base

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize
    super((Graphics.width / 2) / 2, fitting_height(1), Graphics.width / 2, window_height)
    hide
  end
  #--------------------------------------------------------------------------
  # * window_height
  #--------------------------------------------------------------------------
  def window_height
    return Graphics.height - fitting_height(9)
  end
  #--------------------------------------------------------------------------
  # * refresh
  #--------------------------------------------------------------------------
  def refresh(actor, temp_actor)
    contents.clear
    reset_font_settings
    MSCR::SOUND::SE_BATTLE_LEVELUP.play
    draw_actor_changes(actor, temp_actor)
  end
  #--------------------------------------------------------------------------
  # * draw_actor_changes
  #--------------------------------------------------------------------------
  def draw_actor_changes(actor, temp_actor)
    draw_actor_image(actor, temp_actor)
    draw_param_names(actor)
    draw_former_stats(temp_actor)
    draw_arrows
    draw_newer_stats(actor, temp_actor)
  end
  #--------------------------------------------------------------------------
  # * draw_actor_image
  #--------------------------------------------------------------------------
  def draw_actor_image(actor, temp_actor)
    draw_actor_face(actor, 8, 8)
    exp = actor.exp - temp_actor.exp
    text = sprintf($data_dialogue[MSCR::BATTLE::VICTORY_TEXTEXP], exp)
    change_color(normal_color)
    contents.font.size = 20
    draw_text(0, 104, 104, line_height, text, 2)
    reset_font_settings
  end
  #--------------------------------------------------------------------------
  # * draw_param_names
  #--------------------------------------------------------------------------
  def draw_param_names(actor)
    change_color(system_color)
    text = Vocab.level
    draw_text(120, 8, 72, line_height, text, 1)
    n = line_height
    for i in 0..7
      next if i == 1 || i == 6
      n += line_height
      text = Vocab.param(i)
      draw_text(120, n, 72, line_height, text, 1)
    end
  end
  #--------------------------------------------------------------------------
  # * draw_former_stats
  #--------------------------------------------------------------------------
  def draw_former_stats(actor)
    change_color(normal_color)
    draw_text(188, 8, 32, line_height, actor.level, 2)
    n = line_height
    for i in 0..7
      next if i == 1 || i == 6
      n += line_height
      draw_text(188, n, 32, line_height, actor.param_base(i), 2)
    end
  end
  #--------------------------------------------------------------------------
  # * draw_arrows
  #--------------------------------------------------------------------------
  def draw_arrows
    change_color(system_color)
    draw_text(226, 8, 24, line_height, ">", 1)
    n = line_height
    for i in 0..7
      next if i == 1 || i == 6
      n += line_height
      draw_text(226, n, 24, line_height, ">", 1)
    end
  end
  #--------------------------------------------------------------------------
  # * draw_newer_stats
  #--------------------------------------------------------------------------
  def draw_newer_stats(actor, temp_actor)
    change_color(param_change_color(actor.level - temp_actor.level))
    draw_text(240, 8, 32, line_height, actor.level, 2)
    n = line_height
    for i in 0..7
      next if i == 1 || i == 6
      n += line_height
      change_color(param_change_color(actor.param_base(i) - temp_actor.param_base(i)))
      draw_text(240, n, 32, line_height, actor.param_base(i), 2)
    end
  end

end #Window_VictoryLevelUp

#██╗   ██╗██╗ ██████╗████████╗ ██████╗ ██████╗ ██╗   ██╗    ███████╗██████╗  ██████╗ ██╗██╗     ███████╗
#██║   ██║██║██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗╚██╗ ██╔╝    ██╔════╝██╔══██╗██╔═══██╗██║██║     ██╔════╝
#██║   ██║██║██║        ██║   ██║   ██║██████╔╝ ╚████╔╝     ███████╗██████╔╝██║   ██║██║██║     ███████╗
#╚██╗ ██╔╝██║██║        ██║   ██║   ██║██╔══██╗  ╚██╔╝      ╚════██║██╔═══╝ ██║   ██║██║██║     ╚════██║
# ╚████╔╝ ██║╚██████╗   ██║   ╚██████╔╝██║  ██║   ██║       ███████║██║     ╚██████╔╝██║███████╗███████║
#  ╚═══╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝       ╚══════╝╚═╝      ╚═════╝ ╚═╝╚══════╝╚══════╝
class Window_VictorySpoils < Window_ItemList

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize
    super(32, fitting_height(1), 321, window_height)
    hide
  end
  #--------------------------------------------------------------------------
  # * window_height
  #--------------------------------------------------------------------------
  def window_height
    return Graphics.height - fitting_height(4) - fitting_height(1)
  end
  #--------------------------------------------------------------------------
  # * spacing
  #--------------------------------------------------------------------------
  def spacing; return 32; end
  #--------------------------------------------------------------------------
  # * make
  #--------------------------------------------------------------------------
  def make(gold, drops)
    @gold = gold
    @drops = drops
    refresh
    select(0)
    activate
  end
  #--------------------------------------------------------------------------
  # * make_item_list
  #--------------------------------------------------------------------------
  def make_item_list
    @data = [nil]
    items = {}
    weapons = {}
    armours = {}
    @goods = {}
    for item in @drops
      case item
      when RPG::Item
        items[item] = 0 if items[item].nil?
        items[item] += 1
      when RPG::Weapon
        weapons[item] = 0 if weapons[item].nil?
        weapons[item] += 1
      when RPG::Armor
        armours[item] = 0 if armours[item].nil?
        armours[item] += 1
      end
    end
    items = items.sort { |a,b| a[0].id <=> b[0].id }
    weapons = weapons.sort { |a,b| a[0].id <=> b[0].id }
    armours = armours.sort { |a,b| a[0].id <=> b[0].id }
    for key in items; @goods[key[0]] = key[1]; @data.push(key[0]); end
    for key in weapons; @goods[key[0]] = key[1]; @data.push(key[0]); end
    for key in armours; @goods[key[0]] = key[1]; @data.push(key[0]); end
  end
  #--------------------------------------------------------------------------
  # * draw_item
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    rect = item_rect(index)
    reset_font_settings
    if item.nil?
      draw_gold(rect)
      return
    end
    rect.width -= 4
    draw_item_name(item, rect.x, rect.y, true, rect.width - 24)
    draw_item_number(rect, item)
  end
  #--------------------------------------------------------------------------
  # * draw_gold
  #--------------------------------------------------------------------------
  def draw_gold(rect)
    text = Vocab.currency_unit
    draw_icon(MSCR::ICON::CURRENCY, rect.x, rect.y)
    draw_currency_value(@gold, text, rect.x, rect.y, rect.width)
  end
  #--------------------------------------------------------------------------
  # * draw_item_number
  #--------------------------------------------------------------------------
  def draw_item_number(rect, item)
    number = @goods[item]
    draw_text(rect, sprintf("×%s", number), 2)
  end

end #Window_VictorySpoils

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ██████╗  █████╗ ████████╗████████╗██╗     ███████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ██████╔╝███████║   ██║      ██║   ██║     █████╗
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝
class Scene_Battle < Scene_Base

  #--------------------------------------------------------------------------
  # * create_all_windows
  #--------------------------------------------------------------------------
  # alias scene_battle_create_all_windows_va create_all_windows
  # def create_all_windows
  #   scene_battle_create_all_windows_va
  #   create_victory_aftermath_windows
  # end
  def create_all_windows
    create_message_window
    create_log_window
    create_status_window
    create_info_viewport
    create_actor_command_window
    create_actoraction_window
    create_skill_window
    create_item_window
    create_actor_window
    create_enemy_window
    create_victory_aftermath_windows
    @log_window.visible = false
  end
  #--------------------------------------------------------------------------
  # * close_battle_windows
  #--------------------------------------------------------------------------
  def close_battle_windows
    @status_window.close
  end
  #--------------------------------------------------------------------------
  # * create_victory_aftermath_windows
  #--------------------------------------------------------------------------
  def create_victory_aftermath_windows
    @victory_title_window = Window_VictoryTitle.new
    @victory_exp_window = Window_VictoryExp.new
    @victory_level_window = Window_VictoryLevelUp.new
    @victory_spoils_window = Window_VictorySpoils.new
  end
  #--------------------------------------------------------------------------
  # * show_victory_display_exp
  #--------------------------------------------------------------------------
  def show_victory_display_exp
    @victory_title_window.open
    text = $data_dialogue[MSCR::BATTLE::VICTORY_TEXTWIN]
    @victory_title_window.refresh(text)
    @victory_exp_window.open
    @victory_exp_window.refresh
  end
  #--------------------------------------------------------------------------
  # * show_victory_level_up
  #--------------------------------------------------------------------------
  def show_victory_level_up(actor, temp_actor)
    @victory_exp_window.hide
    fmt = $data_dialogue[MSCR::BATTLE::VICTORY_TEXTWINLEVEL]
    text = sprintf(fmt, actor.name)
    @victory_title_window.refresh(text)
    @victory_level_window.show
    @victory_level_window.refresh(actor, temp_actor)
  end
  #--------------------------------------------------------------------------
  # * show_victory_spoils
  #--------------------------------------------------------------------------
  def show_victory_spoils(gold, drops)
    @victory_exp_window.hide
    @victory_level_window.hide
    #---
    text = $data_dialogue[MSCR::BATTLE::VICTORY_TEXTWINSPOIL]
    @victory_title_window.refresh(text)
    @victory_title_window.x -= 128#96
    #---
    @victory_spoils_window.show
    @victory_spoils_window.make(gold, drops)
  end
  #--------------------------------------------------------------------------
  # * close_victory_windows
  #--------------------------------------------------------------------------
  def close_victory_windows
    @victory_title_window.close
    @victory_exp_window.close
    @victory_level_window.close
    @victory_spoils_window.close
    wait(30)
  end

end # Scene_Battle
