#===============================================================================
# Menu_Main
# Edited    May 21 2020
#===============================================================================
# ██████╗  █████╗ ███╗   ███╗███████╗    ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
#██║  ███╗███████║██╔████╔██║█████╗      ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
class Game_System

  attr_accessor :menu_list

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  alias mscr_pmenu_game_system_initialize initialize
  def initialize(*args, &block)
    mscr_pmenu_game_system_initialize(*args, &block)
    load_menu
  end
  #--------------------------------------------------------------------------
  # * load_menu
  #--------------------------------------------------------------------------
  def load_menu
    @menu_list = {}
    rawlist = MSCR::WINDOWS::MENU_LIST
    rawlist.each do |k, v|
      entryname = $data_dialogue[v[0]]
      entrydesc = $data_dialogue[v[1]]
      @menu_list[k]  = [ entryname, entrydesc, v[2], v[3]]
    end
  end

end #Game_System

# ██████╗  █████╗ ███╗   ███╗███████╗    ██╗███╗   ██╗████████╗███████╗██████╗ ██████╗ ██████╗ ███████╗████████╗███████╗██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██║████╗  ██║╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ██║██╔██╗ ██║   ██║   █████╗  ██████╔╝██████╔╝██████╔╝█████╗     ██║   █████╗  ██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗██╔═══╝ ██╔══██╗██╔══╝     ██║   ██╔══╝  ██╔══██╗
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║██║ ╚████║   ██║   ███████╗██║  ██║██║     ██║  ██║███████╗   ██║   ███████╗██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
class Game_Interpreter

  #--------------------------------------------------------------------------
  # * menu_active?
  #--------------------------------------------------------------------------
  def menu_active?(key)
    return $game_system.menu_list[key][3] rescue nil
  end
  #--------------------------------------------------------------------------
  # * menu_active
  #--------------------------------------------------------------------------
  def menu_activate(key, enabled = true)
    $game_system.menu_list[key][3] = enabled
  end

end #Game_Interpreter

