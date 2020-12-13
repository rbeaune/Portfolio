#===============================================================================
# Battle_Background
# Edited    July 4 2019
#===============================================================================
#███████╗██████╗ ██████╗ ██╗████████╗███████╗███████╗███████╗████████╗    ██████╗  █████╗ ████████╗████████╗██╗     ███████╗
#██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔════╝██╔════╝██╔════╝╚══██╔══╝    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝
#███████╗██████╔╝██████╔╝██║   ██║   █████╗  ███████╗█████╗     ██║       ██████╔╝███████║   ██║      ██║   ██║     █████╗
#╚════██║██╔═══╝ ██╔══██╗██║   ██║   ██╔══╝  ╚════██║██╔══╝     ██║       ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝
#███████║██║     ██║  ██║██║   ██║   ███████╗███████║███████╗   ██║       ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗
#╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝╚══════╝╚══════╝   ╚═╝       ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝
class Spriteset_Battle

  #--------------------------------------------------------------------------
  # * Get Battle Background (Floor) Bitmap
  #--------------------------------------------------------------------------
  alias mscr_battlebackground_spritesetbattle_battleback1bitmap battleback1_bitmap
  def battleback1_bitmap
    if !$BTEST
      create_mapbattleback_bitmap
    else
      mscr_battlebackground_spritesetbattle_battleback1bitmap
    end
  end
  #--------------------------------------------------------------------------
  # * Get Battle Background (Wall) Bitmap
  #--------------------------------------------------------------------------
  alias mscr_battlebackground_spritesetbattle_battleback2bitmap battleback2_bitmap
  def battleback2_bitmap
    if !$BTEST
      Bitmap.new(1,1)
    else
      mscr_battlebackground_spritesetbattle_battleback2bitmap
    end
  end
  #--------------------------------------------------------------------------
  # * Create Battle Background Bitmap from Processed Map Screen
  #--------------------------------------------------------------------------
  def create_mapbattleback_bitmap
    source = SceneManager.background_bitmap
    bitmap = Bitmap.new(Graphics.width, Graphics.height)
    bitmap.stretch_blt(bitmap.rect, source, source.rect)
    bitmap
  end

end #Spriteset_Battle
