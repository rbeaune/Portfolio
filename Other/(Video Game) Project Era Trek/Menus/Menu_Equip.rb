#===============================================================================
# Menu_Equip
# Edited    March 26 2020
#===============================================================================
# ██████╗  █████╗ ███╗   ███╗███████╗     █████╗  ██████╗████████╗ ██████╗ ██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ███████║██║        ██║   ██║   ██║██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔══██║██║        ██║   ██║   ██║██╔══██╗
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
class Game_Actor < Game_Battler

  #--------------------------------------------------------------------------
  # * Get Equipment Slot Array
  #--------------------------------------------------------------------------
  def equip_slots
    return [0,3,4]  # Weapon, Armour, Accessory
  end

end #Game_Actor

#███████╗ ██████╗ ██╗   ██╗██╗██████╗      █████╗  ██████╗████████╗ ██████╗ ██████╗
#██╔════╝██╔═══██╗██║   ██║██║██╔══██╗    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
#█████╗  ██║   ██║██║   ██║██║██████╔╝    ███████║██║        ██║   ██║   ██║██████╔╝
#██╔══╝  ██║▄▄ ██║██║   ██║██║██╔═══╝     ██╔══██║██║        ██║   ██║   ██║██╔══██╗
#███████╗╚██████╔╝╚██████╔╝██║██║         ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║
#╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚═╝╚═╝         ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
class Window_EquipActor < Window_Selectable

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader :info_window
  attr_reader :list_window
  attr_reader :item_window
  #--------------------------------------------------------------------------
  # * Includes module ActorRibbon
  #--------------------------------------------------------------------------
  include ActorRibbon
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(:left)
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    @info_window.actor = @data[index] if @info_window
    @list_window.actor = @data[index] if @list_window
    @item_window.actor = @data[index] if @item_window
    update_infowindow_position unless !@info_window
  end
  #--------------------------------------------------------------------------
  # * info_window
  #--------------------------------------------------------------------------
  def info_window=(info_window)
    @info_window = info_window
    update
  end
  #--------------------------------------------------------------------------
  # * list_window
  #--------------------------------------------------------------------------
  def list_window=(list_window)
    @list_window = list_window
    update
  end
  #--------------------------------------------------------------------------
  # * item_window
  #--------------------------------------------------------------------------
  def item_window=(item_window)
    @item_window = item_window
    update
  end
  #--------------------------------------------------------------------------
  # * update_infowindow_position
  #--------------------------------------------------------------------------
  def update_infowindow_position
    return if !@info_window
    window = @info_window
    wy = (self.y + (96 * index))
    ay = (wy + window.height) > Graphics.height ? -((wy + window.height) - Graphics.height) : 0
    window.y = wy < 0 ? 0 : wy + ay
  end

end #Window_EquipActor