#██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗    ██████╗  █████╗ ███████╗███████╗
#██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║    ██╔══██╗██╔══██╗██╔════╝██╔════╝
#██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    ██████╔╝███████║███████╗█████╗
#██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║    ██╔══██╗██╔══██║╚════██║██╔══╝
#╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝    ██████╔╝██║  ██║███████║███████╗
# ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝     ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
class Window_Base < Window

  #--------------------------------------------------------------------------
  # * reset_font_setting
  #   Rewrites the method to include resetting the font name
  #--------------------------------------------------------------------------
  def reset_font_settings
    change_color(normal_color)
    contents.font.name = Font.default_name
    contents.font.size = Font.default_size
    contents.font.bold = Font.default_bold
    contents.font.italic = Font.default_italic
  end
  #--------------------------------------------------------------------------
  # * process_normal_character
  #   font fix
  #--------------------------------------------------------------------------
  alias :process_normal_character_vxa :process_normal_character
  def process_normal_character(c, pos)
    return unless c >= ' '
    process_normal_character_vxa(c, pos)
  end
  #--------------------------------------------------------------------------
  # * draw_gauge_ex
  #   Custom way to draw a gauge
  #--------------------------------------------------------------------------
  def draw_gauge_ex(x, y, width, height, rate, color1, color2)
    fill_w = (width * rate).to_i
    gauge_y = y + line_height - 8
    contents.fill_rect(x-1, gauge_y-1, width+2, height+2, Color.new(255,255,255))
    contents.fill_rect(x, gauge_y, width, height, Color.new(0,0,0))
    contents.gradient_fill_rect(x, gauge_y, fill_w, height, color1, color2)
  end
  #--------------------------------------------------------------------------
  # * draw_text_ex_no_reset
  #   Draws ex text without resetting font
  #--------------------------------------------------------------------------
  def draw_text_ex_no_reset(x, y, text)
    text = convert_escape_characters(text)
    pos = {:x => x, :y => y, :new_x => x, :height => calc_line_height(text)}
    process_character(text.slice!(0, 1), text, pos) until text.empty?
  end
  #--------------------------------------------------------------------------
  # draw_background_box
  #--------------------------------------------------------------------------
  def draw_background_box(dx, dy, dw)
    colour = Color.new(0, 0, 0, translucent_alpha/2)
    rect = Rect.new(dx+1, dy+1, dw-2, line_height-2)
    contents.fill_rect(rect, colour)
  end
  #--------------------------------------------------------------------------
  # draw_horz_line
  #--------------------------------------------------------------------------
  def draw_horz_line(x, y, w)
    line_y = y + line_height / 2 - 1
    contents.fill_rect(x, line_y, w, 2, Color.new(127,127,127,48))
  end
  #--------------------------------------------------------------------------
  # draw_item_name_num
  #--------------------------------------------------------------------------
  def draw_item_name_num(item, x, y, enabled = true, num = 0, width = 172, align = 0)
    return unless item
    draw_icon(item.icon_index, x, y, enabled)
    change_color(normal_color, enabled)
    draw_text(x + 24, y, width, line_height, item.name + (num > 1 ? " (×" + num.to_s + ")" : ""), align)
  end
  #--------------------------------------------------------------------------
  # draw_stat_gauge
  #--------------------------------------------------------------------------
  def draw_stat_gauge(x, y, width, label1, label2, rate, colors, size = 12)
    draw_gauge_ex(x, y + 6, width, size, rate, colors[0], colors[1])
    contents.font.size =
      (size != 12 ? (size < 12 ? MSCR::SYS::FONT_DSIZE - (12 - size) : MSCR::SYS::FONT_DSIZE + (size - 12)) : MSCR::SYS::FONT_DSIZE)
    change_color(system_color)
    draw_text(x, y, text_size(label1).width, line_height, label1)
    change_color(normal_color)
    draw_text(x + [text_size(label1).width, width - text_size(label2).width].max, y, text_size(label2).width, line_height, label2, 2)
  end
  #--------------------------------------------------------------------------
  # draw_level
  #--------------------------------------------------------------------------
  def draw_level(x, y, actor, size = MSCR::SYS::FONT_DSIZE)
    contents.font.size = size
    change_color(system_color)
    draw_text(x, y, 80, line_height, "#{Vocab::level}:")
    change_color(normal_color)
    draw_text(x, y, 80, line_height, actor.level, 2)
  end
  #--------------------------------------------------------------------------
  # draw_level_progress
  #--------------------------------------------------------------------------
  def draw_level_progress(x, y, width, actor)
    now_exp = (actor.exp - actor.current_level_exp)
    next_exp = (actor.next_level_exp - actor.current_level_exp)
    perc_next_exp = (now_exp * 1.0 / next_exp)
    draw_stat_gauge(x,y,width,sprintf($data_dialogue[MSCR::WINDOWS::NEXT_LV], Vocab::level),
                    "#{sprintf('%.0f',(perc_next_exp*100))}%",perc_next_exp,MSCR::SYS::LV_GAUGE_COLOR,10)
  end

end #Window_Base

#███╗   ███╗███████╗███╗   ██╗██╗   ██╗     ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗
#████╗ ████║██╔════╝████╗  ██║██║   ██║    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗
#██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║
#██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║
#██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝
#╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝
class Window_MenuCommand < Window_Command

  #--------------------------------------------------------------------------
  # * Includes RingMenu module
  #--------------------------------------------------------------------------
  include RingMenu
  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize
    super(0, 0)
    if @@last_command_symbol != nil
      index = @list.index(@@last_command_symbol)
      @mode = :wait
    end
    select_last
    refresh
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    super
    rect = Rect.new(0, 160, self.contents.width, line_height * 3)
    contents.font.size = 35
    draw_text(rect, command_name(index), 1)
  end
  #--------------------------------------------------------------------------
  # * Get Window Width
  #--------------------------------------------------------------------------
  def window_width
    return Graphics.width
  end
  #--------------------------------------------------------------------------
  # * Get Window Height
  #--------------------------------------------------------------------------
  def window_height
    return Graphics.height
  end
  def list
    @list
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #     x     : draw spot x-coordinate
  #     y     : draw spot y-coordinate
  #     i     : item number
  #--------------------------------------------------------------------------
  def draw_item(x, y, i)
    icon_index = $game_system.menu_list[@list[i][:symbol]][2]
    bitmap = Cache.system("Iconset")
    rect = Rect.new(icon_index % 16 * 24, icon_index / 16 * 24, 24, 24)
    target1 = Rect.new(x - 28, y - 28, 56, 56)
    target2 = Rect.new(x - 20, y - 20, 40, 40)
    if i == index
      contents.stretch_blt(target1, bitmap, rect)
    else
      contents.stretch_blt(target2, bitmap, rect, 64)
    end
  end
  #--------------------------------------------------------------------------
  # * menu_enabled?
  #   Checks if the menu item is enabled
  #--------------------------------------------------------------------------
  def menu_enabled?(index)
    return $game_system.menu_list.values[index][3]
  end
  #--------------------------------------------------------------------------
  # * make_command_list
  #   Adds the commands
  #--------------------------------------------------------------------------
  def make_command_list
    $game_system.menu_list.each {|key, value|
      next if !value[3]
      add_command(value[0], key, value[3])
    }
  end

