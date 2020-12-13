#==============================================================================
# System_Lights
# Edited    June 17 2019
#==============================================================================
# ██████╗ █████╗  ██████╗██╗  ██╗███████╗
#██╔════╝██╔══██╗██╔════╝██║  ██║██╔════╝
#██║     ███████║██║     ███████║█████╗
#██║     ██╔══██║██║     ██╔══██║██╔══╝
#╚██████╗██║  ██║╚██████╗██║  ██║███████╗
# ╚═════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝
module Cache

  #--------------------------------------------------------------------------
  # * New method: lights
  #--------------------------------------------------------------------------
  def self.lights(filename)
    self.load_bitmap('Graphics/Lights/', filename)
  end

end #Cache

# ██████╗  █████╗ ███╗   ███╗███████╗    ███████╗ ██████╗██████╗ ███████╗███████╗███╗   ██╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔════╝██╔════╝██╔══██╗██╔════╝██╔════╝████╗  ██║
#██║  ███╗███████║██╔████╔██║█████╗      ███████╗██║     ██████╔╝█████╗  █████╗  ██╔██╗ ██║
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ╚════██║██║     ██╔══██╗██╔══╝  ██╔══╝  ██║╚██╗██║
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ███████║╚██████╗██║  ██║███████╗███████╗██║ ╚████║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝
class Game_Screen

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :lights
  attr_reader   :shade
  attr_accessor :remove_light
  #--------------------------------------------------------------------------
  # * Alias method: clear
  #--------------------------------------------------------------------------
  alias mscr_lights_gamescreen_clear clear
  def clear
    mscr_lights_gamescreen_clear
    clear_lights
  end
  #--------------------------------------------------------------------------
  # * New method: clear_lights
  #--------------------------------------------------------------------------
  def clear_lights
    @lights = {}
    @remove_light = []
    @shade = Game_ShadeEffect.new
  end
  #--------------------------------------------------------------------------
  # * New method: lights
  #--------------------------------------------------------------------------
  def lights
    @lights ||= {}
  end
  #--------------------------------------------------------------------------
  # * New method: remove_light
  #--------------------------------------------------------------------------
  def remove_light
    @remove_light ||= []
  end
  #--------------------------------------------------------------------------
  # * New method: shade
  #--------------------------------------------------------------------------
  def shade
    @shade ||= Game_ShadeEffect.new
  end

end #Game_Screen

# ██████╗  █████╗ ███╗   ███╗███████╗    ███╗   ███╗ █████╗ ██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ████╗ ████║██╔══██╗██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ██╔████╔██║███████║██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║╚██╔╝██║██╔══██║██╔═══╝
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║ ╚═╝ ██║██║  ██║██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝
class Game_Map

  #--------------------------------------------------------------------------
  # * Alias method: setup
  #--------------------------------------------------------------------------
  alias mscr_lights_gamemap_setup setup
  def setup(map_id)
    mscr_lights_gamemap_setup(map_id)
    setup_map_shade(note)
  end
  #--------------------------------------------------------------------------
  # * New method: note
  #--------------------------------------------------------------------------
  def note
    @map ? @map.note : ""
  end
  #--------------------------------------------------------------------------
  # * New method: event_list
  #--------------------------------------------------------------------------
  def event_list
    events.values
  end
  #--------------------------------------------------------------------------
  # * New method: actors
  #--------------------------------------------------------------------------
  def actors
    [$game_player] + $game_player.followers.visible_folloers
  end
  #--------------------------------------------------------------------------
  # * New method: setup_map_shade
  #--------------------------------------------------------------------------
  def setup_map_shade(text)
    if text =~ /<SHADE((?:[^<]|<[^\/])*)>/im
      info  = $1.dup
      shade = @screen.shade
      shade.show
      shade.opacity = info =~ /OP:(\d+)/i ? $1.to_i : 192
      shade.blend   = info =~ /BL:(\d+)/i ? $1.to_i : 2
      red   = info =~ /R:(\d+)/i ? $1.to_i : 0
      green = info =~ /G:(\d+)/i ? $1.to_i : 0
      blue  = info =~ /B:(\d+)/i ? $1.to_i : 0
      shade.set_color(red, green, blue)
    end
    setup_player_light
  end
  #--------------------------------------------------------------------------
  # * New method: set_light
  #--------------------------------------------------------------------------
  def setup_player_light
    @screen.lights[0] = set_light("PL", "light1", {:actor => 0}, 255)
  end
  #--------------------------------------------------------------------------
  # * New method: set_light
  #--------------------------------------------------------------------------
  def set_light(id, name, info, op = 0, x = 0, y = 0, v = 0, s = 0, z = 100)
    light = Game_LightEffect.new
    light.id       = id
    light.name     = name
    light.info     = info
    light.opacity  = op.to_i
    light.x        = x.to_i
    light.y        = y.to_i
    light.variance = v.to_i
    light.speed    = s.to_i
    light.zoom     = z.to_f
    light
  end

