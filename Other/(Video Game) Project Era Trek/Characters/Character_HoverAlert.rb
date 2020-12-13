#===============================================================================
# Character_HoverAlert
# Edited    May 8 2020
#===============================================================================
# ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗     ██████╗  █████╗ ███████╗███████╗
#██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ██╔══██╗██╔══██╗██╔════╝██╔════╝
#██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝    ██████╔╝███████║███████╗█████╗
#██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗    ██╔══██╗██╔══██║╚════██║██╔══╝
#╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║    ██████╔╝██║  ██║███████║███████╗
# ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
class Game_CharacterBase

  #--------------------------------------------------------------------------
  # * Public instance variables
  #--------------------------------------------------------------------------
  attr_reader   :hover_alert
  #--------------------------------------------------------------------------
  # * init_private_members
  #--------------------------------------------------------------------------
  alias mscr_hoveralert_gamecharacterbase_initprivatemembers init_private_members
  def init_private_members(*args)
    mscr_hoveralert_gamecharacterbase_initprivatemembers(*args)
    clear_hover_alert
  end
  #--------------------------------------------------------------------------
  # * init_private_members
  #--------------------------------------------------------------------------
  def clear_hover_alert
    @hover_alert = -1
  end
  #--------------------------------------------------------------------------
  # * interpret_hover_alert_comment
  #--------------------------------------------------------------------------
  def interpret_hover_alert_comment(text)
    if text =~ /\<HA([!?.])\>/i
      case $1
      when "!"
        @hover_alert = MSCR::ICON::HAEXCLAIM
      when "?"
        @hover_alert = MSCR::ICON::HAQUESTION
      when "."
        @hover_alert = MSCR::ICON::HAELLIPSES
      else
        @hover_alert = -1
      end
    else
      @hover_alert = -1
    end
  end

end #Game_CharacterBase

# ██████╗  █████╗ ███╗   ███╗███████╗    ███████╗██╗   ██╗███████╗███╗   ██╗████████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝
#██║  ███╗███████║██╔████╔██║█████╗      █████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝
class Game_Event < Game_Character

  #--------------------------------------------------------------------------
  # * setup_page_settings
  #--------------------------------------------------------------------------
  alias mscr_hoveralert_gameevent_setuppage_settings setup_page_settings
  def setup_page_settings(*args)
    mscr_hoveralert_gameevent_setuppage_settings(*args)
    clear_hover_alert
    interpret_hover_alert_comment(collect_first_comment)
  end
  #--------------------------------------------------------------------------
  # * clear_page_settings
  #--------------------------------------------------------------------------
  alias mscr_hoveralert_gameevent_clearpagesettings clear_page_settings
  def clear_page_settings(*args)
    mscr_hoveralert_gameevent_clearpagesettings(*args)
    clear_hover_alert
  end
  #--------------------------------------------------------------------------
  # * collect_first_comment
  #--------------------------------------------------------------------------
  def collect_first_comment
    comment = @list[0].parameters[0] if !@list[0].nil? && (@list[0].code == 108 || @list[0].code == 408)
    comment
  end

end #Game_Event

