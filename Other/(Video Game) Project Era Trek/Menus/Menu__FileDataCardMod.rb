#===============================================================================
# Menu__FileDataCardMod
# Edited    April 7 2020
#===============================================================================
#███████╗██╗██╗     ███████╗    ██████╗  █████╗ ████████╗ █████╗      ██████╗ █████╗ ██████╗ ██████╗
#██╔════╝██║██║     ██╔════╝    ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗    ██╔════╝██╔══██╗██╔══██╗██╔══██╗
#█████╗  ██║██║     █████╗      ██║  ██║███████║   ██║   ███████║    ██║     ███████║██████╔╝██║  ██║
#██╔══╝  ██║██║     ██╔══╝      ██║  ██║██╔══██║   ██║   ██╔══██║    ██║     ██╔══██║██╔══██╗██║  ██║
#██║     ██║███████╗███████╗    ██████╔╝██║  ██║   ██║   ██║  ██║    ╚██████╗██║  ██║██║  ██║██████╔╝
#╚═╝     ╚═╝╚══════╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝
module FileDataCard

  #--------------------------------------------------------------------------
  # * draw_card_contents
  #--------------------------------------------------------------------------
  def draw_card_contents(rect,header)
    if header.nil?
      draw_empty(rect)
    else
      draw_card_info(rect,header)
    end
  end
  #--------------------------------------------------------------------------
  # * draw_empty
  #--------------------------------------------------------------------------
  def draw_empty(rect)
    draw_text(rect.x,rect.y,rect.width,line_height,$data_dialogue[MSCR::SYS::SAVEFILEEMPTY],1)
  end
  #--------------------------------------------------------------------------
  # * draw_card_info
  #--------------------------------------------------------------------------
  def draw_card_info(rect,header)
    draw_text(rect.x+16,rect.y,160,line_height,header[:savetime].strftime($data_dialogue[MSCR::SYS::SAVEFILE_DATETIMEFORMAT]))
    draw_horz_line(rect.x+8,rect.y+line_height-10,160)
    draw_text(rect.x+16,rect.y+line_height,160,line_height,header[:mapname])
    draw_battle_members(rect,header)
    draw_text(rect.x+rect.width/2-48,rect.y,192,line_height,header[:playtime],2)
    draw_gold(rect,header)
    draw_text(rect.x+rect.width/2-16,rect.y+line_height,160,line_height,sprintf($data_dialogue[MSCR::SYS::SAVEFILE_STEPSTEXT],header[:steps]),2)
    #draw_percent
  end
  #--------------------------------------------------------------------------
  # * draw_battle_members
  #--------------------------------------------------------------------------
  def draw_battle_members(rect,header)
    bitmap = Cache.character(header[:characters][0][0])
    for i in 0...header[:characters].size
      actor = header[:characters][i]
      start_rect = Rect.new((actor[1] % 4 * 96) + 32, actor[1] / 4 * 128,32,32)
      dest_rect = Rect.new(rect.x+(48*i),rect.y+64,48,48)
      contents.stretch_blt(dest_rect,bitmap,start_rect)
    end
    bitmap.dispose
  end
  #--------------------------------------------------------------------------
  # * draw_gold
  #--------------------------------------------------------------------------
  def draw_gold(rect,header)
    draw_icon(MSCR::ICON::CURRENCY,rect.x+self.width/2+32,rect.y+rect.height-line_height*2)
    draw_currency_value(header[:gold],Vocab::currency_unit,rect.x+rect.width/2,rect.y+rect.height-line_height*2,144)
    change_color(normal_color)
  end

end #FileDataCard