#███████╗ ██████╗ ██╗   ██╗██╗██████╗      █████╗  ██████╗████████╗ ██████╗ ██████╗     ██╗███╗   ██╗███████╗ ██████╗
#██╔════╝██╔═══██╗██║   ██║██║██╔══██╗    ██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗    ██║████╗  ██║██╔════╝██╔═══██╗
#█████╗  ██║   ██║██║   ██║██║██████╔╝    ███████║██║        ██║   ██║   ██║██████╔╝    ██║██╔██╗ ██║█████╗  ██║   ██║
#██╔══╝  ██║▄▄ ██║██║   ██║██║██╔═══╝     ██╔══██║██║        ██║   ██║   ██║██╔══██╗    ██║██║╚██╗██║██╔══╝  ██║   ██║
#███████╗╚██████╔╝╚██████╔╝██║██║         ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║    ██║██║ ╚████║██║     ╚██████╔╝
#╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚═╝╚═╝         ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝
class Window_EquipActorInfo < Window_Selectable

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :actor
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    dx = 120
    dy = 0
    dw = 208
    dh = fitting_height(6)
    super(dx, dy, dw, dh)
    @actor = nil
    @temp_actor = nil
    refresh
  end
  #--------------------------------------------------------------------------
  # * Set Actor
  #--------------------------------------------------------------------------
  def actor=(actor)
    return if @actor == actor
    @actor = actor
    refresh
  end
  #--------------------------------------------------------------------------
  # * Get Actor
  #--------------------------------------------------------------------------
  def actor
    @actor
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    return unless @actor
    contents.clear
    6.times {|i| draw_item(0, line_height * (i), 2 + i) }
  end
  #--------------------------------------------------------------------------
  # * Set Temporary Actor After Equipment Change
  #--------------------------------------------------------------------------
  def set_temp_actor(temp_actor)
    return if @temp_actor == temp_actor
    @temp_actor = temp_actor
    refresh
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(x, y, param_id)
    draw_param_name(x + 4, y, param_id)
    draw_current_param(x + 94, y, param_id) if @actor
    draw_right_arrow(x + 126, y)
    draw_new_param(x + 150, y, param_id) if @temp_actor
  end
  #--------------------------------------------------------------------------
  # * Draw Parameter Name
  #--------------------------------------------------------------------------
  def draw_param_name(x, y, param_id)
    change_color(system_color)
    draw_text(x, y, 80, line_height, Vocab::param(param_id))
  end
  #--------------------------------------------------------------------------
  # * Draw Current Parameter
  #--------------------------------------------------------------------------
  def draw_current_param(x, y, param_id)
    change_color(normal_color)
    draw_text(x, y, 32, line_height, @actor.param(param_id), 2)
  end
  #--------------------------------------------------------------------------
  # * Draw Right Arrow
  #--------------------------------------------------------------------------
  def draw_right_arrow(x, y)
    change_color(system_color)
    draw_text(x, y, 22, line_height, ">", 1)
  end
  #--------------------------------------------------------------------------
  # * Draw Post-Equipment Change Parameter
  #--------------------------------------------------------------------------
  def draw_new_param(x, y, param_id)
    new_value = @temp_actor.param(param_id)
    change_color(param_change_color(new_value - @actor.param(param_id)))
    draw_text(x, y, 32, line_height, new_value, 2)
  end

end #Window_EquipActorInfo

#███████╗ ██████╗ ██╗   ██╗██╗██████╗ ██████╗ ███████╗██████╗     ██╗     ██╗███████╗████████╗
#██╔════╝██╔═══██╗██║   ██║██║██╔══██╗██╔══██╗██╔════╝██╔══██╗    ██║     ██║██╔════╝╚══██╔══╝
#█████╗  ██║   ██║██║   ██║██║██████╔╝██████╔╝█████╗  ██║  ██║    ██║     ██║███████╗   ██║
#██╔══╝  ██║▄▄ ██║██║   ██║██║██╔═══╝ ██╔═══╝ ██╔══╝  ██║  ██║    ██║     ██║╚════██║   ██║
#███████╗╚██████╔╝╚██████╔╝██║██║     ██║     ███████╗██████╔╝    ███████╗██║███████║   ██║
#╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚═╝╚═╝     ╚═╝     ╚══════╝╚═════╝     ╚══════╝╚═╝╚══════╝   ╚═╝
class Window_EquippedList < Window_Selectable

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :item_window
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    dx = 328
    dy = 0
    dw = Graphics.width - dx
    dh = fitting_height(3)
    super(dx, dy, dw, dh)
    @actor = nil
    refresh
  end
  #--------------------------------------------------------------------------
  # * Set Actor
  #--------------------------------------------------------------------------
  def actor=(actor)
    return if @actor == actor
    @actor = actor
    refresh
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    return if !@actor
    @item_window.slot_id = @actor.equip_slots[index] if @item_window
  end
  #--------------------------------------------------------------------------
  # * Get Number of Items
  #--------------------------------------------------------------------------
  def item_max
    @actor ? @actor.equip_slots.size : 0
  end
  #--------------------------------------------------------------------------
  # * Get Item
  #--------------------------------------------------------------------------
  def item
    @actor ? @actor.equips[index] : nil
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index)
    return unless @actor
    rect = item_rect_for_text(index)
    change_color(system_color, enable?(index))
    draw_text(rect.x, rect.y, 92, line_height, slot_name(index))
    draw_item_name(@actor.equips[index], rect.x + 92, rect.y, enable?(index))
  end
  #--------------------------------------------------------------------------
  # * Get Equipment Slot Name
  #--------------------------------------------------------------------------
  def slot_name(index)
    @actor ? Vocab::etype(@actor.equip_slots[index]) : ""
  end
  #--------------------------------------------------------------------------
  # * Display Equipment Slot in Enabled State?
  #--------------------------------------------------------------------------
  def enable?(index)
    @actor ? @actor.equip_change_ok?(index) : false
  end
  #--------------------------------------------------------------------------
  # * Get Activation State of Selection Item
  #--------------------------------------------------------------------------
  def current_item_enabled?
    enable?(index)
  end
  #--------------------------------------------------------------------------
  # * Set Item Window
  #--------------------------------------------------------------------------
  def item_window=(item_window)
    @item_window = item_window
    update
    refresh
  end
  #--------------------------------------------------------------------------
  # * refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    draw_all_items
  end