#███████╗██████╗ ██████╗ ██╗████████╗███████╗    ██╗  ██╗ ██████╗ ██╗   ██╗███████╗██████╗      █████╗ ██╗     ███████╗██████╗ ████████╗
#██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝    ██║  ██║██╔═══██╗██║   ██║██╔════╝██╔══██╗    ██╔══██╗██║     ██╔════╝██╔══██╗╚══██╔══╝
#███████╗██████╔╝██████╔╝██║   ██║   █████╗      ███████║██║   ██║██║   ██║█████╗  ██████╔╝    ███████║██║     █████╗  ██████╔╝   ██║
#╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝      ██╔══██║██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗    ██╔══██║██║     ██╔══╝  ██╔══██╗   ██║
#███████║██║     ██║  ██║██║   ██║   ███████╗    ██║  ██║╚██████╔╝ ╚████╔╝ ███████╗██║  ██║    ██║  ██║███████╗███████╗██║  ██║   ██║
#╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝
class Sprite_HoverAlert < Sprite_Base

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize(viewport, character)
    @char_x, @char_y = 0, 0
    @effect_x, @effect_y = 0, 0
    @effect_time = -1
    super(viewport)
    self.z = 200
    @character = character
    refresh
  end
  #--------------------------------------------------------------------------
  # * dispose
  #--------------------------------------------------------------------------
  def dispose(*args)
    bitmap.dispose if bitmap && !bitmap.disposed?
    super(*args)
  end
  #--------------------------------------------------------------------------
  # * update
  #--------------------------------------------------------------------------
  def update
    super
    refresh if @hover_alert != @character.hover_alert
    if bitmap
      x = @character.distance_x_from($game_player.x).abs
      y = @character.distance_y_from($game_player.y).abs
      if self.visible
        update_effect
        self.x = @char_x + @effect_x
        self.y = @char_y + @effect_y
      end
    end
  end
  #--------------------------------------------------------------------------
  # * adjust_character_position
  #--------------------------------------------------------------------------
  def adjust_character_position(x, y)
    @char_x, @char_y = x, y
  end
  #--------------------------------------------------------------------------
  # * refresh
  #--------------------------------------------------------------------------
  def refresh
    @hover_alert = @character.hover_alert
    bitmap.dispose if bitmap && !bitmap.disposed?
    self.bitmap = Bitmap.new(24, 24)
    return unless @hover_alert
    draw_icon(@hover_alert, 0, (height - 24) / 2)
    self.ox = bitmap.width / 2
    self.oy = bitmap.height
    self.visible = true
    start_effect
  end
  #--------------------------------------------------------------------------
  # * draw_icon
  #--------------------------------------------------------------------------
  def draw_icon(icon_index, x, y)
    bmp = Cache.system("Iconset")
    rect = Rect.new(icon_index % 16 * 24, icon_index / 16 * 24, 24, 24)
    bitmap.blt(x, y, bmp, rect, 255)
  end
  #--------------------------------------------------------------------------
  # * start_effect
  #--------------------------------------------------------------------------
  def start_effect
    @effect_x, @effect_y = 0, 0
    @effect_time = 32
  end
  #--------------------------------------------------------------------------
  # * update_effect
  #--------------------------------------------------------------------------
  def update_effect
    if @effect_time == 0
      start_effect
    elsif @effect_time > 0
      @effect_y += (@effect_time > 16 ? -0.4 : 0.4)
      @effect_time -= 1
    end
  end

end #Sprite_HoverAlert

#███████╗██████╗ ██████╗ ██╗████████╗███████╗     ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗
#██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
#███████╗██████╔╝██████╔╝██║   ██║   █████╗      ██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝
#╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝      ██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗
#███████║██║     ██║  ██║██║   ██║   ███████╗    ╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║
#╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
class Sprite_Character < Sprite_Base

  #--------------------------------------------------------------------------
  # * update
  #--------------------------------------------------------------------------
  alias mscr_hoveralert_spritecharacter_update update
  def update(*args)
    mscr_hoveralert_spritecharacter_update(*args)
    update_hover_sprite
  end
  #--------------------------------------------------------------------------
  # * update_hover_sprite
  #--------------------------------------------------------------------------
  def update_hover_sprite
    if !@hover_sprite && @character.hover_alert != -1
      @hover_sprite = Sprite_HoverAlert.new(viewport, @character)
    end
    if @hover_sprite
      if @character.hover_alert == -1
        dispose_hover_sprite
      else
        @hover_sprite.adjust_character_position(self.x, self.y - self.oy)
        @hover_sprite.update
      end
    end
  end
  #--------------------------------------------------------------------------
  # * dipose
  #--------------------------------------------------------------------------
  alias mscr_hoveralert_spritecharacter_dipose dispose
  def dispose(*args)
    dispose_hover_sprite
    mscr_hoveralert_spritecharacter_dipose(*args)
  end
  #--------------------------------------------------------------------------
  # * dispose_hover_sprite
  #--------------------------------------------------------------------------
  def dispose_hover_sprite
    @hover_sprite.dispose if @hover_sprite && !@hover_sprite.disposed?
    @hover_sprite = nil
  end

end #Sprite_Character
