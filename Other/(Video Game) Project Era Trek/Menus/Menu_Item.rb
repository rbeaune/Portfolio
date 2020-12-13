#===============================================================================
# Menu_Item
# Edited    March 28 2020
#===============================================================================
#██████╗  █████╗ ████████╗ █████╗     ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗
#██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗
#██║  ██║███████║   ██║   ███████║    ██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝
#██║  ██║██╔══██║   ██║   ██╔══██║    ██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗
#██████╔╝██║  ██║   ██║   ██║  ██║    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║
#╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
module DataManager

  #--------------------------------------------------------------------------
  # load_database
  #--------------------------------------------------------------------------
  class <<self; alias mscr_itemmenu_datamanager_loaddatabase load_database; end
  def self.load_database
    mscr_itemmenu_datamanager_loaddatabase
    mscr_itemmenu_datamanager_load_notetags
  end
  #--------------------------------------------------------------------------
  # mscr_itemmenu_datamanager_load_notetags
  #--------------------------------------------------------------------------
  def self.mscr_itemmenu_datamanager_load_notetags
    groups = [$data_items, $data_weapons, $data_armors]
    for group in groups
      for obj in group
        next if obj.nil?
        obj.mscr_itemmenu_baseitem_loadnotetags
      end
    end
  end

end # DataManager

#██████╗ ██████╗  ██████╗       ██████╗  █████╗ ███████╗███████╗██╗████████╗███████╗███╗   ███╗
#██╔══██╗██╔══██╗██╔════╝ ██╗██╗██╔══██╗██╔══██╗██╔════╝██╔════╝██║╚══██╔══╝██╔════╝████╗ ████║
#██████╔╝██████╔╝██║  ███╗╚═╝╚═╝██████╔╝███████║███████╗█████╗  ██║   ██║   █████╗  ██╔████╔██║
#██╔══██╗██╔═══╝ ██║   ██║██╗██╗██╔══██╗██╔══██║╚════██║██╔══╝  ██║   ██║   ██╔══╝  ██║╚██╔╝██║
#██║  ██║██║     ╚██████╔╝╚═╝╚═╝██████╔╝██║  ██║███████║███████╗██║   ██║   ███████╗██║ ╚═╝ ██║
#╚═╝  ╚═╝╚═╝      ╚═════╝       ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
class RPG::BaseItem

  #--------------------------------------------------------------------------
  # public instance variables
  #--------------------------------------------------------------------------
  attr_accessor :category
  #--------------------------------------------------------------------------
  # common cache: load_notetags_aim
  #--------------------------------------------------------------------------
  def mscr_itemmenu_baseitem_loadnotetags
    self.note.split(/[\r\n]+/).each { |line|
      case line
      when MSCR::WINDOWS::ICATREGEX
        @category = $1.upcase.to_s
      end
    }
  end

end # RPG::BaseItem