end #Window_EquippedList

#███████╗ ██████╗ ██╗   ██╗██╗██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗    ██╗     ██╗███████╗████████╗
#██╔════╝██╔═══██╗██║   ██║██║██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝    ██║     ██║██╔════╝╚══██╔══╝
#█████╗  ██║   ██║██║   ██║██║██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║       ██║     ██║███████╗   ██║
#██╔══╝  ██║▄▄ ██║██║   ██║██║██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║       ██║     ██║╚════██║   ██║
#███████╗╚██████╔╝╚██████╔╝██║██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║       ███████╗██║███████║   ██║
#╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚═╝╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝       ╚══════╝╚═╝╚══════╝   ╚═╝
class Window_EquipmentList < Window_Selectable

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :status_window            # Status window
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    dx = 328
    dy = 96
    dw = Graphics.width - dx
    dh = Graphics.height - dy
    super(dx, dy, dw, dh)
    @actor = nil
    @slot_id = -1
    @data = []
    refresh
  end
  #--------------------------------------------------------------------------
  # * Get Digit Count
  #--------------------------------------------------------------------------
  def col_max
    return 1
  end
  #--------------------------------------------------------------------------
  # * Get Number of Items
  #--------------------------------------------------------------------------
  def item_max
    @data ? @data.size + 1 : 1
  end
  #--------------------------------------------------------------------------
  # * Get Item
  #--------------------------------------------------------------------------
  def slot_id
    @slot_id
  end
  #--------------------------------------------------------------------------
  # * Get Item
  #--------------------------------------------------------------------------
  def item
    @data && index >= 1 ? @data[index - 1] : nil
  end
  #--------------------------------------------------------------------------
  # * Set Actor
  #--------------------------------------------------------------------------
  def actor=(actor)
    return if @actor == actor
    @actor = actor
    refresh
  end
  #--------------------------------------------------------------------------
  # * Set Equipment Slot ID
  #--------------------------------------------------------------------------
  def slot_id=(slot_id)
    return if @slot_id == slot_id
    @slot_id = slot_id
    refresh
  end
  #--------------------------------------------------------------------------
  # * make_item_list
  #--------------------------------------------------------------------------
  def make_item_list
    @data = $game_party.all_items.select {|item| include?(item) }
    sort_list
  end
  #--------------------------------------------------------------------------
  # * sort_list
  #--------------------------------------------------------------------------
  def sort_list
    @data.sort_by! {|item| item.name }
  end
  #--------------------------------------------------------------------------
  # * Include in Item List?
  #--------------------------------------------------------------------------
  def include?(item)
    item.is_a?(RPG::EquipItem)
  end
  #--------------------------------------------------------------------------
  # * Get Activation State of Selection Item
  #--------------------------------------------------------------------------
  def current_item_enabled?
    index == 0 ? true : enable?(@data[index - 1])
  end
  #--------------------------------------------------------------------------
  # * Display in Enabled State?
  #--------------------------------------------------------------------------
  def enable?(item)
    return if !@actor
    return true if item.etype_id == @slot_id && @actor.equippable?(item) && !item.nil?
    return false
  end
  #--------------------------------------------------------------------------
  # * Restore Previous Selection Position
  #--------------------------------------------------------------------------
  def select_last
  end
  #--------------------------------------------------------------------------
  # * Set Status Window
  #--------------------------------------------------------------------------
  def status_window=(status_window)
    @status_window = status_window
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index)
    if index == 0
      draw_text(32, 0, self.width, line_height, $data_dialogue[MSCR::WINDOWS::EQUIP_REMOVE])
    else
      item = @data[index - 1]
      inum = $game_party.item_number(item)
      if item
        rect = item_rect(index)
        rect.width -= 4
        draw_item_name_num(item, rect.x, rect.y, enable?(item), inum)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    make_item_list
    create_contents
    draw_all_items
  end