end #Game_Map

# ██████╗  █████╗ ███╗   ███╗███████╗    ███████╗██╗   ██╗███████╗███╗   ██╗████████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝
#██║  ███╗███████║██╔████╔██║█████╗      █████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝
class Game_Event < Game_Character

  #--------------------------------------------------------------------------
  # * Alias method: clear_starting_flag
  #--------------------------------------------------------------------------
  alias mscr_lights_gameevent_clearstartingflag clear_starting_flag
  def clear_starting_flag
    mscr_lights_gameevent_clearstartingflag
    $game_map.screen.remove_light.push("EV#{@id}")
    refresh_lights if @page
  end
  #--------------------------------------------------------------------------
  # * New method: refresh_lights
  #--------------------------------------------------------------------------
  def refresh_lights
    case note
    when /<SMALL LIGHT>/i
      set_light("EV#{@id}", "light1", 255, 0, 0, 0, 0, 50)
    when /<NORMAL LIGHT>/i
      set_light("EV#{@id}", "light1", 255)
    when /<LARGE LIGHT>/i
      set_light("EV#{@id}", "light1", 255, 0, 0, 0, 0, 150)
    when /<XLARGE LIGHT>/i
      set_light("EV#{@id}", "light1", 255, 0, 0, 0, 0, 250)
    end
  end
  #--------------------------------------------------------------------------
  # * New method: set_light
  #--------------------------------------------------------------------------
  def set_light(id, name, op = 255, v = 0, s = 0, x = 0, y = 0, z = 100)
    value = [id, name, {:event => @id}, op, x, y, v, s, z].compact
    $game_map.screen.lights[id] = $game_map.set_light(*value)
    $game_map.screen.remove_light.delete(id)
  end

  #--------------------------------------------------------------------------
  # * New method: note
  #--------------------------------------------------------------------------
  def note
    return ""     if !@page || !@page.list || @page.list.size <= 0
    return @notes if @notes && @page.list == @note_page
    @note_page = @page.list.dup
    comment_list = []
    @page.list.each do |item|
      next unless item && (item.code == 108 || item.code == 408)
      comment_list.push(item.parameters[0])
    end
    @notes = comment_list.join("\r\n")
    @notes
  end

end #Game_Event

