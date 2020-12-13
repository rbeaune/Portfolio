#===============================================================================
# Menu_Formation
# Edited    May 14 2019
#===============================================================================
#███████╗ ██████╗ ██████╗ ███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗     ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗
#██╔════╝██╔═══██╗██╔══██╗████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗
#█████╗  ██║   ██║██████╔╝██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║
#██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║
#██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝
#╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝
class Window_FormationCommand < Window_Selectable

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :pending_index            # Pending position (for formation)

  #--------------------------------------------------------------------------
  # * Includes ActorRibbon module
  #--------------------------------------------------------------------------
  include ActorRibbon

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(:middle)
    @pending_index = -1
  end

  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  alias mscr_windowformationcommand_drawitem draw_item
  def draw_item(index)
    draw_item_background(index)
    mscr_windowformationcommand_drawitem(index)
  end

  #--------------------------------------------------------------------------
  # * Draw Background for Item
  #--------------------------------------------------------------------------
  def draw_item_background(index)
    if index == @pending_index
      contents.fill_rect(item_rect(index), pending_color)
    end
  end

  #--------------------------------------------------------------------------
  # * Set Pending Position (for Formation)
  #--------------------------------------------------------------------------
  def pending_index=(index)
    last_pending_index = @pending_index
    @pending_index = index
    redraw_item(@pending_index)
    redraw_item(last_pending_index)
  end

end #Window_FormationCommand

#███████╗ ██████╗ ██████╗ ███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗     ██████╗██╗  ██╗ █████╗ ██████╗ ███████╗
#██╔════╝██╔═══██╗██╔══██╗████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔════╝
#█████╗  ██║   ██║██████╔╝██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║    ██║     ███████║███████║██████╔╝███████╗
#██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║    ██║     ██╔══██║██╔══██║██╔══██╗╚════██║
#██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║    ╚██████╗██║  ██║██║  ██║██║  ██║███████║
#╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
class Window_FormationChars < Window_Base

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :pending_index            # Pending position (for formation)

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    dx = (Graphics.width / 2) - (50 * $game_party.all_members.size)
    dh = fitting_height(4)
    dy = (Graphics.height / 2) - dh * 1.5
    dw = (96 * $game_party.all_members.size) + 24
    super(dx, dy, dw, dh)
    self.opacity = 0
    @pending_index = -1
    refresh
  end

  #--------------------------------------------------------------------------
  # refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    draw_characters
  end

  #--------------------------------------------------------------------------
  # draw_characters
  #--------------------------------------------------------------------------
  def draw_characters
    bitmap = Cache.character($game_party.all_members[0].character_name)
    for i in 0...$game_party.all_members.size
      actor = $game_party.all_members[i]
      rect = Rect.new((actor.character_index % 4 * 96) + 32, actor.character_index / 4 * 128, 32, 32)
      dest_rect = Rect.new((96 * i), 0, 96, 96)
      contents.stretch_blt(dest_rect, bitmap, rect)
    end
    bitmap.dispose
  end

  #--------------------------------------------------------------------------
  # index=
  #--------------------------------------------------------------------------
  def index=(index)
    @index = index
    refresh
  end

end #Window_FormationChars

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ███████╗ ██████╗ ██████╗ ███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██╔════╝██╔═══██╗██╔══██╗████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      █████╗  ██║   ██║██████╔╝██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
#███████║╚██████╗███████╗██║ ╚████║███████╗    ██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
class Scene_Formation < Scene_MenuBase

  #--------------------------------------------------------------------------
  # * start
  #--------------------------------------------------------------------------
  def start
    super
    create_command_window
    create_chars_window
  end

  #--------------------------------------------------------------------------
  # * create_command_window
  #--------------------------------------------------------------------------
  def create_command_window
    @command_window = Window_FormationCommand.new
    @command_window.set_handler(:ok,     method(:on_formation_ok))
    @command_window.set_handler(:cancel, method(:on_formation_cancel))
  end

  #--------------------------------------------------------------------------
  # * create_chars_window
  #--------------------------------------------------------------------------
  def create_chars_window
    @chars_window = Window_FormationChars.new
  end

  #--------------------------------------------------------------------------
  # * Formation [OK]
  #--------------------------------------------------------------------------
  def on_formation_ok
    if @command_window.pending_index >= 0
      $game_party.swap_order(@command_window.index,
                             @command_window.pending_index)
      @command_window.pending_index = -1
      @command_window.refresh
    else
      @command_window.pending_index = @command_window.index
    end
    @command_window.activate
    @chars_window.refresh
  end

  #--------------------------------------------------------------------------
  # * Formation [Cancel]
  #--------------------------------------------------------------------------
  def on_formation_cancel
    if @command_window.pending_index >= 0
      @command_window.pending_index = -1
      @command_window.activate
    else
      return_scene
    end
  end

end #Scene_Formation
