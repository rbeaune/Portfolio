#==============================================================================
# Menu_Cursor
# Edited    August 12 2019
#==============================================================================
# ██████╗  █████╗ ███╗   ███╗███████╗    ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
#██║  ███╗███████║██╔████╔██║█████╗      ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
class Game_System

  attr_accessor :menu_cursor_name

  #--------------------------------------------------------------------------
  # * Initialize
  #--------------------------------------------------------------------------
  alias mscr_menucursor_gamesystem_initialize initialize
  def initialize
    mscr_menucursor_gamesystem_initialize
    @menu_cursor_name = "MenuCursor"
  end

end #Game_System

# ██████╗  █████╗ ███╗   ███╗███████╗    ████████╗███████╗███╗   ███╗██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ╚══██╔══╝██╔════╝████╗ ████║██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗         ██║   █████╗  ██╔████╔██║██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝         ██║   ██╔══╝  ██║╚██╔╝██║██╔═══╝
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗       ██║   ███████╗██║ ╚═╝ ██║██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝       ╚═╝   ╚══════╝╚═╝     ╚═╝╚═╝
class Game_Temp

  attr_accessor :menu_cursor

  #--------------------------------------------------------------------------
  # * Initialize
  #--------------------------------------------------------------------------
  alias mscr_menucursor_gametemp_initialize initialize
  def initialize
    mscr_menucursor_gametemp_initialize
    @menu_cursor = [false,0,0,0]
  end

end #Game_Temp

#███████╗██████╗ ██████╗ ██╗████████╗███████╗     ██████╗██╗   ██╗██████╗ ███████╗ ██████╗ ██████╗
#██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝    ██╔════╝██║   ██║██╔══██╗██╔════╝██╔═══██╗██╔══██╗
#███████╗██████╔╝██████╔╝██║   ██║   █████╗      ██║     ██║   ██║██████╔╝███████╗██║   ██║██████╔╝
#╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝      ██║     ██║   ██║██╔══██╗╚════██║██║   ██║██╔══██╗
#███████║██║     ██║  ██║██║   ██║   ███████╗    ╚██████╗╚██████╔╝██║  ██║███████║╚██████╔╝██║  ██║
#╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
class Sprite_Cursor < Sprite

  #--------------------------------------------------------------------------
  # * Initialize
  #--------------------------------------------------------------------------
  def initialize(viewport = nil , x , y)
    super(viewport)
    @cursor_image = Cache.system($game_system.menu_cursor_name.to_s)
    @frame_max = (@cursor_image.width / @cursor_image.height) rescue 1
    @frame_range = @frame_max > 0 ? (@cursor_image.width  / @frame_max) : 1
    @frame = 0
    @ca_speed = MSCR::WINDOWS::CURSORSPD
    self.bitmap = Bitmap.new(@frame_range,@frame_range)
    self.z = 10000
    self.opacity = 0
    @cw = self.bitmap.width / 2
    @c_p = [-@cw + MSCR::WINDOWS::CURSORPOS[0], MSCR::WINDOWS::CURSORPOS[1]]
    @mx = [0,0,0]
    refresh_animation(true)
    update_move
  end
  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  def dispose
    self.bitmap.dispose
    self.bitmap = nil
    @cursor_image.dispose
    super
  end
  #--------------------------------------------------------------------------
  # * Update
  #--------------------------------------------------------------------------
  def update
    if cursor_visible?
      self.visible = true
      update_move
      refresh_animation(false)
    else
      self.visible = false
    end
  end
  #--------------------------------------------------------------------------
  # * refresh_animation
  #--------------------------------------------------------------------------
  def refresh_animation(start = false)
    @ca_speed += 1
    return if @frame_max == 1 and !start
    return if @ca_speed < MSCR::WINDOWS::CURSORSPD
    @ca_speed = 0
    self.bitmap.clear
    scr_rect = Rect.new(@frame_range * @frame,0,@frame_range,@frame_range)
    self.bitmap.blt(0,0,@cursor_image, scr_rect)
    @frame += 1
    @frame = 0 if @frame >= @frame_max
  end
  #--------------------------------------------------------------------------
  # * Cursor Visible?
  #--------------------------------------------------------------------------
  def cursor_visible?
    px = $game_temp.menu_cursor[2]
    py = $game_temp.menu_cursor[3]
    return false if $game_temp.menu_cursor[1] == 0
    return false if px < 0 or py < 0 or (px == 0 and py == 0)
    return true
  end
  #--------------------------------------------------------------------------
  # * Update Move
  #--------------------------------------------------------------------------
  def update_move
    self.opacity += 25
    @new_pos = [$game_temp.menu_cursor[2],$game_temp.menu_cursor[3]]
    execute_animation_s
    execute_move(0,self.x, @new_pos[0] + @mx[1] + @c_p[0])
    execute_move(1,self.y, @new_pos[1] + @c_p[1])
  end
  #--------------------------------------------------------------------------
  # * Execute Animation S
  #--------------------------------------------------------------------------
  def execute_animation_s
    @mx[2] += 1
    return if @mx[2] < 4
    @mx[2] = 0
    @mx[0] += 1
    case @mx[0]
    when 1..7;  @mx[1] += 1
    when 8..14; @mx[1] -= 1
    else
      @mx[0] = 0
      @mx[1] = 0
    end
  end
  #--------------------------------------------------------------------------
  # * Execute Move
  #--------------------------------------------------------------------------
  def execute_move(type,cp,np)
    sp = 5 + ((cp - np).abs / 5)
    if cp > np
      cp -= sp
      cp = np if cp < np
    elsif cp < np
      cp += sp
      cp = np if cp > np
    end
    self.x = cp if type == 0
    self.y = cp if type == 1
  end