#███████╗██████╗ ██████╗ ██╗████████╗███████╗███████╗███████╗████████╗    ███╗   ███╗ █████╗ ██████╗
#██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝██╔════╝██╔════╝╚══██╔══╝    ████╗ ████║██╔══██╗██╔══██╗
#███████╗██████╔╝██████╔╝██║   ██║   █████╗  ███████╗█████╗     ██║       ██╔████╔██║███████║██████╔╝
#╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝  ╚════██║██╔══╝     ██║       ██║╚██╔╝██║██╔══██║██╔═══╝
#███████║██║     ██║  ██║██║   ██║   ███████╗███████║███████╗   ██║       ██║ ╚═╝ ██║██║  ██║██║
#╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝╚══════╝╚══════╝   ╚═╝       ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝
class Spriteset_Map

  #--------------------------------------------------------------------------
  # * Alias method: initialize
  #--------------------------------------------------------------------------
  alias mscr_lights_spritesetmap_initialize initialize
  def initialize
    mscr_lights_spritesetmap_initialize
    2.times { update_light(true) }
  end
  #--------------------------------------------------------------------------
  # * Alias method: update
  #--------------------------------------------------------------------------
  alias mscr_lights_spritesetmap_update update
  def update
    mscr_lights_spritesetmap_update
    update_light
  end
  #--------------------------------------------------------------------------
  # * Alias method: dispose
  #--------------------------------------------------------------------------
  alias mscr_lights_spritesetmap_dispose dispose
  def dispose
    mscr_lights_spritesetmap_dispose
    dispose_light unless SceneManager.scene_is?(Scene_Map)
  end
  #--------------------------------------------------------------------------
  # * New method: update_light
  #--------------------------------------------------------------------------
  def update_light(forced = false)
    return unless Graphics.frame_count % 2 == 0 || forced
    update_shade
    update_effects
  end
  #--------------------------------------------------------------------------
  # * New method: dispose_light
  #--------------------------------------------------------------------------
  def dispose_light
    if @light_effect
      @light_effect.dispose
      @light_effect = nil
      @screen_shade = nil
    end
  end
  #--------------------------------------------------------------------------
  # * New method: update_shade
  #--------------------------------------------------------------------------
  def update_shade
    if !@light_effect && $game_map.screen.shade.visible
      refresh_lights
    elsif $game_map.screen.shade.visible && @light_effect
      @light_effect.update
    elsif @light_effect && !$game_map.screen.shade.visible
      dispose_light
    end
  end
  #--------------------------------------------------------------------------
  # * New method: refresh_lights
  #--------------------------------------------------------------------------
  def refresh_lights
    @light_effect.dispose if @light_effect
    @screen_shade = $game_map.screen.shade
    @light_effect = Sprite_Light.new(@screen_shade, @viewport2)
    $game_map.event_list.each {|event| event.refresh_lights }
    @light_effect.update
  end
  #--------------------------------------------------------------------------
  # * New method: update_effects
  #--------------------------------------------------------------------------
  def update_effects
    return if !@light_effect || $game_map.screen.lights.empty?
    $game_map.screen.lights.keys.each {|key| create_light(key) }
    $game_map.screen.remove_light.clear
  end
  #--------------------------------------------------------------------------
  # * New method: create_light
  #--------------------------------------------------------------------------
  def create_light(key)
    effect = @light_effect.lights[key]
    return if remove_light(key)
    return if effect && effect.light == $game_map.screen.lights[key]
    @light_effect.create_light($game_map.screen.lights[key])
  end
  #--------------------------------------------------------------------------
  # * New method: remove_light
  #--------------------------------------------------------------------------
  def remove_light(key)
    return false if !$game_map.screen.remove_light.include?(key)
    @light_effect.remove_light(key)
    $game_map.screen.lights.delete(key)
    return true
  end

end #Spriteset_Map

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ███╗   ███╗ █████╗ ██████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ████╗ ████║██╔══██╗██╔══██╗
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ██╔████╔██║███████║██████╔╝
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██║╚██╔╝██║██╔══██║██╔═══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ██║ ╚═╝ ██║██║  ██║██║
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝
# class Scene_Map

#   #--------------------------------------------------------------------------
#   # * Alias method: pre_transfer
#   #--------------------------------------------------------------------------
#   alias mscr_lights_scenemap_pretransfer pre_transfer
#   def pre_transfer
#     mscr_lights_scenemap_pretransfer
#     if $game_player.new_map_id !=  $game_map.map_id
#       @spriteset.dispose_light
#       $game_map.screen.clear_lights
#     end
#   end

# end #Scene_Map