#██╗████████╗███████╗███╗   ███╗     ██████╗ █████╗ ████████╗
#██║╚══██╔══╝██╔════╝████╗ ████║    ██╔════╝██╔══██╗╚══██╔══╝
#██║   ██║   █████╗  ██╔████╔██║    ██║     ███████║   ██║
#██║   ██║   ██╔══╝  ██║╚██╔╝██║    ██║     ██╔══██║   ██║
#██║   ██║   ███████╗██║ ╚═╝ ██║    ╚██████╗██║  ██║   ██║
#╚═╝   ╚═╝   ╚══════╝╚═╝     ╚═╝     ╚═════╝╚═╝  ╚═╝   ╚═╝
class Window_ItemCat < Window_Command

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :item_window
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(-(window_width), 0)
  end

  def opening_animation
    @new_x = 0
  end

  def closing_animation
    @new_x = -(window_width)
  end
  #--------------------------------------------------------------------------
  # * Get Window Height
  #--------------------------------------------------------------------------
  def window_height
    fitting_height(item_max)
  end
  #--------------------------------------------------------------------------
  # * Get Window Width
  #--------------------------------------------------------------------------
  def window_width
    Graphics.width / 5
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    @item_window.category = current_symbol if @item_window
  end
  #--------------------------------------------------------------------------
  # * Create Command List
  #--------------------------------------------------------------------------
  def make_command_list
    add_command($data_dialogue[MSCR::WINDOWS::ITEMCAT_ALL],   :all)
    add_command($data_dialogue[MSCR::WINDOWS::ITEMCAT_EQUIP], :equip)
    add_command($data_dialogue[MSCR::WINDOWS::ITEMCAT_POTS],  :potion)
    add_command($data_dialogue[MSCR::WINDOWS::ITEMCAT_BOOKS], :book)
    add_command($data_dialogue[MSCR::WINDOWS::ITEMCAT_KEYS],  :key)
    add_command($data_dialogue[MSCR::WINDOWS::ITEMCAT_QUEST], :quest)
    add_command($data_dialogue[MSCR::WINDOWS::ITEMCAT_OTHER], :misc)
  end
  #--------------------------------------------------------------------------
  # * Set Item Window
  #--------------------------------------------------------------------------
  def item_window=(item_window)
    @item_window = item_window
    update
  end

end #Window_ItemCat

#██╗████████╗███████╗███╗   ███╗    ██╗     ██╗███████╗████████╗
#██║╚══██╔══╝██╔════╝████╗ ████║    ██║     ██║██╔════╝╚══██╔══╝
#██║   ██║   █████╗  ██╔████╔██║    ██║     ██║███████╗   ██║
#██║   ██║   ██╔══╝  ██║╚██╔╝██║    ██║     ██║╚════██║   ██║
#██║   ██║   ███████╗██║ ╚═╝ ██║    ███████╗██║███████║   ██║
#╚═╝   ╚═╝   ╚══════╝╚═╝     ╚═╝    ╚══════╝╚═╝╚══════╝   ╚═╝
class Window_ItemList < Window_Selectable

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x,y,width,height)
    super
    @info_window = Window_ItemInfo.new
    SceneManager.scene.instance_variable_set(:@itemlistinfo_window, @info_window)
  end
  #--------------------------------------------------------------------------
  # * Get Digit Count
  #--------------------------------------------------------------------------
  def col_max
    return 1
  end
  #--------------------------------------------------------------------------
  # * Get Item
  #--------------------------------------------------------------------------
  def item
    @data && index >= 0 ? @data[index] : nil
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    @info_window.update_item(item)
  end
  #--------------------------------------------------------------------------
  # * make_item_list
  #--------------------------------------------------------------------------
  alias mscr_itemmenu_itemlist_makeitemlist make_item_list
  def make_item_list
    mscr_itemmenu_itemlist_makeitemlist
    sort_list
  end
  #--------------------------------------------------------------------------
  # * Include in Item List?
  #--------------------------------------------------------------------------
  def include?(item)
    case @category
    when :all
      item.is_a?(RPG::Item) || item.is_a?(RPG::EquipItem)
    when :equip
      item.is_a?(RPG::EquipItem)
    when :potion
      item.is_a?(RPG::Item) && !item.key_item? && item.category == "POTION"
    when :book
      item.is_a?(RPG::Item) && !item.key_item? && item.category == "BOOK"
    when :key
      item.is_a?(RPG::Item) && item.key_item? && item.category == "KEY"
    when :quest
      item.is_a?(RPG::Item) && item.key_item? && item.category != "KEY"
    when :misc
      item.is_a?(RPG::Item) && !item.key_item? && item.category == "MISC"
    else
      false
    end
  end
  #--------------------------------------------------------------------------
  # * sort_list
  #--------------------------------------------------------------------------
  def sort_list
    @data.sort_by! {|item| item.name }
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    inum = $game_party.item_number(item)
    if item
      rect = item_rect(index)
      draw_item_name_num(item, rect.x, rect.y, enable?(item), inum)
    end
  end
  #--------------------------------------------------------------------------
  # * Open Window
  #--------------------------------------------------------------------------
  def open
    @info_window.open
    super
  end
  #--------------------------------------------------------------------------
  # * Close Window
  #--------------------------------------------------------------------------
  def close
    @info_window.close
    super
  end
  #--------------------------------------------------------------------------
  # * Show Window
  #--------------------------------------------------------------------------
  def show
    @info_window.show
    super
  end
  #--------------------------------------------------------------------------
  # * Hide Window
  #--------------------------------------------------------------------------
  def hide
    @info_window.hide
    super
  end
  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  alias mscr_itemmenu_itemlist_dispose dispose
  def dispose
    mscr_itemmenu_itemlist_dispose
    @info_window.dispose
    #SceneManager.scene.instance_variable_get(:@itemlistinfo_window).dispose
    #SceneManager.scene.instance_variable_set(:@itemlistinfo_window, nil)
  end

