#==============================================================================
# Menu_Shopping
# Edited    August 3 2019
#==============================================================================
#███████╗██╗  ██╗ ██████╗ ██████╗      ██████╗ ██████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
#██╔════╝██║  ██║██╔═══██╗██╔══██╗    ██╔═══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
#███████╗███████║██║   ██║██████╔╝    ██║   ██║██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║███████╗
#╚════██║██╔══██║██║   ██║██╔═══╝     ██║   ██║██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║╚════██║
#███████║██║  ██║╚██████╔╝██║         ╚██████╔╝██║        ██║   ██║╚██████╔╝██║ ╚████║███████║
#╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝          ╚═════╝ ╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
class Window_ShopOptions < Window_Command

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(purchase_only)
    @purchase_only = purchase_only
    super(-(window_width), 0)
  end

  def opening_animation
    @new_x = 0
  end

  def closing_animation
    @new_x = -(window_width)
  end
  #--------------------------------------------------------------------------
  # * Get Window Width
  #--------------------------------------------------------------------------
  def window_width
    104
  end
  #--------------------------------------------------------------------------
  # * Create Command List
  #--------------------------------------------------------------------------
  def make_command_list
    add_command(Vocab::ShopBuy,    :buy)
    add_command(Vocab::ShopSell,   :sell,   !@purchase_only)
    add_command(Vocab::ShopCancel, :cancel)
  end

end #Window_ShopOptions

#██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗    ███████╗██╗  ██╗ ██████╗ ██████╗     ██████╗ ██╗   ██╗██╗   ██╗
#██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║    ██╔════╝██║  ██║██╔═══██╗██╔══██╗    ██╔══██╗██║   ██║╚██╗ ██╔╝
#██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    ███████╗███████║██║   ██║██████╔╝    ██████╔╝██║   ██║ ╚████╔╝
#██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║    ╚════██║██╔══██║██║   ██║██╔═══╝     ██╔══██╗██║   ██║  ╚██╔╝
#╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝    ███████║██║  ██║╚██████╔╝██║         ██████╔╝╚██████╔╝   ██║
# ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝         ╚═════╝  ╚═════╝    ╚═╝
class Window_ShopBuy < Window_Selectable

  alias mscr_shopmenu_shopbuy_initialize initialize
  def initialize(x,y,height,shop_goods)
    mscr_shopmenu_shopbuy_initialize(x,y,height,shop_goods)
    @info_window = Window_ItemInfo.new
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    @info_window.update_item(@index == -1 ? nil : @data[@index]) if @data
  end
  #--------------------------------------------------------------------------
  # * Get Window Width
  #--------------------------------------------------------------------------
  def window_width
    return 280
  end
  #--------------------------------------------------------------------------
  # Get Currency Unit
  #--------------------------------------------------------------------------
  def currency_unit
    Vocab::currency_unit
  end
  #--------------------------------------------------------------------------
  # * Get Item
  #--------------------------------------------------------------------------
  def item
    @data && index >= 0 ? @data[index] : nil
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    rect = item_rect(index)
    draw_item_name(item, rect.x, rect.y, enable?(item))
    draw_currency_value(price(item), currency_unit, rect.width-64, rect.y, 64)
  end
  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  alias mscr_shopmenu_shopbuy_dispose dispose
  def dispose
    mscr_shopmenu_shopbuy_dispose
    @info_window.dispose
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

end #Window_ShopBuy

