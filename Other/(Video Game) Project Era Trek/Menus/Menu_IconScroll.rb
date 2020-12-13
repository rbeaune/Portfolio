#===============================================================================
# Menu_IconScroll
# Edited    August 17 2019
#===============================================================================
#██╗ ██████╗ ██████╗ ███╗   ██╗    ███████╗ ██████╗██████╗  ██████╗ ██╗     ██╗
#██║██╔════╝██╔═══██╗████╗  ██║    ██╔════╝██╔════╝██╔══██╗██╔═══██╗██║     ██║
#██║██║     ██║   ██║██╔██╗ ██║    ███████╗██║     ██████╔╝██║   ██║██║     ██║
#██║██║     ██║   ██║██║╚██╗██║    ╚════██║██║     ██╔══██╗██║   ██║██║     ██║
#██║╚██████╗╚██████╔╝██║ ╚████║    ███████║╚██████╗██║  ██║╚██████╔╝███████╗███████╗
#╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
class Sprite_IconScroll < Sprite_Base

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, width, icons = [])
    super(nil)
    @last_paused_ox = 0
    @scroll_pause_time = MSCR::WINDOWS::ICONSCROLLPAUSE
    reset(x, y, width, icons)
  end
  #--------------------------------------------------------------------------
  # * update
  #--------------------------------------------------------------------------
  def update
    super
    if @scroll_pause_time >= 0
      update_pause
    else
      update_scroll
    end
  end
  #--------------------------------------------------------------------------
  # * update_pause
  #--------------------------------------------------------------------------
  def update_pause
    @scroll_pause_time -= 1
  end
  #--------------------------------------------------------------------------
  # * update_scroll
  #--------------------------------------------------------------------------
  def update_scroll
    if MSCR::WINDOWS::ICONSCROLLSPD == 0
      self.src_rect.x += self.src_rect.width
      @scroll_pause_time = MSCR::WINDOWS::ICONSCROLLPAUSE
      self.src_rect.x = 0 if self.src_rect.x >= bitmap.width
    elsif MSCR::WINDOWS::ICONSCROLLSPD <= 24
      self.src_rect.x += MSCR::WINDOWS::ICONSCROLLSPD
      if self.src_rect.x >= @last_paused_ox + 24
        self.src_rect.x = (@last_paused_ox + 24) % @restart_x
        @last_paused_ox = self.src_rect.x
        @scroll_pause_time = MSCR::WINDOWS::ICONSCROLLPAUSE
      end
    else
      self.src_rect.x += MSCR::WINDOWS::ICONSCROLLSPD
      @scroll_pause_time = MSCR::WINDOWS::ICONSCROLLPAUSE
      self.src_rect.x %= @restart_x
    end
  end
  #--------------------------------------------------------------------------
  # * dispose
  #--------------------------------------------------------------------------
  def dispose
    bitmap.dispose if bitmap
    super
  end
  #--------------------------------------------------------------------------
  # * reset
  #--------------------------------------------------------------------------
  def reset(x, y, width, icons = [])
    self.x = x
    self.y = y
    @restart_x = icons.size*24
    src_x = src_rect.x if src_rect
    w = MSCR::WINDOWS::ICONSCROLLSPD == 0 ? 0 : width
    bitmap.dispose if bitmap
    self.bitmap = Bitmap.new(@restart_x + w, 24)
    src_rect.set(src_x ? src_x % @restart_x : 0, 0, width, 24)
    draw_bitmap(icons)
  end
  #--------------------------------------------------------------------------
  # * draw_bitmap
  #--------------------------------------------------------------------------
  def draw_bitmap(icons)
    icons += icons[0, Graphics.width / 24] if MSCR::WINDOWS::ICONSCROLLSPD != 0
    icons.each_with_index { |n, i| draw_icon(n, i*24, 0) }
  end
  #--------------------------------------------------------------------------
  # * draw_icon
  #--------------------------------------------------------------------------
  def draw_icon(icon_index, x, y)
    iconset = Cache.system("Iconset")
    rect = Rect.new(icon_index % 16 * 24, icon_index / 16 * 24, 24, 24)
    bitmap.blt(x, y, iconset, rect, 255)
  end

end #Sprite_IconScroll

#██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗    ██████╗  █████╗ ███████╗███████╗
#██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║    ██╔══██╗██╔══██╗██╔════╝██╔════╝
#██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    ██████╔╝███████║███████╗█████╗
#██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║    ██╔══██╗██╔══██║╚════██║██╔══╝
#╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝    ██████╔╝██║  ██║███████║███████╗
# ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝     ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
class Window_Base

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  alias mscr_iconscroll_windowbase_initialize initialize
  def initialize(*args, &block)
    mscr_iconscroll_windowbase_initialize(*args, &block)
    @iconscroll_sprites = {}
  end
  #--------------------------------------------------------------------------
  # * draw_actor_icons
  #--------------------------------------------------------------------------
  alias mscr_iconscroll_windowbase_drawactoricons draw_actor_icons
  def draw_actor_icons(actor, x, y, width = 24, *args)
    icons = (actor.state_icons + actor.buff_icons)
    if @iconscroll_sprites
      @iconscroll_sprites.each_pair {|key, val|
      dispose_icon_scroll_sprites(key) if val.x == x && val.y == y }
    end
    if (width / 24) < icons.size && @iconscroll_sprites
      w = (width / 24) * 24
      if @iconscroll_sprites[actor.object_id]
        @iconscroll_sprites[actor.object_id].reset(x, y, w, icons)
      else
        dispose_icon_scroll_sprites(actor.object_id) if @iconscroll_sprites[actor.object_id]
        @iconscroll_sprites[actor.object_id] = Sprite_IconScroll.new(x, y, w, icons)
      end
    else
      dispose_icon_scroll_sprites(actor.object_id) if @iconscroll_sprites[actor.object_id]
      mscr_iconscroll_windowbase_drawactoricons(actor, x, y, width, *args)
    end
  end
  #--------------------------------------------------------------------------
  # * update
  #--------------------------------------------------------------------------
  alias mscr_iconscroll_windowbase_update update
  def update(*args, &block)
    update_icon_scroll_sprites if @iconscroll_sprites
    mscr_iconscroll_windowbase_update(*args, &block)
  end
  #--------------------------------------------------------------------------
  # * update_icon_scroll_sprites
  #--------------------------------------------------------------------------
  def update_icon_scroll_sprites
    return unless @iconscroll_sprites
    @iconscroll_sprites.values.each {|sprite|
      sprite.update
      sprite.visible = self.visible
      sprite.opacity = self.contents_opacity
    }
  end
  #--------------------------------------------------------------------------
  # * dispose
  #--------------------------------------------------------------------------
  alias mscr_iconscroll_windowbase_dispose dispose
  def dispose(*args, &block)
    dispose_icon_scroll_sprites(nil) if @iconscroll_sprites
    mscr_iconscroll_windowbase_dispose(*args, &block)
  end
  #--------------------------------------------------------------------------
  # * dispose_icon_scroll_sprites
  #--------------------------------------------------------------------------
  def dispose_icon_scroll_sprites(actor_id = nil)
    return unless @iconscroll_sprites
    if !actor_id
      @iconscroll_sprites.keys.each {|a_id| dispose_icon_scroll_sprites(a_id) }
    elsif @iconscroll_sprites[actor_id]
      @iconscroll_sprites[actor_id].dispose
      @iconscroll_sprites.delete(actor_id)
    end
  end

end #Window_Base
