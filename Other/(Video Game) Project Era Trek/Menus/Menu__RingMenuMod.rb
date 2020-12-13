#===============================================================================
# Menu__RingMenuModule
# Edited    April 6 2020
#===============================================================================
#██████╗ ██╗███╗   ██╗ ██████╗     ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
#██╔══██╗██║████╗  ██║██╔════╝     ████╗ ████║██╔════╝████╗  ██║██║   ██║
#██████╔╝██║██╔██╗ ██║██║  ███╗    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
#██╔══██╗██║██║╚██╗██║██║   ██║    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
#██║  ██║██║██║ ╚████║╚██████╔╝    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
#╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝
module RingMenu

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(*args)
    super(*args)
    @cx = contents.width / 2 - 8
    @cy = contents.height / 2 - 24
    self.opacity = 0
    @startup = MSCR::WINDOWS::STARTUP_FRAMES
    @mode = :start
    @steps = @startup
  end
  #--------------------------------------------------------------------------
  # * Update Cursor
  #--------------------------------------------------------------------------
  def update_cursor
  end
  #--------------------------------------------------------------------------
  # * Update Cursor Position
  #--------------------------------------------------------------------------
  def update_cursor_position
    $game_temp.menu_cursor[2] = @cx - 32
    $game_temp.menu_cursor[3] = @cy - MSCR::WINDOWS::RING_R
    $game_temp.menu_cursor[1] = 13
  end
  #--------------------------------------------------------------------------
  # * Determines if is moving
  #--------------------------------------------------------------------------
  def animation?
    return @mode != :wait
  end
  #--------------------------------------------------------------------------
  # * Move Cursor Down
  #--------------------------------------------------------------------------
  def cursor_down(wrap)
    cursor_right(wrap)
  end
  #--------------------------------------------------------------------------
  # * Move Cursor Up
  #--------------------------------------------------------------------------
  def cursor_up(wrap)
    cursor_left(wrap)
  end
  #--------------------------------------------------------------------------
  # * Move Cursor Right
  #--------------------------------------------------------------------------
  def cursor_right(wrap)
    unless animation?
      select((index + 1) % item_max)
      @mode = :mover
      @steps = MSCR::WINDOWS::MOVING_FRAMES
      Sound.play_cursor
    end
  end
  #--------------------------------------------------------------------------
  # * Move Cursor Left
  #--------------------------------------------------------------------------
  def cursor_left(wrap)
    unless animation?
      select((index - 1 + item_max) % item_max)
      @mode = :movel
      @steps = MSCR::WINDOWS::MOVING_FRAMES
      Sound.play_cursor
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    refresh if animation?
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    case @mode
    when :start
      refresh_start
    when :wait
      refresh_wait
    when :mover
      refresh_move(1)
    when :movel
      refresh_move(0)
    end
  end
  #--------------------------------------------------------------------------
  # * Refresh Start Period
  #--------------------------------------------------------------------------
  def refresh_start
    d1 = 2.0 * Math::PI / item_max
    d2 = 1.0 * Math::PI / @startup
    r = MSCR::WINDOWS::RING_R - 1.0 * MSCR::WINDOWS::RING_R * @steps / @startup
    for i in 0...item_max
      d = d1 * i + d2 * @steps
      x = @cx + ( r * Math.sin( d ) ).to_i
      y = @cy - ( r * Math.cos( d ) ).to_i
      draw_item(x, y, i)
    end
    @steps -= 1
    if @steps < 0
      @mode = :wait
    end
  end
  #--------------------------------------------------------------------------
  # * Refresh Wait Period
  #--------------------------------------------------------------------------
  def refresh_wait
    d = 2.0 * Math::PI / item_max
    for i in 0...item_max
      j = i - index
      x = @cx + ( MSCR::WINDOWS::RING_R * Math.sin( d * j) ).to_i
      y = @cy - ( MSCR::WINDOWS::RING_R * Math.cos( d * j) ).to_i
      draw_item(x, y, i)
    end
  end
  #--------------------------------------------------------------------------
  # * Refresh Movement Period
  #--------------------------------------------------------------------------
  def refresh_move( mode )
    d1 = 2.0 * Math::PI / item_max
    d2 = d1 / MSCR::WINDOWS::MOVING_FRAMES
    d2 *= -1 unless mode != 0
    for i in 0...item_max
      j = i - index
      d = d1 * j + d2 * @steps
      x = @cx + ( MSCR::WINDOWS::RING_R * Math.sin( d ) ).to_i
      y = @cy - ( MSCR::WINDOWS::RING_R * Math.cos( d ) ).to_i
      draw_item(x, y, i)
    end
    @steps -= 1
    if @steps < 0
      @mode = :wait
    end
  end
end