#██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗    ███████╗██╗  ██╗ ██████╗ ██████╗     ███████╗███████╗██╗     ██╗
#██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║    ██╔════╝██║  ██║██╔═══██╗██╔══██╗    ██╔════╝██╔════╝██║     ██║
#██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    ███████╗███████║██║   ██║██████╔╝    ███████╗█████╗  ██║     ██║
#██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║    ╚════██║██╔══██║██║   ██║██╔═══╝     ╚════██║██╔══╝  ██║     ██║
#╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝    ███████║██║  ██║╚██████╔╝██║         ███████║███████╗███████╗███████╗
# ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝         ╚══════╝╚══════╝╚══════╝╚══════╝
class Window_ShopSell < Window_ItemList

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height)
    super(x, y, width, height)
  end
  #--------------------------------------------------------------------------
  # * Include in Item List?
  #--------------------------------------------------------------------------
  def include?(item)
    (item.is_a?(RPG::Item) || item.is_a?(RPG::EquipItem)) && item.price > 0
  end
  #--------------------------------------------------------------------------
  # * Get Activation State of Selection Item
  #--------------------------------------------------------------------------
  def current_item_enabled?
    enable?(@data[index])
  end
  #--------------------------------------------------------------------------
  # * Display in Enabled State?
  #--------------------------------------------------------------------------
  def enable?(item)
    item && item.price > 0
  end
  #--------------------------------------------------------------------------
  # Get Currency Unit
  #--------------------------------------------------------------------------
  def currency_unit
    Vocab::currency_unit
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    rect = item_rect(index)
    draw_item_name(item, rect.x, rect.y, enable?(item))
    draw_currency_value(item.price / 2, currency_unit, rect.width-64, rect.y, 64)
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

end #Window_ShopSell

#███████╗██╗  ██╗ ██████╗ ██████╗     ███╗   ██╗██╗   ██╗███╗   ███╗██████╗ ███████╗██████╗
#██╔════╝██║  ██║██╔═══██╗██╔══██╗    ████╗  ██║██║   ██║████╗ ████║██╔══██╗██╔════╝██╔══██╗
#███████╗███████║██║   ██║██████╔╝    ██╔██╗ ██║██║   ██║██╔████╔██║██████╔╝█████╗  ██████╔╝
#╚════██║██╔══██║██║   ██║██╔═══╝     ██║╚██╗██║██║   ██║██║╚██╔╝██║██╔══██╗██╔══╝  ██╔══██╗
#███████║██║  ██║╚██████╔╝██║         ██║ ╚████║╚██████╔╝██║ ╚═╝ ██║██████╔╝███████╗██║  ██║
#╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝         ╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝
class Window_ShopNumber < Window_Selectable

  #--------------------------------------------------------------------------
  # * Update Quantity
  #--------------------------------------------------------------------------
  def update_number
    change_number(1)   if Input.repeat?(:UP)
    change_number(-1)  if Input.repeat?(:DOWN)
    change_number(10)  if Input.repeat?(:RIGHT)
    change_number(-10) if Input.repeat?(:LEFT)
  end

