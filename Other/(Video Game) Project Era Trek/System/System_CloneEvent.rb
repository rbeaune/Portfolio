#==============================================================================
# System_CloneEvent
# Edited    April 29 2020
#==============================================================================
#██████╗  █████╗ ████████╗ █████╗     ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗
#██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗
#██║  ██║███████║   ██║   ███████║    ██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝
#██║  ██║██╔══██║   ██║   ██╔══██║    ██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗
#██████╔╝██║  ██║   ██║   ██║  ██║    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║
#╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
module DataManager

  #--------------------------------------------------------------------------
  # * Load normal database
  #--------------------------------------------------------------------------
  class << self; alias mscr_cloneevent_datamanger_loadnormaldatabase load_normal_database; end
  def self.load_normal_database
    mscr_cloneevent_datamanger_loadnormaldatabase
    load_clone_events
  end

  #--------------------------------------------------------------------------
  # * load_cloned_events
  #--------------------------------------------------------------------------
  def self.load_clone_events
    $data_clones = {}
    events = load_data(sprintf('Data/Map%03d.rvdata2', MSCR::SYS::CLONEMAP)).events
    events.each do |i, event|
      name = event.name.downcase
      $data_clones[name] = event.clone
    end
  end

end #DataManager

# ██████╗  █████╗ ███╗   ███╗███████╗    ███╗   ███╗ █████╗ ██████╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ████╗ ████║██╔══██╗██╔══██╗
#██║  ███╗███████║██╔████╔██║█████╗      ██╔████╔██║███████║██████╔╝
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║╚██╔╝██║██╔══██║██╔═══╝
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║ ╚═╝ ██║██║  ██║██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝
class Game_Map

  #--------------------------------------------------------------------------
  # * Event Setup
  #--------------------------------------------------------------------------
  def setup_events
    @events = {}
    @map.events.each do |i, event|
      item = event.pages[0].list[0]
      if (item.code == 108 || item.code == 408) && item.parameters[0] =~ /<CLONE (\w+)>/i
        event.pages = Array.new($data_clones[$1.to_s.downcase].pages.clone)
      end
      @events[i] = Game_Event.new(@map_id, event)
    end
    @common_events = parallel_common_events.collect do |common_event|
      Game_CommonEvent.new(common_event.id)
    end
    refresh_tile_events
  end

end #Game_Map
