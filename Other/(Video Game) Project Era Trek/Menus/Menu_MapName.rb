#===============================================================================
# Menu_MapName
# Edited    March 23 2020
#===============================================================================
#███╗   ███╗ █████╗ ██████╗     ███╗   ██╗ █████╗ ███╗   ███╗███████╗
#████╗ ████║██╔══██╗██╔══██╗    ████╗  ██║██╔══██╗████╗ ████║██╔════╝
#██╔████╔██║███████║██████╔╝    ██╔██╗ ██║███████║██╔████╔██║█████╗
#██║╚██╔╝██║██╔══██║██╔═══╝     ██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝
#██║ ╚═╝ ██║██║  ██║██║         ██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗
#╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
class Window_MapName < Window_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(0, -fitting_height(1), window_width, fitting_height(1))
    @show_count = 150
    self.visible = false
    check_display_name
  end

  def opening_animation
    @new_y = 0
  end

  def closing_animation
    @new_y = -fitting_height(1)
  end
  #--------------------------------------------------------------------------
  # * Get Window Width
  #--------------------------------------------------------------------------
  def window_width
    return 240
  end
  #--------------------------------------------------------------------------
  # * check_display_name
  #--------------------------------------------------------------------------
  def check_display_name
    mapname = ""
    $game_map.display_name.gsub(MSCR::SYS::DIAGRGX) {
      mapname = $data_dialogue[$1.to_i]
    }
    if ($game_variables[MSCR::VAR::MAPDISPLAYNAME] != mapname && mapname != "") ||
        SceneManager.scene_is?(Scene_Menu)
      $game_variables[MSCR::VAR::MAPDISPLAYNAME] = mapname
      self.visible = true
      opening_animation
      refresh
    else
      self.visible = false
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    return if SceneManager.scene_is?(Scene_Menu)
    if @show_count >= 1
      @show_count -= 1
    else
      closing_animation
    end
  end
  #--------------------------------------------------------------------------
  # * Open Window
  #--------------------------------------------------------------------------
  def open
    refresh
    @show_count = 150
    self
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    contents.font.size = 28
    draw_text(contents.rect, $game_variables[MSCR::VAR::MAPDISPLAYNAME], 1)
  end

end #Window_MapName

#███████╗ ██████╗███████╗███╗   ██╗███████╗    ███╗   ███╗ █████╗ ██████╗
#██╔════╝██╔════╝██╔════╝████╗  ██║██╔════╝    ████╗ ████║██╔══██╗██╔══██╗
#███████╗██║     █████╗  ██╔██╗ ██║█████╗      ██╔████╔██║███████║██████╔╝
#╚════██║██║     ██╔══╝  ██║╚██╗██║██╔══╝      ██║╚██╔╝██║██╔══██║██╔═══╝
#███████║╚██████╗███████╗██║ ╚████║███████╗    ██║ ╚═╝ ██║██║  ██║██║
#╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═══╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝
class Scene_Map < Scene_Base

  #--------------------------------------------------------------------------
  # * Post Processing for Transferring Player
  #--------------------------------------------------------------------------
  alias mscr_menumapname_scenemap_posttransfer post_transfer
  def post_transfer
    mscr_menumapname_scenemap_posttransfer
    @map_name_window.check_display_name
  end

end #Scene_Map
