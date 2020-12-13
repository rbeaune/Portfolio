#===============================================================================
# System_Dialogue
# Edited    April 6 2020
#===============================================================================
#██████╗  █████╗ ████████╗ █████╗     ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗
#██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗
#██║  ██║███████║   ██║   ███████║    ██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝
#██║  ██║██╔══██║   ██║   ██╔══██║    ██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗
#██████╔╝██║  ██║   ██║   ██║  ██║    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║
#╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
module DataManager

  #--------------------------------------------------------------------------
  # * Initialize Module
  #--------------------------------------------------------------------------
  class << self; alias mscr_loaddialogue_datamanger_init init; end
  def self.init
    load_dialogue
    mscr_loaddialogue_datamanger_init
    load_object_text
  end
  #--------------------------------------------------------------------------
  # * load_dialogue
  #--------------------------------------------------------------------------
  def self.load_dialogue
    data = load_data("Scripts/_textEN.txt")
    $data_dialogue = {}
    data.each_line.with_index do |line, i|
      line.rstrip!
      $data_dialogue[i + 1] = line.to_s
    end
  end
  #--------------------------------------------------------------------------
  # * load_object_text
  #--------------------------------------------------------------------------
  def self.load_object_text
    load_database_texts($data_actors)
    load_database_texts($data_skills)
    load_database_texts($data_items)
    load_database_texts($data_weapons)
    load_database_texts($data_armors)
    load_database_texts($data_enemies)
    load_database_texts($data_states)
    load_database_terms_texts($data_system.terms.basic)
    load_database_terms_texts($data_system.terms.params)
    load_database_terms_texts($data_system.terms.etypes)
    load_database_terms_texts($data_system.terms.commands)
  end
  #--------------------------------------------------------------------------
  # * load_database_texts
  #--------------------------------------------------------------------------
  def self.load_database_texts(data)
    data.each do |item|
      next if item.nil?
      item.name.gsub(MSCR::SYS::DIAGRGX) {
        text = $data_dialogue[$1.to_i].split(":").map {|s| s.to_s}
        item.name = text[0]
        item.description = text[1] unless item.is_a?(RPG::Enemy) || item.is_a?(RPG::State)
      }
    end
  end
  #--------------------------------------------------------------------------
  # * load_database_terms_texts
  #--------------------------------------------------------------------------
  def self.load_database_terms_texts(data)
    data.each_with_index do |item, i|
      next if item.nil?
      item.gsub(MSCR::SYS::DIAGRGX) {
        data[i] = $data_dialogue[$1.to_i]
      }
    end
  end

end #DataManager