end #Window_ItemList

#██╗████████╗███████╗███╗   ███╗    ██╗███╗   ██╗███████╗ ██████╗
#██║╚══██╔══╝██╔════╝████╗ ████║    ██║████╗  ██║██╔════╝██╔═══██╗
#██║   ██║   █████╗  ██╔████╔██║    ██║██╔██╗ ██║█████╗  ██║   ██║
#██║   ██║   ██╔══╝  ██║╚██╔╝██║    ██║██║╚██╗██║██╔══╝  ██║   ██║
#██║   ██║   ███████╗██║ ╚═╝ ██║    ██║██║ ╚████║██║     ╚██████╔╝
#╚═╝   ╚═╝   ╚══════╝╚═╝     ╚═╝    ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝
class Window_ItemInfo < Window_Base

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize
    dx = SceneManager.scene_is?(Scene_Shop) || SceneManager.scene_is?(Scene_Battle) ? 385 : 512
    super(dx,0,255,480)
    self.arrows_visible = false
    self.height -= 48 if SceneManager.scene_is?(Scene_Battle)
    @item = nil
  end

  def opening_animation
    @new_x = 385
  end

  def closing_animation
    @new_x = 512
    @new_opacity = 0
  end
  #--------------------------------------------------------------------------
  # * update_item
  #--------------------------------------------------------------------------
  def update_item(item)
    return if @item == item
    @item = item
    refresh
  end
  #--------------------------------------------------------------------------
  # * refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    reset_font_settings
    return if @item.nil?
    draw_item_info
  end
  #--------------------------------------------------------------------------
  # draw_item_info
  #--------------------------------------------------------------------------
  def draw_item_info
    draw_item_image
    draw_item_name
    draw_item_description
    draw_item_equip unless !(@item.is_a?(RPG::Weapon) || @item.is_a?(RPG::Armor))
    draw_item_value unless @item.is_a?(RPG::Skill) || SceneManager.scene_is?(Scene_Battle)
    draw_item_typeandcost if @item.is_a?(RPG::Skill)
  end
  #--------------------------------------------------------------------------
  # draw_item_image
  #--------------------------------------------------------------------------
  def draw_item_image
    dw = 120
    dh = 120
    dx = (self.width / 2) - (dw / 2) - 16
    dy = 16#(self.height / 2) - (dh / 2) - 160
    icon_index = @item.icon_index
    bitmap = Cache.system("Iconset")
    rect = Rect.new(icon_index % 16 * 24, icon_index / 16 * 24, 24, 24)
    target = Rect.new(dx, dy, dw, dh)
    contents.stretch_blt(target, bitmap, rect)
  end
  #--------------------------------------------------------------------------
  # draw_item_name
  #--------------------------------------------------------------------------
  def draw_item_name
    num = $game_party.item_number(@item)
    contents.font.size = 28
    draw_text(0, 154, self.width - 16, line_height, @item.name +
              (num > 1 && !@item.is_a?(RPG::Skill) ? " (×#{num.to_s})" : ""), 1)
    draw_horz_line(8, 170, (self.width - 40))
  end
  #--------------------------------------------------------------------------
  # draw_item_description
  #--------------------------------------------------------------------------
  def draw_item_description
    @item.description.split(/\n/).each_with_index { |line, i|
      line.slice!(line.length-1) unless line[line.length-1] > ' '
      contents.font.size = 24
      draw_text(0, 202 + (line_height * i), self.width - 16, line_height, line, 1)
    }
  end
  #--------------------------------------------------------------------------
  # draw_item_equip
  #--------------------------------------------------------------------------
  def draw_item_equip
    dw = self.width
    contents.font.size = 26
    for i in 0...8
      value = @item.params[i]
      dx = i % 2 == 0 ? 32 : (dw / 2) #- 8
      dy = (line_height + 2) * ((i % 2 == 1 ? i - 1 : i) / 2)
      change_color(normal_color, value != 0)
      draw_icon(MSCR::ICON::STATS[i], dx, 272 + dy)
      change_color(param_change_color(value), value != 0)
      text = value.to_i
      text = "+" + text.to_s if value > 0
      text = "------" if value == 0
      draw_text(dx + 8, 272 + dy, dw - (dw / 2) - 32, line_height, text, 1) #Value
    end
  end
  #--------------------------------------------------------------------------
  # draw_item_value
  #--------------------------------------------------------------------------
  def draw_item_value
    return if SceneManager.scene_is?(Scene_Shop)
    return if @item.price == 0
    price = (@item.price > 0 ? @item.price.to_s : MSCR::WINDOWS::NOSALE)
    dy = self.height - line_height * 2
    contents.font.size = 32
    draw_icon(MSCR::ICON::CURRENCY,8,dy)
    draw_currency_value(price, Vocab::currency_unit, 32, dy, text_size(price).width + 16)
  end
  #--------------------------------------------------------------------------
  # draw_item_typeandcost
  #--------------------------------------------------------------------------
  def draw_item_typeandcost
    cost = @item.mp_cost
    type = $data_system.skill_types[@item.stype_id]
    dy = self.height - line_height * 3
    contents.font.size = 32
    draw_text(8, dy, self.width, line_height * 2, type)
    draw_text(0, dy, self.width - 68, line_height * 2, $data_dialogue[MSCR::WINDOWS::ITEM_COST], 2)
    change_color(system_color)
    draw_text(0, dy, self.width - 32, line_height * 2, cost, 2)
  end

