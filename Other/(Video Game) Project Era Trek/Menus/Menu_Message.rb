#===============================================================================
# Menu_Message
# Edited    June 18 2020
#===============================================================================
# ██████╗  █████╗ ███╗   ███╗███████╗    ███╗   ███╗███████╗███████╗███████╗ █████╗  ██████╗ ███████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ████╗ ████║██╔════╝██╔════╝██╔════╝██╔══██╗██╔════╝ ██╔════╝
#██║  ███╗███████║██╔████╔██║█████╗      ██╔████╔██║█████╗  ███████╗███████╗███████║██║  ███╗█████╗
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║╚██╔╝██║██╔══╝  ╚════██║╚════██║██╔══██║██║   ██║██╔══╝
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║ ╚═╝ ██║███████╗███████║███████║██║  ██║╚██████╔╝███████╗
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
class Game_Message

  #--------------------------------------------------------------------------
  # * Add Text
  #--------------------------------------------------------------------------
  def add(text)
    id = nil
    text.gsub(MSCR::SYS::DIAGRGX)  { id = $1.to_i }
    if !id.nil?
      @texts.push($data_dialogue[id])
    else
      @texts.push(text)
    end
  end

end #Game_Message

#███╗   ███╗███████╗███████╗███████╗ █████╗  ██████╗ ███████╗    ███╗   ██╗ █████╗ ███╗   ███╗███████╗
#████╗ ████║██╔════╝██╔════╝██╔════╝██╔══██╗██╔════╝ ██╔════╝    ████╗  ██║██╔══██╗████╗ ████║██╔════╝
#██╔████╔██║█████╗  ███████╗███████╗███████║██║  ███╗█████╗      ██╔██╗ ██║███████║██╔████╔██║█████╗
#██║╚██╔╝██║██╔══╝  ╚════██║╚════██║██╔══██║██║   ██║██╔══╝      ██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝
#██║ ╚═╝ ██║███████╗███████║███████║██║  ██║╚██████╔╝███████╗    ██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗
#╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
class Window_MessageName < Window_Base

  #--------------------------------------------------------------------------
  # initialize
  #--------------------------------------------------------------------------
  def initialize(message_window)
    @message_window = message_window
    dh = fitting_height(1)
    dx = (Graphics.width / 2) - (@message_window.width / 2)
    dy = Graphics.height - (@message_window.height + dh) + 4
    dw = Graphics.width
    super(dx, dy, dw, dh)
    self.openness = 0
    @close_counter = 0
    deactivate
  end
  #--------------------------------------------------------------------------
  # update
  #--------------------------------------------------------------------------
  def update
    super
    return if self.active
    return if self.openness == 0
    return if @closing
    @close_counter -= 1
    return if @close_counter > 0
    close
  end
  #--------------------------------------------------------------------------
  # start_close
  #--------------------------------------------------------------------------
  def start_close
    @close_counter = 4
    deactivate
  end
  #--------------------------------------------------------------------------
  # force_close
  #--------------------------------------------------------------------------
  def force_close
    @close_counter = 0
    deactivate
    close
  end
  #--------------------------------------------------------------------------
  # start
  #--------------------------------------------------------------------------
  def start(text)
    @text = text.clone
    set_width
    create_contents
    refresh
    activate
    open
  end
  #--------------------------------------------------------------------------
  # set_width
  #--------------------------------------------------------------------------
  def set_width
    text = @text.clone
    dw = standard_padding * 8 + text_size(text).width
    self.width = dw
  end
  #--------------------------------------------------------------------------
  # refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    reset_font_settings
    draw_text_ex((((self.width / 2) - (text_size(@text).width / 2)) - 16), 0, @text)
  end

end #Window_MessageName

# ██████╗  █████╗ ███╗   ███╗███████╗    ██╗███╗   ██╗████████╗███████╗██████╗ ██████╗ ██████╗ ███████╗████████╗███████╗██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██║████╗  ██║╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ██║██╔██╗ ██║   ██║   █████╗  ██████╔╝██████╔╝██████╔╝█████╗     ██║   █████╗  ██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗██╔═══╝ ██╔══██╗██╔══╝     ██║   ██╔══╝  ██╔══██╗
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║██║ ╚████║   ██║   ███████╗██║  ██║██║     ██║  ██║███████╗   ██║   ███████╗██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
class Game_Interpreter

  #--------------------------------------------------------------------------
  # * Setup Choices
  #--------------------------------------------------------------------------
  alias mscr_menumessage_gameinterpreter_setupchoices setup_choices
  def setup_choices(params)
    params[0].map! {|s| s.gsub(MSCR::SYS::DIAGRGX) {$data_dialogue[$1.to_i]} }
    mscr_menumessage_gameinterpreter_setupchoices(params)
  end