# ██████╗  █████╗ ███╗   ███╗███████╗    ███████╗██╗  ██╗ █████╗ ██████╗ ███████╗    ███████╗███████╗███████╗███████╗ ██████╗████████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔════╝    ██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝╚══██╔══╝
#██║  ███╗███████║██╔████╔██║█████╗      ███████╗███████║███████║██║  ██║█████╗      █████╗  █████╗  █████╗  █████╗  ██║        ██║
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ╚════██║██╔══██║██╔══██║██║  ██║██╔══╝      ██╔══╝  ██╔══╝  ██╔══╝  ██╔══╝  ██║        ██║
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ███████║██║  ██║██║  ██║██████╔╝███████╗    ███████╗██║     ██║     ███████╗╚██████╗   ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝    ╚══════╝╚═╝     ╚═╝     ╚══════╝ ╚═════╝   ╚═╝
class Game_ShadeEffect

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :visible
  attr_reader   :color
  attr_accessor :blend
  attr_accessor :opacity
  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize
    init_opacity
    init_color
  end
  #--------------------------------------------------------------------------
  # * init_opacity
  #--------------------------------------------------------------------------
  def init_opacity
    @visible = false
    @opacity = 0
    @opacity_target   = 0
    @opacity_duration = 0
  end
  #--------------------------------------------------------------------------
  # * init_color
  #--------------------------------------------------------------------------
  def init_color
    @blend = 0
    @color = Color.new(0, 0, 0, 0)
    @color_duration = 0
    @color_target   = Color.new(0, 0, 0, 0)
  end
  #--------------------------------------------------------------------------
  # * show
  #--------------------------------------------------------------------------
  def show
    @visible = true
  end
  #--------------------------------------------------------------------------
  # * hide
  #--------------------------------------------------------------------------
  def hide
    @visible = false
  end
  #--------------------------------------------------------------------------
  # * set_color
  #--------------------------------------------------------------------------
  def set_color(r = 0, g = 0, b = 0)
    @color        = get_colors(r, g, b)
    @color_target = @color.clone
  end
  #--------------------------------------------------------------------------
  # * change_opacity
  #--------------------------------------------------------------------------
  def change_opacity(op, d)
    @opacity_target   = op
    @opacity_duration = [d, 0].max
    @opacity = @opacity_target if @opacity_duration == 0
  end
  #--------------------------------------------------------------------------
  # * change_color
  #--------------------------------------------------------------------------
  def change_color(r, g, b, d)
    @color_target   = get_colors(r, g, b)
    @color_duration = [d, 0].max
    @color = @color_target.clone if @color_duration == 0
  end
  #--------------------------------------------------------------------------
  # * get_colors
  #--------------------------------------------------------------------------
  def get_colors(r, g, b)
    color = Color.new(255 - r, 255 - g, 255 - b, 255) if @blend == 2
    color = Color.new(r, g, b, 255) if @blend != 2
    color
  end
  #--------------------------------------------------------------------------
  # * update
  #--------------------------------------------------------------------------
  def update
    update_opacity
    update_color
  end
  #--------------------------------------------------------------------------
  # * update_opacity
  #--------------------------------------------------------------------------
  def update_opacity
    return if @opacity_duration == 0
    d = @opacity_duration
    @opacity = (@opacity * (d - 1) + @opacity_target) / d
    @opacity_duration -= 1
  end
  #--------------------------------------------------------------------------
  # * update_color
  #--------------------------------------------------------------------------
  def update_color
    return if @color_duration == 0
    d = @color_duration
    @color.red   = (@color.red   * (d - 1) + @color_target.red)   / d
    @color.green = (@color.green * (d - 1) + @color_target.green) / d
    @color.blue  = (@color.blue  * (d - 1) + @color_target.blue)  / d
    @color_duration -= 1
  end

end #Game_ShadeEffect

# ██████╗  █████╗ ███╗   ███╗███████╗    ██╗     ██╗ ██████╗ ██╗  ██╗████████╗    ███████╗███████╗███████╗███████╗ ██████╗████████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██║     ██║██╔════╝ ██║  ██║╚══██╔══╝    ██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝╚══██╔══╝
#██║  ███╗███████║██╔████╔██║█████╗      ██║     ██║██║  ███╗███████║   ██║       █████╗  █████╗  █████╗  █████╗  ██║        ██║
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║     ██║██║   ██║██╔══██║   ██║       ██╔══╝  ██╔══╝  ██╔══╝  ██╔══╝  ██║        ██║
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ███████╗██║╚██████╔╝██║  ██║   ██║       ███████╗██║     ██║     ███████╗╚██████╗   ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝       ╚══════╝╚═╝     ╚═╝     ╚══════╝ ╚═════╝   ╚═╝
class Game_LightEffect

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :id
  attr_accessor :name
  attr_accessor :info
  attr_accessor :opacity
  attr_accessor :x
  attr_accessor :y
  attr_accessor :variance
  attr_accessor :speed
  attr_accessor :zoom
  attr_accessor :opacity_target
  attr_accessor :opacity_duration
  #--------------------------------------------------------------------------
  # * change_opacity
  #--------------------------------------------------------------------------
  def change_opacity(op, d)
    @opacity_target   = op
    @opacity_duration = [d, 0].max
    @opacity = @opacity_target if @opacity_duration == 0
  end