end #Window_ItemInfo

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ██╗████████╗███████╗███╗   ███╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██║╚══██╔══╝██╔════╝████╗ ████║
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ██║   ██║   █████╗  ██╔████╔██║
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██║   ██║   ██╔══╝  ██║╚██╔╝██║
#███████║╚██████╗███████╗██║ ╚████║███████╗    ██║   ██║   ███████╗██║ ╚═╝ ██║
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚═╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
class Scene_Item < Scene_ItemBase

  #--------------------------------------------------------------------------
  # * Start Processing
  #--------------------------------------------------------------------------
  def start
    super
    create_category_window
    create_itemlist_window
  end
  #--------------------------------------------------------------------------
  # * Create Category Window
  #--------------------------------------------------------------------------
  def create_category_window
    @category_window = Window_ItemCat.new
    @category_window.set_handler(:ok,     method(:on_category_ok))
    @category_window.set_handler(:cancel, method(:return_scene))
  end
  #--------------------------------------------------------------------------
  # * Create Item List Window
  #--------------------------------------------------------------------------
  def create_itemlist_window
    dx = Graphics.width / 5
    dy = 0
    dw = Graphics.width / 2.5
    dh = Graphics.height
    @item_window = Window_ItemList.new(dx,dy,dw,dh)
    @item_window.set_handler(:ok,     method(:on_item_ok))
    @item_window.set_handler(:cancel, method(:on_item_cancel))
    @category_window.item_window = @item_window
  end

end #Scene_Item