end #Sprite_Cursor

#██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗    ██████╗  █████╗ ███████╗███████╗
#██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║    ██╔══██╗██╔══██╗██╔════╝██╔════╝
#██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    ██████╔╝███████║███████╗█████╗
#██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║    ██╔══██╗██╔══██║╚════██║██╔══╝
#╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝    ██████╔╝██║  ██║███████║███████╗
# ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝     ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
class Window_Base < Window

  #--------------------------------------------------------------------------
  # * Cursor Sprite Enable
  #--------------------------------------------------------------------------
  def cursor_sprite_enable
    return if self.index == nil rescue return
    create_cursor_sprite
    update_cursor_sprite
    update_cursor_position
    if !self.active
      $game_temp.menu_cursor[1] -= 1 if $game_temp.menu_cursor[1] > 0
    end
  end
  #--------------------------------------------------------------------------
  # * Create Cursor Sprite
  #--------------------------------------------------------------------------
  def create_cursor_sprite
    return if @cursor != nil
    return if $game_temp.menu_cursor[0]
    $game_temp.menu_cursor[0] = true
    reset_cursor_position
    @cursor = Sprite_Cursor.new(nil,x,y)
    @cursor_name = $game_system.menu_cursor_name
  end
  #--------------------------------------------------------------------------
  # * Dispose Cursor Sprite
  #--------------------------------------------------------------------------
  def dispose_cursor_sprite
    return if @cursor == nil
    $game_temp.menu_cursor[0] = false
    reset_cursor_position
    @cursor.dispose
    @cursor = nil
  end
  #--------------------------------------------------------------------------
  # * Reset Cursor Position
  #--------------------------------------------------------------------------
  def reset_cursor_position
    $game_temp.menu_cursor[1] = 0
    $game_temp.menu_cursor[2] = -32
    $game_temp.menu_cursor[3] = -32
  end
  #--------------------------------------------------------------------------
  # * Update Cursor
  #--------------------------------------------------------------------------
  def update_cursor_sprite
    return if @cursor == nil
    @cursor.update
    refresh_cursor_sprite if @cursor_name != $game_system.menu_cursor_name
  end
  #--------------------------------------------------------------------------
  # * Refresh Cursor Sprite
  #--------------------------------------------------------------------------
  def refresh_cursor_sprite
    @cursor_name = $game_system.menu_cursor_name
    dispose_cursor_sprite
    create_cursor_sprite
  end
  #--------------------------------------------------------------------------
  # * Update Cursor Position
  #--------------------------------------------------------------------------
  def update_cursor_position
    return if !can_update_cursor_position?
    x_v = [0,0]
    if SceneManager.scene_is?(Scene_Battle)
      if self.viewport != nil
        x_v = [-self.viewport.ox, self.viewport.rect.y]
      end
    end
    x_e = (self.cursor_rect.x + self.x) - self.ox
    $game_temp.menu_cursor[2] = x_e + x_v[0]
    y_e = (self.cursor_rect.y + self.y + self.cursor_rect.height / 2) - self.oy
    $game_temp.menu_cursor[3] = y_e + x_v[1]
    $game_temp.menu_cursor[1] = 13
  end
  #--------------------------------------------------------------------------
  # * Can Update Cursor
  #--------------------------------------------------------------------------
  def can_update_cursor_position?
    return false if !self.active
    return false if self.index < 0
    return false if !self.visible
    return true
  end
  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  alias mscr_menucursor_windowbase_dispose dispose
  def dispose
    mscr_menucursor_windowbase_dispose
    dispose_cursor_sprite
  end
  #--------------------------------------------------------------------------
  # * Update
  #--------------------------------------------------------------------------
  alias mscr_menucursor_windowbase_update update
  def update
    mscr_menucursor_windowbase_update
    cursor_sprite_enable
  end

end #Window_Base