end #Game_Interpreter

#██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗    ███╗   ███╗███████╗███████╗███████╗ █████╗  ██████╗ ███████╗
#██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║    ████╗ ████║██╔════╝██╔════╝██╔════╝██╔══██╗██╔════╝ ██╔════╝
#██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    ██╔████╔██║█████╗  ███████╗███████╗███████║██║  ███╗█████╗
#██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║    ██║╚██╔╝██║██╔══╝  ╚════██║╚════██║██╔══██║██║   ██║██╔══╝
#╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝    ██║ ╚═╝ ██║███████╗███████║███████║██║  ██║╚██████╔╝███████╗
# ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝     ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
class Window_Message < Window_Base

  #--------------------------------------------------------------------------
  # initialize
  #--------------------------------------------------------------------------
  alias mscr_windowmessage_initialize initialize
  def initialize
    mscr_windowmessage_initialize
    self.x = (Graphics.width / 2) - (window_width / 2)
  end
  #--------------------------------------------------------------------------
  # overwrite method: window_width
  #--------------------------------------------------------------------------
  def window_width
    return Graphics.width - (96 + (standard_padding * 2))
  end
  #--------------------------------------------------------------------------
  # * Get Window Height
  #--------------------------------------------------------------------------
  def window_height
    fitting_height(visible_line_number) - 8
  end
  #--------------------------------------------------------------------------
  # * Create All Windows
  #--------------------------------------------------------------------------
  def create_all_windows
    @gold_window = Window_Gold.new
    @gold_window.x = Graphics.width - @gold_window.width
    @gold_window.y = 0
    @gold_window.openness = 0
    @choice_window = Window_ChoiceList.new(self)
    @number_window = Window_NumberInput.new(self)
    #@item_window = Window_KeyItem.new(self)
    @name_window = Window_MessageName.new(self)
  end
  #--------------------------------------------------------------------------
  # * Free All Windows
  #--------------------------------------------------------------------------
  def dispose_all_windows
    @gold_window.dispose
    @choice_window.dispose
    @number_window.dispose
    #@item_window.dispose
    @name_window.dispose
  end
  #--------------------------------------------------------------------------
  # * Update All Windows
  #--------------------------------------------------------------------------
  def update_all_windows
    @gold_window.update
    @choice_window.update
    @number_window.update
    #@item_window.update
    @name_window.update
  end

  # WORD WRAPPING -----------------------------------------------------------
  #--------------------------------------------------------------------------
  # process_character
  #--------------------------------------------------------------------------
  alias mscr_windowmessage_processcharacter process_character
  def process_character(c, text, pos)
    if c =~ /[ \t]/
      c = '' if @lastc =~ /[\s\n\f]/
      if pos[:x] + get_next_word_size(c, text) > contents.width - 8
        process_new_line(text, pos)
      else
        process_normal_character(c, pos)
      end
      @lastc = c
    else
      @lastc = c
      mscr_windowmessage_processcharacter(c, text, pos)
    end
  end
  #--------------------------------------------------------------------------
  # get_next_word_size
  #--------------------------------------------------------------------------
  def get_next_word_size(c, text)
    nextword = text.split(/[\s\n\f]/, 2)[0]
    if nextword
      icons = 0
      if nextword =~ /\e/i
        nextword = nextword.split(/\e[oOcC]+\[\d*\]/).join
        nextword = nextword.split(/\e[\.\|\^<>!]/).join
        nextword = nextword.split(/\e[^iIhH]+/, 2)[0]
        nextword.gsub!(/\e[iIhH]+\[[\d,]*\]/) do
          icons += 1
          ''
        end if nextword
      end
      wordsize = (nextword ? text_size(c + nextword).width : text_size( c ).width)
      wordsize += icons * 24
    else
      wordsize = text_size( c ).width
    end
    return wordsize
  end
  #--------------------------------------------------------------------------
  # process_escape_character
  #--------------------------------------------------------------------------
  alias mscr_windowmessage_processescapecharacter process_escape_character
  def process_escape_character(code, text, pos)
    mscr_windowmessage_processescapecharacter(code, text, pos)
    if pos[:x] + get_next_word_size('', text) > contents.width
      process_new_line(text, pos)
    end
  end
  # WORD WRAPPING -----------------------------------------------------------
  #--------------------------------------------------------------------------
  # overwrite method: convert_escape_characters
  #--------------------------------------------------------------------------
  def convert_escape_characters(text)
    result = super(text.to_s.clone)
    result = namebox_escape_characters(result)
    return result
  end
  #--------------------------------------------------------------------------
  # new method: namebox_escape_characters
  #--------------------------------------------------------------------------
  def namebox_escape_characters(result)
    result.gsub!(/\eNA\[(.+?)\]/i)  { namewindow($1) }
    return result
  end
  #--------------------------------------------------------------------------
  # new method: namebox
  #--------------------------------------------------------------------------
  def namewindow(text)
    @name_text = text
    return ""
  end
  #--------------------------------------------------------------------------
  # rewrite: new_page
  #--------------------------------------------------------------------------
  def new_page(text, pos)
    start_name_window
    contents.clear
    reset_font_settings
    pos[:x] = new_line_x
    pos[:y] = 0
    pos[:new_x] = new_line_x
    pos[:height] = calc_line_height(text)
    clear_flags
    #MSCR::SOUND::SE_TEXTBOXCONT.play
  end
  #--------------------------------------------------------------------------
  # * Get New Line Position
  #--------------------------------------------------------------------------
  def new_line_x
    8
  end
  #--------------------------------------------------------------------------
  # new method: clear_name_window
  #--------------------------------------------------------------------------
  def clear_name_window
    @name_text = ""
  end
  #--------------------------------------------------------------------------
  # new method: start_name_window
  #--------------------------------------------------------------------------
  def start_name_window
    return if @name_text == ""
    @name_window.start(@name_text)
  end
  #--------------------------------------------------------------------------
  # overwrite method: fiber_main
  #--------------------------------------------------------------------------
  def fiber_main
    $game_message.visible = true
    update_background
    update_placement
    loop do
      process_all_text if $game_message.has_text?
      #MSCR::SOUND::SE_TEXTBOXDONE.play
      process_input
      $game_message.clear
      @gold_window.close
      @name_window.start_close
      Fiber.yield
      break unless text_continue?
    end
    close_and_wait
    $game_message.visible = false
    @fiber = nil
  end
  #--------------------------------------------------------------------------
  # alias method: open_and_wait
  #--------------------------------------------------------------------------
  alias mscr_windowmessage_openandwait open_and_wait
  def open_and_wait
    clear_name_window
    mscr_windowmessage_openandwait
  end
  #--------------------------------------------------------------------------
  # alias method: close_and_wait
  #--------------------------------------------------------------------------
  alias mscr_windowmessage_closeandwait close_and_wait
  def close_and_wait
    @name_window.force_close
    mscr_windowmessage_closeandwait
    #MSCR::SOUND::SE_TEXTBOXCLOSE.play
  end
  #--------------------------------------------------------------------------
  # * Determine if All Windows Are Fully Closed
  #--------------------------------------------------------------------------
  def all_close?
    close? && @choice_window.close? && @number_window.close? && @name_window.close?
  end
  #--------------------------------------------------------------------------
  # * Item Selection Processing
  #--------------------------------------------------------------------------
  def input_item
    #@item_window.start
    #Fiber.yield while @item_window.active
  end

end #Window_Message

#██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗     ██████╗██╗  ██╗ ██████╗ ██╗ ██████╗███████╗    ██╗     ██╗███████╗████████╗
#██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║    ██╔════╝██║  ██║██╔═══██╗██║██╔════╝██╔════╝    ██║     ██║██╔════╝╚══██╔══╝
#██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    ██║     ███████║██║   ██║██║██║     █████╗      ██║     ██║███████╗   ██║
#██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║    ██║     ██╔══██║██║   ██║██║██║     ██╔══╝      ██║     ██║╚════██║   ██║
#╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝    ╚██████╗██║  ██║╚██████╔╝██║╚██████╗███████╗    ███████╗██║███████║   ██║
# ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝      ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝ ╚═════╝╚══════╝    ╚══════╝╚═╝╚══════╝   ╚═╝
class Window_ChoiceList < Window_Command

  #--------------------------------------------------------------------------
  # * Update Window Position
  #--------------------------------------------------------------------------
  alias mscr_menumessage_windowchoicelist_updateplacement update_placement
  def update_placement
    mscr_menumessage_windowchoicelist_updateplacement
    self.x -= 64
  end

end #Window_ChoiceList
