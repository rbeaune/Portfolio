#==============================================================================
# Menu_ItemGet
# Edited    May 26 2020
#==============================================================================
# ██████╗ ███████╗████████╗    ██╗████████╗███████╗███╗   ███╗    ██╗███╗   ██╗███████╗ ██████╗
#██╔════╝ ██╔════╝╚══██╔══╝    ██║╚══██╔══╝██╔════╝████╗ ████║    ██║████╗  ██║██╔════╝██╔═══██╗
#██║  ███╗█████╗     ██║       ██║   ██║   █████╗  ██╔████╔██║    ██║██╔██╗ ██║█████╗  ██║   ██║
#██║   ██║██╔══╝     ██║       ██║   ██║   ██╔══╝  ██║╚██╔╝██║    ██║██║╚██╗██║██╔══╝  ██║   ██║
#╚██████╔╝███████╗   ██║       ██║   ██║   ███████╗██║ ╚═╝ ██║    ██║██║ ╚████║██║     ╚██████╔╝
# ╚═════╝ ╚══════╝   ╚═╝       ╚═╝   ╚═╝   ╚══════╝╚═╝     ╚═╝    ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝
class Window_GetItemInfo < Window_Base

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize(name, desc, icon, amount, value)
    dw = Graphics.width / 2
    dh = Graphics.height / 2 - 48
    dx = Graphics.width / 4
    dy = Graphics.height / 4 + 64
    super(dx,dy,dw,dh)
    @item_name = name
    @item_desc = desc
    @item_price = value
    @icon_index = icon
    @amount = amount
    self.arrows_visible = false
    self.opacity = 0
    self.contents_opacity = 0
    MSCR::SOUND::ME_ITEMGET.play
  end

  def opening_animation
    @new_y = Graphics.height / 4
    @new_opacity = 255
  end

  def closing_animation
  end
  #--------------------------------------------------------------------------
  # * start_prompt
  #--------------------------------------------------------------------------
  def start_prompt
    $game_message.background = 2
    $game_message.add("")
    Fiber.yield while $game_message.busy?
    SceneManager.scene.instance_variable_get(:@getiteminfo_window).dispose
    SceneManager.scene.instance_variable_set(:@getiteminfo_window, nil)
  end
  #--------------------------------------------------------------------------
  # * refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    reset_font_settings
    draw_item_info
    start_prompt
  end
  #--------------------------------------------------------------------------
  # draw_item_info
  #--------------------------------------------------------------------------
  def draw_item_info
    draw_item_image
    draw_item_name
    draw_item_description
    draw_item_value
  end
  #--------------------------------------------------------------------------
  # draw_item_image
  #--------------------------------------------------------------------------
  def draw_item_image
    dw = 72
    dh = 72
    dx = 8
    dy = 8
    bitmap = Cache.system("Iconset")
    rect = Rect.new(@icon_index % 16 * 24, @icon_index / 16 * 24, 24, 24)
    target = Rect.new(dx, dy, dw, dh)
    contents.stretch_blt(target, bitmap, rect)
  end
  #--------------------------------------------------------------------------
  # draw_item_name
  #--------------------------------------------------------------------------
  def draw_item_name
    contents.font.size = 28
    draw_text(80, 44, self.width - 88, line_height, @item_name + (@amount > 0 ? " (#{@amount.to_s})" : ""), 1)
    draw_horz_line(8, 80, (self.width - 40))
  end
  #--------------------------------------------------------------------------
  # draw_item_description
  #--------------------------------------------------------------------------
  def draw_item_description
    @item_desc.split(/\\n/).each_with_index { |line, i|
      line.slice!(line.length-1) unless line[line.length-1] > ' '
      contents.font.size = 24
      draw_text(8, 96 + (line_height * i), self.width - 24, line_height, line, 1)
    }
  end
  #--------------------------------------------------------------------------
  # draw_item_value
  #--------------------------------------------------------------------------
  def draw_item_value
    return if @item_price == 0
    price = (@item_price > 0 ? @item_price.to_s : MSCR::WINDOWS::NOSALE)
    dy = self.height - line_height * 2
    contents.font.size = 32
    draw_icon(MSCR::ICON::CURRENCY,8,dy)
    draw_currency_value(price, Vocab::currency_unit, 32, dy, text_size(price).width + 16)
  end

end #Window_GetItemInfo

# ██████╗  █████╗ ███╗   ███╗███████╗    ██████╗  █████╗ ██████╗ ████████╗██╗   ██╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝╚██╗ ██╔╝
#██║  ███╗███████║██╔████╔██║█████╗      ██████╔╝███████║██████╔╝   ██║    ╚████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔═══╝ ██╔══██║██╔══██╗   ██║     ╚██╔╝
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║     ██║  ██║██║  ██║   ██║      ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝      ╚═╝
class Game_Party < Game_Unit

  #--------------------------------------------------------------------------
  # * gain_item
  #--------------------------------------------------------------------------
  alias mscr_itemget_gainitem gain_item
  def gain_item(item, amount, include_equip = false)
    show_getitem_window(item, amount) if SceneManager.scene_is?(Scene_Map) && !item.nil?
    mscr_itemget_gainitem(item, amount, include_equip)
  end
  #--------------------------------------------------------------------------
  # * show_getitem_window
  #--------------------------------------------------------------------------
  def show_getitem_window(item, amount)
    name = item.name
    desc = item.description
    icon = item.icon_index
    value = item.price
    create_getitem_window(name,desc,icon,amount,value)
  end
  #--------------------------------------------------------------------------
  # * create_getitem_window
  #--------------------------------------------------------------------------
  def create_getitem_window(name, desc, icon, amount, value)
    infowindow = Window_GetItemInfo.new(name, desc, icon, amount, value)
    SceneManager.scene.instance_variable_set(:@getiteminfo_window, infowindow)
    infowindow.refresh
  end

end #Game_Party

# ██████╗  █████╗ ███╗   ███╗███████╗    ██╗███╗   ██╗████████╗███████╗██████╗ ██████╗ ██████╗ ███████╗████████╗███████╗██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██║████╗  ██║╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ██║██╔██╗ ██║   ██║   █████╗  ██████╔╝██████╔╝██████╔╝█████╗     ██║   █████╗  ██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗██╔═══╝ ██╔══██╗██╔══╝     ██║   ██╔══╝  ██╔══██╗
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║██║ ╚████║   ██║   ███████╗██║  ██║██║     ██║  ██║███████╗   ██║   ███████╗██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
class Game_Interpreter

  #--------------------------------------------------------------------------
  # * itemget
  #--------------------------------------------------------------------------
  def itemget(name, desc, icon, amount = 0, value = 0)
    $game_party.create_getitem_window(name, desc, icon, amount, value)
  end

end #Game_Interpreter