end #Game_LightEffect

# ██████╗  █████╗ ███╗   ███╗███████╗    ██╗     ██╗ ██████╗ ██╗  ██╗████████╗    ██████╗ ██╗████████╗███╗   ███╗ █████╗ ██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██║     ██║██╔════╝ ██║  ██║╚══██╔══╝    ██╔══██╗██║╚══██╔══╝████╗ ████║██╔══██╗██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ██║     ██║██║  ███╗███████║   ██║       ██████╔╝██║   ██║   ██╔████╔██║███████║██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║     ██║██║   ██║██╔══██║   ██║       ██╔══██╗██║   ██║   ██║╚██╔╝██║██╔══██║██╔═══╝
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ███████╗██║╚██████╔╝██║  ██║   ██║       ██████╔╝██║   ██║   ██║ ╚═╝ ██║██║  ██║██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝       ╚═════╝ ╚═╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝
class Game_LightBitmap

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :light
  attr_reader   :bitmap
  attr_reader   :opacity
  attr_reader   :x
  attr_reader   :y
  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize(light)
    @light = light
    init_basic
    update
  end
  #--------------------------------------------------------------------------
  # * init_basic
  #--------------------------------------------------------------------------
  def init_basic
    @bitmap   = Cache.lights(@light.name)
    @target   = set_target
    @opacity  = @light.opacity
    @speed    = @light.speed
    @variance = 0.0
    @light.opacity_duration = 0
    @light.opacity_target   = 0
  end
  #--------------------------------------------------------------------------
  # * width
  #--------------------------------------------------------------------------
  def width
    @bitmap.width * @light.zoom / 100.0
  end
  #--------------------------------------------------------------------------
  # * height
  #--------------------------------------------------------------------------
  def height
    @bitmap.height * @light.zoom / 100.0
  end
  #--------------------------------------------------------------------------
  # * update
  #--------------------------------------------------------------------------
  def update
    update_position
    update_opacity
    update_variance
  end
  #--------------------------------------------------------------------------
  # * update_position
  #--------------------------------------------------------------------------
  def update_position
    @target.is_a?(Game_Character) ? character_position : map_position
  end
  #--------------------------------------------------------------------------
  # * character_position
  #--------------------------------------------------------------------------
  def character_position
    @x = $game_map.adjust_x(@target.real_x) * 32  - width / 2  + @light.x + 16
    @y = $game_map.adjust_y(@target.real_y) * 32  - height / 2 + @light.y + 16
  end
  #--------------------------------------------------------------------------
  # * map_position
  #--------------------------------------------------------------------------
  def map_position
    @x = $game_map.adjust_x(@target[:x]) * 32 - width / 2  + @light.x + 16
    @y = $game_map.adjust_y(@target[:y]) * 32 - height / 2 + @light.y + 16
  end
  #--------------------------------------------------------------------------
  # * change_opacity
  #--------------------------------------------------------------------------
  def change_opacity(op, d)
    @light.opacity_target   = op
    @light.opacity_duration = [d, 0].max
    @light.opacity = @light.opacity_target if @light.opacity_duration == 0
  end
  #--------------------------------------------------------------------------
  # * update_opacity
  #--------------------------------------------------------------------------
  def update_opacity
    return if @light.opacity_duration == 0
    d = @light.opacity_duration
    @light.opacity = (@light.opacity * (d - 1) + @light.opacity_target) / d
    @light.opacity_duration -= 1
  end
  #--------------------------------------------------------------------------
  # * update_variance
  #--------------------------------------------------------------------------
  def update_variance
    @variance += @speed
    @speed *= -1 if @variance.abs > @light.variance.abs
    @opacity = [[@light.opacity + @variance, 0].max, 255].min
  end
  #--------------------------------------------------------------------------
  # * dispose
  #--------------------------------------------------------------------------
  def dispose
    @bitmap.dispose
  end
  #--------------------------------------------------------------------------
  # * set_target
  #--------------------------------------------------------------------------
  def set_target
    if @light.info.keys.include?(:actor)
      target = $game_map.actors[@light.info[:actor]]
    elsif @light.info.keys.include?(:event)
      target = $game_map.events[@light.info[:event]]
    else
      target = @light.info
    end
    target
  end