end #Window_MenuCommand

#███╗   ███╗███████╗███╗   ██╗██╗   ██╗     ██████╗  ██████╗ ██╗     ██████╗
#████╗ ████║██╔════╝████╗  ██║██║   ██║    ██╔════╝ ██╔═══██╗██║     ██╔══██╗
#██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║    ██║  ███╗██║   ██║██║     ██║  ██║
#██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║    ██║   ██║██║   ██║██║     ██║  ██║
#██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝    ╚██████╔╝╚██████╔╝███████╗██████╔╝
#╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝      ╚═════╝  ╚═════╝ ╚══════╝╚═════╝
class Window_Gold < Window_Base

  #--------------------------------------------------------------------------
  # * initialize
  #   Initializes the window
  #--------------------------------------------------------------------------
  def initialize
    super((Graphics.width - window_width), (0 - fitting_height(1)), window_width, fitting_height(1))
    refresh
  end

  def opening_animation
    @new_y = 0
  end

  def closing_animation
    @new_y = 0 - fitting_height(1)
  end
  #--------------------------------------------------------------------------
  # * refresh
  #--------------------------------------------------------------------------
  alias mscr_menumain_windowgold_refresh refresh
  def refresh
    mscr_menumain_windowgold_refresh
    draw_icon(MSCR::ICON::CURRENCY,0,0)
  end

end #Window_Gold

#███╗   ███╗███████╗███╗   ██╗██╗   ██╗    ██╗  ██╗███████╗██╗     ██████╗
#████╗ ████║██╔════╝████╗  ██║██║   ██║    ██║  ██║██╔════╝██║     ██╔══██╗
#██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║    ███████║█████╗  ██║     ██████╔╝
#██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║    ██╔══██║██╔══╝  ██║     ██╔═══╝
#██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝    ██║  ██║███████╗███████╗██║
#╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝
class Window_Menu_Help < Window_Help

  attr_accessor :index

  #--------------------------------------------------------------------------
  # * alias: initialize
  #   Initializes the window
  #--------------------------------------------------------------------------
  alias mscr_pmenu_window_menu_help_initialize initialize
  def initialize(*args, &block)
    mscr_pmenu_window_menu_help_initialize(*args, &block)
    @index = 0
  end

  def opening_animation
    @new_y = Graphics.height - height
  end

  def closing_animation
    @new_y = Graphics.height
  end
  #--------------------------------------------------------------------------
  # * set_text
  #   Sets new help text
  #--------------------------------------------------------------------------
  def set_text(text, enabled)
    if text != @text
      @text = text
      refresh
    end
  end
  #--------------------------------------------------------------------------
  # * refresh
  #   Refreshes help contents
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    draw_help_text
  end
  #--------------------------------------------------------------------------
  # * draw_help_text
  #   Draws the help text
  #--------------------------------------------------------------------------
  def draw_help_text
    draw_text_ex_no_reset(0, 0, @text)
    reset_font_settings
  end

