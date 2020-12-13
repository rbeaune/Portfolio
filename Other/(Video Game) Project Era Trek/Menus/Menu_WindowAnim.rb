#===============================================================================
# Menu_WindowAnim
# Edited    August 22 2019
#===============================================================================
#██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗    ██████╗  █████╗ ███████╗███████╗
#██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║    ██╔══██╗██╔══██╗██╔════╝██╔════╝
#██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    ██████╔╝███████║███████╗█████╗
#██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║    ██╔══██╗██╔══██║╚════██║██╔══╝
#╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝    ██████╔╝██║  ██║███████║███████╗
# ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝     ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
class Window_Base < Window

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  alias mscr_windowanim_windowbase_initialize initialize
  def initialize(x, y, width, height)
    mscr_windowanim_windowbase_initialize(x, y, width, height)
    @new_x = nil
    @new_y = nil
    @new_width = nil
    @new_height = nil
    @new_opacity = nil
    @slide_speed = MSCR::WINDOWS::SLIDESPEED
    @fade_speed = MSCR::WINDOWS::FADESPEED
    @animating = false
    opening_animation
  end
  def opening_animation
  end
  def closing_animation
  end
  #--------------------------------------------------------------------------
  # * update
  #--------------------------------------------------------------------------
  alias mscr_windowanim_windowbase_update update
  def update
    mscr_windowanim_windowbase_update
    update_position
  end
  #--------------------------------------------------------------------------
  # * animating?
  #--------------------------------------------------------------------------
  def animating?
    @animating
  end
  #--------------------------------------------------------------------------
  # * move_window
  #--------------------------------------------------------------------------
  def move_window(x=self.x, y=self.y, width=self.width, height=self.height)
    @new_x = x
    @new_y = y
    @new_width = width
    @new_height = height
  end
  #--------------------------------------------------------------------------
  # * resize_window
  #--------------------------------------------------------------------------
  def resize_window(width=self.width, height=self.height)
    @new_width = width
    @new_height = height
  end
  #--------------------------------------------------------------------------
  # * shift_window
  #--------------------------------------------------------------------------
  def shift_window(x, y)
    @new_x = self.x + x
    @new_y = self.y + y
  end
  #--------------------------------------------------------------------------
  # * resize_width
  #--------------------------------------------------------------------------
  def resize_width(width)
    @new_width = width
  end
  #--------------------------------------------------------------------------
  # * resize_height
  #--------------------------------------------------------------------------
  def resize_height(height)
    @new_height = height
  end
  #--------------------------------------------------------------------------
  # * update_x
  #--------------------------------------------------------------------------
  def update_x
    if (self.x - @new_x).abs <= @slide_speed
      self.x = @new_x
      @animating = false
    else
      self.x = self.x > @new_x ? self.x - @slide_speed : self.x + @slide_speed
      @animating = true
    end
  end
  #--------------------------------------------------------------------------
  # * update_y
  #--------------------------------------------------------------------------
  def update_y
    if (self.y - @new_y).abs <= @slide_speed
      self.y = @new_y
      @animating = false
    else
      self.y = self.y > @new_y ? self.y - @slide_speed : self.y + @slide_speed
      @animating = true
    end
  end
  #--------------------------------------------------------------------------
  # * update_height
  #--------------------------------------------------------------------------
  def update_height
    if (self.height - @new_height).abs <= @slide_speed
      self.height = @new_height
      @animating = false
    else
      self.height = self.height > @new_height ? self.height - @slide_speed : self.height + @slide_speed
      @animating = true
    end
  end
  #--------------------------------------------------------------------------
  # * update_width
  #--------------------------------------------------------------------------
  def update_width
    if (self.width - @new_width).abs <= @slide_speed
      self.width = @new_width
      @animating = false
    else
      self.width = self.width > @new_width ? self.width - @slide_speed : self.width + @slide_speed
      @animating = true
    end
  end
  #--------------------------------------------------------------------------
  # * update_opacity
  #--------------------------------------------------------------------------
  def update_opacity
    if (self.opacity - @new_opacity).abs <= @fade_speed
      self.opacity = @new_opacity
      self.back_opacity = self.opacity
      self.contents_opacity = self.opacity > 0 ? 255 : 0
      @animating = false
    else
      self.opacity = self.opacity > @new_opacity ? self.opacity - @fade_speed : self.opacity + @fade_speed
      self.back_opacity = self.opacity
      self.contents_opacity = self.opacity
      @animating = true
    end
  end
  #--------------------------------------------------------------------------
  # * update_position
  #--------------------------------------------------------------------------
  def update_position
    @animating = false
    update_x if @new_x && self.x != @new_x
    update_y if @new_y && self.y != @new_y
    update_width if @new_width && self.width != @new_width
    update_height if @new_height && self.height != @new_height
    update_opacity if @new_opacity
  end

end #Window_Base

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ██████╗  █████╗ ███████╗███████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██╔══██╗██╔══██╗██╔════╝██╔════╝
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ██████╔╝███████║███████╗█████╗
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██╔══██╗██╔══██║╚════██║██╔══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ██████╔╝██║  ██║███████║███████╗
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
class Scene_Base

  #--------------------------------------------------------------------------
  # * pre_terminate
  #--------------------------------------------------------------------------
  alias mscr_windowanim_scenebase_preterminate pre_terminate
  def pre_terminate
    mscr_windowanim_scenebase_preterminate
    update_closing_animations
  end
  #--------------------------------------------------------------------------
  # * update_closing_animations
  #--------------------------------------------------------------------------
  def update_closing_animations
    windows = []
    instance_variables.each do |varname|
      ivar = instance_variable_get(varname)
      if ivar.is_a?(Window)
        ivar.closing_animation
        windows.push(ivar)
      end
    end
    animating = true
    while animating
      animating = false
      Graphics.update
      Input.update
      windows.each {|window|
        window.update
        animating = true if window.animating?
      }
    end
  end

end #Scene_Base