end #Window_ShopNumber

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ███████╗██╗  ██╗ ██████╗ ██████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██╔════╝██║  ██║██╔═══██╗██╔══██╗
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ███████╗███████║██║   ██║██████╔╝
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ╚════██║██╔══██║██║   ██║██╔═══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ███████║██║  ██║╚██████╔╝██║
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝
class Scene_Shop < Scene_MenuBase

  #--------------------------------------------------------------------------
  # * Start Processing
  #--------------------------------------------------------------------------
  def start
    super
    create_gold_window
    create_command_window
    create_number_window
    create_buy_window
    create_sell_window
  end
  #--------------------------------------------------------------------------
  # * Create Gold Window
  #--------------------------------------------------------------------------
  def create_gold_window
    @gold_window = Window_Gold.new
    @gold_window.x = 104
    @gold_window.viewport = @viewport
  end
  #--------------------------------------------------------------------------
  # * Create Command Window
  #--------------------------------------------------------------------------
  def create_command_window
    @command_window = Window_ShopOptions.new(@purchase_only)
    @command_window.viewport = @viewport
    @command_window.set_handler(:buy,    method(:command_buy))
    @command_window.set_handler(:sell,   method(:command_sell))
    @command_window.set_handler(:cancel, method(:return_scene))
  end
  #--------------------------------------------------------------------------
  # * Create Quantity Input Window
  #--------------------------------------------------------------------------
  def create_number_window
    @number_window = Window_ShopNumber.new(0, @command_window.height, 96)
    @number_window.viewport = @viewport
    @number_window.z = @command_window.z + 1
    @number_window.hide
    @number_window.set_handler(:ok,     method(:on_number_ok))
    @number_window.set_handler(:cancel, method(:on_number_cancel))
  end
  #--------------------------------------------------------------------------
  # * Create Purchase Window
  #--------------------------------------------------------------------------
  def create_buy_window
    @buy_window = Window_ShopBuy.new(@command_window.width, @gold_window.height,
                                     Graphics.height-@gold_window.height, @goods)
    @buy_window.viewport = @viewport
    @buy_window.hide
    @buy_window.set_handler(:ok,     method(:on_buy_ok))
    @buy_window.set_handler(:cancel, method(:on_buy_cancel))
  end
  #--------------------------------------------------------------------------
  # * Create Sell Window
  #--------------------------------------------------------------------------
  def create_sell_window
    @sell_window = Window_ShopSell.new(@command_window.width, @gold_window.height,
                                       280, Graphics.height-@gold_window.height)
    @sell_window.viewport = @viewport
    @sell_window.hide
    @sell_window.set_handler(:ok,     method(:on_sell_ok))
    @sell_window.set_handler(:cancel, method(:on_sell_cancel))
  end
  #--------------------------------------------------------------------------
  # * [Buy] Command
  #--------------------------------------------------------------------------
  def command_buy
    @buy_window.money = money
    @buy_window.show.activate
    @buy_window.select(0)
  end
  #--------------------------------------------------------------------------
  # * [Sell] Command
  #--------------------------------------------------------------------------
  def command_sell
    @sell_window.refresh
    @sell_window.show.activate
    @sell_window.select(0)
  end
  #--------------------------------------------------------------------------
  # * Buy [OK]
  #--------------------------------------------------------------------------
  def on_buy_ok
    @item = @buy_window.item
    @number_window.set(@item, max_buy, buying_price, currency_unit)
    @number_window.show.activate
  end
  #--------------------------------------------------------------------------
  # * Buy [Cancel]
  #--------------------------------------------------------------------------
  def on_buy_cancel
    @command_window.activate
    @buy_window.hide
  end
  #--------------------------------------------------------------------------
  # * Sell [OK]
  #--------------------------------------------------------------------------
  def on_sell_ok
    @item = @sell_window.item
    @number_window.set(@item, max_sell, selling_price, currency_unit)
    @number_window.show.activate
  end
  #--------------------------------------------------------------------------
  # * Sell [Cancel]
  #--------------------------------------------------------------------------
  def on_sell_cancel
    @command_window.activate
    @sell_window.hide
  end
  #--------------------------------------------------------------------------
  # * Buy [OK]
  #--------------------------------------------------------------------------
  def on_buy_ok
    @item = @buy_window.item
    @number_window.set(@item, max_buy, buying_price, currency_unit)
    @number_window.show.activate
  end
  #--------------------------------------------------------------------------
  # * Quantity Input [OK]
  #--------------------------------------------------------------------------
  def on_number_ok
    case @command_window.current_symbol
    when :buy
      do_buy(@number_window.number)
    when :sell
      do_sell(@number_window.number)
    end
    end_number_input
    @gold_window.refresh
  end
  #--------------------------------------------------------------------------
  # * Quantity Input [Cancel]
  #--------------------------------------------------------------------------
  def on_number_cancel
    Sound.play_cancel
    end_number_input
  end
  #--------------------------------------------------------------------------
  # * Exit Quantity Input
  #--------------------------------------------------------------------------
  def end_number_input
    @number_window.hide
    case @command_window.current_symbol
    when :buy
      @buy_window.money = money
      @buy_window.show.activate
    when :sell
      @sell_window.refresh
      @sell_window.show.activate
    end
  end

end #Scene_Shop