end #Window_Menu_Help

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ████╗ ████║██╔════╝████╗  ██║██║   ██║
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
#███████║╚██████╗███████╗██║ ╚████║███████╗    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝
class Scene_Menu < Scene_MenuBase

  #--------------------------------------------------------------------------
  # * start
  #   Starts the scene
  #--------------------------------------------------------------------------
  def start
    super
    return command_map if $game_system.menu_list.empty?
    create_menu_command_window
    create_menu_gold_window
    create_menu_help_window
    create_menu_mapname_window
    help_update(@command_window.index)
  end
  #--------------------------------------------------------------------------
  # * create_menu_command_window
  #   Creates the command window
  #--------------------------------------------------------------------------
  def create_menu_command_window
    @command_window = Window_MenuCommand.new
    $game_system.menu_list.each {|key, value|
      @command_window.set_handler(key, method("command_#{key}".to_sym))
    }
    @command_window.set_handler(:cancel, method(:return_scene))
  end
  #--------------------------------------------------------------------------
  # * create_menu_help_window
  #   Creates the help window
  #--------------------------------------------------------------------------
  def create_menu_help_window
    @help_window = Window_Menu_Help.new(2)
    @help_window.active = false
    @help_window.viewport = @viewport
    @help_window.index = @command_window.index
    @help_window.y = Graphics.height
  end
  #--------------------------------------------------------------------------
  # * create_menu_gold_window
  #--------------------------------------------------------------------------
  def create_menu_gold_window
    @gold_window = Window_Gold.new
  end
  #--------------------------------------------------------------------------
  # * create_menu_mapname_window
  #--------------------------------------------------------------------------
  def create_menu_mapname_window
    @mapname_window = Window_MapName.new
  end
  #--------------------------------------------------------------------------
  # * update
  #   Updates the scene
  #--------------------------------------------------------------------------
  alias mscr_pmenu_scene_menu_update update
  def update(*args, &block)
    mscr_pmenu_scene_menu_update(*args, &block)
    old_index = @help_window.index
    help_update(@command_window.index) if old_index != @command_window.index
  end
  #--------------------------------------------------------------------------
  # * help_update
  #   Updates the help window text if index has changed
  #--------------------------------------------------------------------------
  def help_update(index)
    item = $game_system.menu_list[@command_window.list[index][:symbol]]
    text = "\\i[#{item[2]}] ~ #{item[0]}\n#{item[1]}"
    @help_window.index = index
    @help_window.set_text(text, item[3])
  end
  #--------------------------------------------------------------------------
  # * [Equip] Command
  #--------------------------------------------------------------------------
  def command_equip
    SceneManager.call(Scene_Equip)
  end
  #--------------------------------------------------------------------------
  # * [Skill] Command
  #--------------------------------------------------------------------------
  def command_skill
    SceneManager.call(Scene_Skill)
  end

  #--------------------------------------------------------------------------
  # * [Status] Command
  #--------------------------------------------------------------------------
  def command_status
    SceneManager.call(Scene_Status)
  end
  #--------------------------------------------------------------------------
  # * [Formation] Command
  #--------------------------------------------------------------------------
  def command_formation
    SceneManager.call(Scene_Formation)
  end
  #--------------------------------------------------------------------------
  # * [Load] Command
  #--------------------------------------------------------------------------
  def command_load
    SceneManager.call(Scene_Load)
  end
  #--------------------------------------------------------------------------
  # * [Teleport] Command
  #--------------------------------------------------------------------------
  def command_teleport
  end
  #--------------------------------------------------------------------------
  # * [World Map] Command
  #--------------------------------------------------------------------------
  def command_worldmap
  end
  #--------------------------------------------------------------------------
  # * [System] Command
  #--------------------------------------------------------------------------
  def command_system
    SceneManager.call(Scene_System)
  end
  #--------------------------------------------------------------------------
  # * command_map
  #   Displays an error message if menu is empty
  #--------------------------------------------------------------------------
  def command_map
    if $game_system.get_menu.empty?
      Sound.play_buzzer
      $game_message.texts << $data_dialogue[MSCR::WINDOWS::MENUEMPTY]
    end
    SceneManager.call(Scene_Map)
  end

end #Scene_Menu
