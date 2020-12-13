#===============================================================================
# Menu__ActorRibbonModule
# Edited    May 25 2020
#===============================================================================
# █████╗  ██████╗████████╗ ██████╗ ██████╗     ██████╗ ██╗██████╗ ██████╗  ██████╗ ███╗   ██╗
#██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗    ██╔══██╗██║██╔══██╗██╔══██╗██╔═══██╗████╗  ██║
#███████║██║        ██║   ██║   ██║██████╔╝    ██████╔╝██║██████╔╝██████╔╝██║   ██║██╔██╗ ██║
#██╔══██║██║        ██║   ██║   ██║██╔══██╗    ██╔══██╗██║██╔══██╗██╔══██╗██║   ██║██║╚██╗██║
#██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║    ██║  ██║██║██████╔╝██████╔╝╚██████╔╝██║ ╚████║
#╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝
module ActorRibbon

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize(pos = :top)
    @pos = pos
    @members = $game_party.all_members.size
    @dx = 0; @dy = 0; @dw = 0; @dh = 0
    get_coords
    super(@dx, @dy, @dw, @dh)
    select(0)
    activate
    refresh
  end
  def opening_animation
    case @pos
    when :top
      @new_y = 0
    when :right
      @new_x = Graphics.width - @dw
    when :left
      @new_x = 0
    when :middle
      @new_y = (Graphics.height / 2) - (@dh / 2)
    end
  end
  def closing_animation
    case @pos
    when :top
      @new_y = -fitting_height(4)
    when :right
      @new_x = Graphics.width
    when :left
      @new_x = -120
    when :middle
      @new_y = Graphics.height - fitting_height(7)#4)
      @new_opacity = 0
    end
  end
  #--------------------------------------------------------------------------
  # * get_coords
  #--------------------------------------------------------------------------
  def get_coords
    case @pos
    when :top
      @dw = (96 * @members) + 24
      @dh = fitting_height(4)
      @dx = (Graphics.width / 2) - (@dw / 2)
      @dy = -@dh
    when :right
      @dw = 120
      @dh = (96 * @members) + 24
      @dx = Graphics.width
      @dy = (Graphics.height / 2) - (@dh / 2)
    when :left
      @dw = 120
      @dh = (96 * @members) + 24
      @dx = -120
      @dy = (Graphics.height / 2) - (@dh / 2)
    when :middle
      @dw = (96 * @members) + 24
      @dh = fitting_height(4)
      @dx = (Graphics.width / 2) - (50 * @members)
      @dy = Graphics.height - fitting_height(7)#4)
    end
  end
  #--------------------------------------------------------------------------
  # * col_max
  #--------------------------------------------------------------------------
  def col_max; return (@pos == :right || @pos == :left) ? 1 : @members; end
  #--------------------------------------------------------------------------
  # * item_max
  #--------------------------------------------------------------------------
  def item_max; return @members; end
  #--------------------------------------------------------------------------
  # * item_rect
  #--------------------------------------------------------------------------
  def item_rect(index)
    rect = Rect.new
    rect.width = (@pos == :top || @pos == :bot || @pos == :middle) ? (contents.width / item_max) : contents.width
    rect.height = (@pos == :top || @pos == :bot || @pos == :middle) ? contents.height : (contents.height / item_max)
    rect.x = (@pos == :top || @pos == :bot || @pos == :middle) ? (index * rect.width) : 0
    rect.y = (@pos == :top || @pos == :bot || @pos == :middle) ? 0 : (index * rect.height)
    return rect
  end
  #--------------------------------------------------------------------------
  # * refresh
  #--------------------------------------------------------------------------
  def refresh
    make_item_list
    create_contents
    draw_all_items
  end
  #--------------------------------------------------------------------------
  # * make_item_list
  #--------------------------------------------------------------------------
  def make_item_list
    @data = $game_party.all_members
  end
  #--------------------------------------------------------------------------
  # * draw_item
  #--------------------------------------------------------------------------
  def draw_item(index)
    actor = @data[index]
    rect = item_rect(index)
    draw_actor_face(rect.x, rect.y, actor)
  end
  #--------------------------------------------------------------------------
  # draw_actor
  #--------------------------------------------------------------------------
  def draw_actor_face(x, y, actor)
    bitmap = Cache.character(actor.character_name)
    n = actor.character_index
    cw = bitmap.width / 12
    ch = bitmap.height / 8
    cx = (n%4*3+1)*cw
    cy = (n/4*4)*ch
    src_rect = Rect.new(cx, cy, cw, ch)
    dest_rect = Rect.new(x+13, y-13, cw*1.5, ch*1.5)
    contents.stretch_blt(dest_rect, bitmap, src_rect)
  end

end
