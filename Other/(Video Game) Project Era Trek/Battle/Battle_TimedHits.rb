#===============================================================================
# Battle_TimedHits
# Edited    March 30 2020
#===============================================================================
#██████╗ ██████╗  ██████╗     ██████╗  █████╗ ███████╗███████╗    ██╗████████╗███████╗███╗   ███╗
#██╔══██╗██╔══██╗██╔════╝     ██╔══██╗██╔══██╗██╔════╝██╔════╝    ██║╚══██╔══╝██╔════╝████╗ ████║
#██████╔╝██████╔╝██║  ███╗    ██████╔╝███████║███████╗█████╗      ██║   ██║   █████╗  ██╔████╔██║
#██╔══██╗██╔═══╝ ██║   ██║    ██╔══██╗██╔══██║╚════██║██╔══╝      ██║   ██║   ██╔══╝  ██║╚██╔╝██║
#██║  ██║██║     ╚██████╔╝    ██████╔╝██║  ██║███████║███████╗    ██║   ██║   ███████╗██║ ╚═╝ ██║
#╚═╝  ╚═╝╚═╝      ╚═════╝     ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
class RPG::BaseItem

  #--------------------------------------------------------------------------
  #  * timedhit
  #--------------------------------------------------------------------------
  def timedhit
    if @timedhit.nil?
      if @note =~ /<timedhit:[ ](.*)>/i
        @timedhit = $1.to_s.split(",").map {|i| i.to_i}
      elsif @note =~ /<timedhit>/i
        @timedhit = [MSCR::BATTLE::TIMEDHITDEFAULTTARG, MSCR::BATTLE::TIMEDHITDEFAULTDIFF]
      else
        @timedhit = 0
      end
    end
    @timedhit
  end

end #RPG::BaseItem

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ██████╗  █████╗ ████████╗████████╗██╗     ███████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ██████╔╝███████║   ██║      ██║   ██║     █████╗
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝
class Scene_Battle < Scene_Base

  #--------------------------------------------------------------------------
  # * public instance variables
  #--------------------------------------------------------------------------
  attr_accessor :btnactive
  #--------------------------------------------------------------------------
  # * update_basic
  #--------------------------------------------------------------------------
  alias mscr_timedhit_scenebattle_updatebasic update_basic
  def update_basic
    if @btnactive
      btn_pressed
      @hit_indicator.update if @hit_indicator
    end
    mscr_timedhit_scenebattle_updatebasic
  end
  #--------------------------------------------------------------------------
  # * btn_pressed
  #--------------------------------------------------------------------------
  def btn_pressed
    return if $game_troop.all_dead?
    if Input.trigger?(:C) && @hit_indicator.hit?
      @hit_indicator.success
      @subject.timed = true
      MSCR::SOUND::SE_BATTLE_TIMEDHIT.play
      @btnactive = nil
    elsif Input.trigger?(:C)
      @hit_indicator.fail
      @btnactive = nil
    end
  end
  #--------------------------------------------------------------------------
  # * do_indicator
  #--------------------------------------------------------------------------
  def do_indicator(targets)
    return if targets.nil? || targets.empty?
    @def_opts = nil
    options = []
    item = @subject.current_action.item
    target = targets[0]
    if @subject.is_a?(Game_Actor) && !@subject.confusion? && item.timedhit != 0
      @current_inditargets = targets
      if !@subject.equips[0].nil? && @subject.equips[0].timedhit != 0
        options = @subject.equips[0].timedhit.clone
      else
        options = item.timedhit.clone
      end
      item.id == 1 ? options.push(1) : options.push(2)
      setup_hit_indicator(options)
      @btnactive = true
    elsif target && defending?(target)
      @current_inditargets = targets
      options = @def_opts.timedhit.clone
      options.push(3)
      setup_hit_indicator(options)
      @btnactive = true
    end
    update_for_wait
  end
  #--------------------------------------------------------------------------
  # show_animation
  #--------------------------------------------------------------------------
  alias mscr_timedhit_scenebattle_showanimation show_animation
  def show_animation(targets, animation_id)
    do_indicator(targets)
    mscr_timedhit_scenebattle_showanimation(targets, animation_id)
  end
  #--------------------------------------------------------------------------
  # * defending?
  #--------------------------------------------------------------------------
  def defending?(target)
    return false if !target.is_a?(Game_Actor)
    return false if @subject.is_a?(Game_Actor)
    @def_opts = @subject.current_action.item
    return @def_opts.timedhit != 0 ? true : false
  end
  #--------------------------------------------------------------------------
  # * setup_hit_indicator
  #--------------------------------------------------------------------------
  def setup_hit_indicator(array)
    return if @current_inditargets[0].nil? || $game_troop.all_dead?
    if !@current_inditargets.empty? && @current_inditargets[0].screen_x
      x = @current_inditargets[0].screen_x + (@current_inditargets[0].actor? ? 16 * MSCR::BATTLE::BATTLERZOOM : 0)
      y = @current_inditargets[0].screen_y + (@current_inditargets[0].actor? ? 16 * MSCR::BATTLE::BATTLERZOOM : 0)
    else
      x = Graphics.width / 2 #+ Galv_BtnAtk::X_FRONT_OFFSET
      y = Graphics.width / 1.7 #+ Galv_BtnAtk::Y_FRONT_OFFSET
    end
    @hit_indicator = TimedHit.new(x,y,array)
  end
  #--------------------------------------------------------------------------
  # invoke_item
  #--------------------------------------------------------------------------
  alias mscr_timedhit_scenebattle_invokeitem invoke_item
  def invoke_item(target, item)
    @btnactive = nil
    @hit_indicator.dispose if @hit_indicator
    mscr_timedhit_scenebattle_invokeitem(target, item)
  end
  #--------------------------------------------------------------------------
  # * terminate
  #--------------------------------------------------------------------------
  alias mscr_timedhit_scenebattle_terminate terminate
  def terminate
    mscr_timedhit_scenebattle_terminate
    @hit_indicator.dispose if @hit_indicator
  end