end #Game_LightBitmap

#███████╗██████╗ ██████╗ ██╗████████╗███████╗    ██╗     ██╗ ██████╗ ██╗  ██╗████████╗
#██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝    ██║     ██║██╔════╝ ██║  ██║╚══██╔══╝
#███████╗██████╔╝██████╔╝██║   ██║   █████╗      ██║     ██║██║  ███╗███████║   ██║
#╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝      ██║     ██║██║   ██║██╔══██║   ██║
#███████║██║     ██║  ██║██║   ██║   ███████╗    ███████╗██║╚██████╔╝██║  ██║   ██║
#╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝    ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝
class Sprite_Light < Sprite_Base

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader :lights
  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize(shade, viewport)
    super(viewport)
    @shade = shade
    self.bitmap     = Bitmap.new(Graphics.width, Graphics.height)
    self.blend_type = @shade.blend
    self.opacity    = @shade.opacity
    self.z = 100
    @lights = {}
  end
  #--------------------------------------------------------------------------
  # * map_x
  #--------------------------------------------------------------------------
  def map_x
    $game_map.adjust_x($game_map.display_x)
  end
  #--------------------------------------------------------------------------
  # * map_y
  #--------------------------------------------------------------------------
  def map_y
    $game_map.adjust_y($game_map.display_y)
  end
  #--------------------------------------------------------------------------
  # * update
  #--------------------------------------------------------------------------
  def update
    super
    self.ox = map_x
    self.oy = map_y
    update_opacity
    update_lights
  end
  #--------------------------------------------------------------------------
  # * update lights
  #--------------------------------------------------------------------------
  def update_lights
    rect = Rect.new(map_x, map_y, Graphics.width, Graphics.height)
    self.bitmap.fill_rect(rect, color)
    draw_light_effects
  end
  #--------------------------------------------------------------------------
  # * color
  #--------------------------------------------------------------------------
  def color
    @shade.color
  end
  #--------------------------------------------------------------------------
  # * draw_light_effects
  #--------------------------------------------------------------------------
  def draw_light_effects
    @lights.values.each do |light|
      light.update
      next if !on_screen?(light)
      draw_light(light)
    end
  end
  #--------------------------------------------------------------------------
  # * on_sceen?
  #--------------------------------------------------------------------------
  def on_screen?(light)
    ax1 = light.x
    ay1 = light.y
    ax2 = light.x + light.width
    ay2 = light.y + light.height
    bx1 = map_x
    by1 = map_y
    bx2 = map_x + Graphics.width
    by2 = map_y + Graphics.height
    check1 = ax1.between?(bx1, bx2) || ax2.between?(bx1, bx2) ||
      ax1 < bx1 && ax2 > bx2
    check2 = ay1.between?(by1, by2) || ay2.between?(by1, by2) ||
      ay1 < by1 && ay2 > by2
    check1 && check2
  end
  #--------------------------------------------------------------------------
  # * draw_light
  #--------------------------------------------------------------------------
  def draw_light(light)
    img  = light.bitmap
    rect = Rect.new(light.x, light.y, light.width, light.height)
    self.bitmap.stretch_blt(rect, img, img.rect, light.opacity)
  end
  #--------------------------------------------------------------------------
  # * update_opacity
  #--------------------------------------------------------------------------
  def update_opacity
    @shade.update
    self.opacity    = @shade.opacity
    self.blend_type = @shade.blend
  end
  #--------------------------------------------------------------------------
  # * create_light
  #--------------------------------------------------------------------------
  def create_light(light)
    remove_light(light.id)
    @lights[light.id] = Game_LightBitmap.new(light)
  end
  #--------------------------------------------------------------------------
  # * remove_light
  #--------------------------------------------------------------------------
  def remove_light(id)
    @lights.delete(id) if @lights[id]
  end
  #--------------------------------------------------------------------------
  # * dispose
  #--------------------------------------------------------------------------
  def dispose
    super
    @lights.values.each {|light| light.dispose unless light.bitmap.disposed? }
  end

end #Sprite_Light