end #Window_EquipmentList

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ███████╗ ██████╗ ██╗   ██╗██╗██████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██╔════╝██╔═══██╗██║   ██║██║██╔══██╗
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      █████╗  ██║   ██║██║   ██║██║██████╔╝
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██╔══╝  ██║▄▄ ██║██║   ██║██║██╔═══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ███████╗╚██████╔╝╚██████╔╝██║██║
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚═╝╚═╝
class Scene_Equip < Scene_MenuBase

  #--------------------------------------------------------------------------
  # * start
  #--------------------------------------------------------------------------
  def start
    super
    create_equipactorinfo_window
    create_equiplist_window
    create_equipped_window
    create_equipactorlist_window
  end
  #--------------------------------------------------------------------------
  # * create_equipactorinfo_window
  #--------------------------------------------------------------------------
  def create_equipactorinfo_window
    @equipactorinfo_window = Window_EquipActorInfo.new
  end
  #--------------------------------------------------------------------------
  # * Create Slot Window
  #--------------------------------------------------------------------------
  def create_equipped_window
    @equipped_window = Window_EquippedList.new
    @equipped_window.item_window = @equiplist_window
    @equipped_window.set_handler(:ok,       method(:on_slot_ok))
    @equipped_window.set_handler(:cancel,   method(:on_slot_cancel))
  end
  #--------------------------------------------------------------------------
  # create_equiplist_window
  #--------------------------------------------------------------------------
  def create_equiplist_window
    @equiplist_window = Window_EquipmentList.new
    @equiplist_window.status_window = @equipactorinfo_window
    @equiplist_window.set_handler(:ok,       method(:on_item_ok))
    @equiplist_window.set_handler(:cancel,   method(:on_item_cancel))
  end
  #--------------------------------------------------------------------------
  # create_actor_window
  #--------------------------------------------------------------------------
  def create_equipactorlist_window
    @equipactorlist_window = Window_EquipActor.new
    @equipactorlist_window.info_window = @equipactorinfo_window
    @equipactorlist_window.list_window = @equipped_window
    @equipactorlist_window.item_window = @equiplist_window
    @equipactorlist_window.set_handler(:ok,     method(:on_actor_ok))
    @equipactorlist_window.set_handler(:cancel, method(:return_scene))
  end
  #--------------------------------------------------------------------------
  # * on_actor_ok
  #--------------------------------------------------------------------------
  def on_actor_ok
    @equipped_window.activate
    @equipped_window.select(0)
  end
  #--------------------------------------------------------------------------
  # * Slot [OK]
  #--------------------------------------------------------------------------
  def on_slot_ok
    @equiplist_window.activate
    @equiplist_window.select(0)
  end
  #--------------------------------------------------------------------------
  # * Slot [Cancel]
  #--------------------------------------------------------------------------
  def on_slot_cancel
    @equipped_window.unselect
    @equipactorlist_window.activate
  end
  #--------------------------------------------------------------------------
  # * Item [OK]
  #--------------------------------------------------------------------------
  def on_item_ok
    if @equiplist_window.index > 0
      Sound.play_equip
      @equipactorinfo_window.actor.change_equip(@equipped_window.index, @equiplist_window.item)
      @equipped_window.activate
      @equipped_window.refresh
      @equiplist_window.unselect
      @equiplist_window.refresh
    else
      Sound.play_equip
      @equipactorinfo_window.actor.change_equip(@equipped_window.index, nil)
      @equipped_window.activate
      @equipped_window.refresh
      @equiplist_window.unselect
      @equiplist_window.refresh
    end
  end
  #--------------------------------------------------------------------------
  # * Item [Cancel]
  #--------------------------------------------------------------------------
  def on_item_cancel
    @equipped_window.activate
    @equiplist_window.unselect
  end

end #Scene_Equip