end #Scene_Battle

#████████╗██╗███╗   ███╗███████╗██████╗     ██╗  ██╗██╗████████╗
#╚══██╔══╝██║████╗ ████║██╔════╝██╔══██╗    ██║  ██║██║╚══██╔══╝
#   ██║   ██║██╔████╔██║█████╗  ██║  ██║    ███████║██║   ██║
#   ██║   ██║██║╚██╔╝██║██╔══╝  ██║  ██║    ██╔══██║██║   ██║
#   ██║   ██║██║ ╚═╝ ██║███████╗██████╔╝    ██║  ██║██║   ██║
#   ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝╚═════╝     ╚═╝  ╚═╝╚═╝   ╚═╝
class TimedHit

  #--------------------------------------------------------------------------
  # * initialize
  #--------------------------------------------------------------------------
  def initialize(x,y,options)
    @x = x
    @y = y
    @img = options[2].to_s
    @start_frame = 0
    @target_frame = options[0]
    @current_frame = 0
    @s = (3.to_f - 0.6) / (@target_frame - @start_frame)
    @d = options[1].to_f * 0.5
    create_hit_indicator
    create_target_indicator
  end
  #--------------------------------------------------------------------------
  # * create_target_indicator
  #--------------------------------------------------------------------------
  def create_target_indicator
    @hittarget = Sprite.new(@viewport1)
    @hittarget.bitmap = Cache.system("TimedHitTarget" + @img)
    @hittarget.z = 100
    @hittarget.x = @x - (@hittarget.bitmap.width / 2)
    @hittarget.y = @y - (@hittarget.bitmap.height / 2)
    @hittarget.opacity = 130
  end
  #--------------------------------------------------------------------------
  # * create_hit_indicator
  #--------------------------------------------------------------------------
  def create_hit_indicator
    @hitindi = Sprite.new(@viewport1)
    @hitindi.bitmap = Cache.system("TimedHitIndicator" + @img)
    @hitindi.x = @x
    @hitindi.y = @y
    @hitindi.z = 100
    @hitindi.opacity = 0
    @hitindi.zoom_x = 3
    @hitindi.zoom_y = 3
    @hitindi.color = Color.new(0, 0, 0, 0)
  end
  #--------------------------------------------------------------------------
  # * hit?
  #--------------------------------------------------------------------------
  def hit?
    @current_frame.between?(@target_frame - @d,@target_frame + @d)
  end
  #--------------------------------------------------------------------------
  # * success
  #--------------------------------------------------------------------------
  def success
    c = MSCR::BATTLE::TIMEDHITCOL
    @hitindi.color = Color.new(c[0],c[1],c[2],255)
  end
  #--------------------------------------------------------------------------
  # * fail
  #--------------------------------------------------------------------------
  def fail
    c = MSCR::BATTLE::TIMEDMISSCOL
    @hitindi.color = Color.new(c[0],c[1],c[2],255)
  end
  #--------------------------------------------------------------------------
  # * update
  #--------------------------------------------------------------------------
  def update
    update_indicators
  end
  #--------------------------------------------------------------------------
  # * update_indicators
  #--------------------------------------------------------------------------
  def update_indicators
    return @current_frame += 1 if @current_frame < @start_frame
    @hitindi.opacity = 100
    @hitindi.zoom_x -= @s
    @hitindi.zoom_y -= @s
    @hitindi.x = @x - (@hitindi.bitmap.width / 2) * @hitindi.zoom_x
    @hitindi.y = @y - (@hitindi.bitmap.height / 2) * @hitindi.zoom_y
    @current_frame += 1
    if @hitindi.zoom_x <= 0
      fail
      SceneManager.scene.btnactive = nil
    end
  end
  #--------------------------------------------------------------------------
  # * dispose
  #--------------------------------------------------------------------------
  def dispose
    @hitindi.dispose if @hitindi
    @hittarget.dispose if @hittarget
  end

end #TimedHit
