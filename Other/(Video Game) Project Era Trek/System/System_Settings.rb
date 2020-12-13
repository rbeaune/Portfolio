#===============================================================================
# System_Settings
# Edited    March 7 2020
#===============================================================================
# ██████╗  █████╗ ███╗   ███╗███████╗    ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
#██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
#██║  ███╗███████║██╔████╔██║█████╗      ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
#██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
#╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
# ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
class Game_System

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :setting_music            # Volume for music (BGM, ME)
  attr_accessor :setting_sfx              # Volume for sound effects (BGS, SE)
  attr_accessor :setting_battleani        # Whether or not to play battle animations

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  alias mscr_systemsettings_gamesystem_initialize initialize
  def initialize
    mscr_systemsettings_gamesystem_initialize
    check_settings_file
  end

  #--------------------------------------------------------------------------
  # * check_settings_file
  #--------------------------------------------------------------------------
  def check_settings_file
    if File.exists?("./settings.ini")
      #puts "settings file DOES exist! Reading..."
      File.open("./settings.ini").each do |line|
        case line
        when /(music=\d+)/i
          @setting_music = ($1.to_f / 100)
        when /(sound=\d+)/i
          @setting_sfx = ($1.to_f / 100)
        when /(battleani=(on|off))/i
          case line
          when /(battleani=on)/i
            @setting_battleani = true
          when /(battleani=off)/i
            @setting_battleani = false
          end
        end
      end
    else
      #puts "settings file does NOT exist! Creating settings file with default values..."
      reset_settings
    end
  end

  #--------------------------------------------------------------------------
  # * reset_settings
  #--------------------------------------------------------------------------
  def reset_settings
    @setting_music = MSCR::SYS::SETTING_MUSIC
    @setting_sfx = MSCR::SYS::SETTING_SFX
    @setting_battleani = MSCR::SYS::SETTING_BATTLEANI
  end

end #Game_System

#██████╗ ██████╗  ██████╗       ██████╗  ██████╗ ███╗   ███╗
#██╔══██╗██╔══██╗██╔════╝ ██╗██╗██╔══██╗██╔════╝ ████╗ ████║
#██████╔╝██████╔╝██║  ███╗╚═╝╚═╝██████╔╝██║  ███╗██╔████╔██║
#██╔══██╗██╔═══╝ ██║   ██║██╗██╗██╔══██╗██║   ██║██║╚██╔╝██║
#██║  ██║██║     ╚██████╔╝╚═╝╚═╝██████╔╝╚██████╔╝██║ ╚═╝ ██║
#╚═╝  ╚═╝╚═╝      ╚═════╝       ╚═════╝  ╚═════╝ ╚═╝     ╚═╝
class RPG::BGM < RPG::AudioFile
  
  #--------------------------------------------------------------------------
  # overwrite method: play
  #--------------------------------------------------------------------------
  def play(pos = 0)
    if @name.empty?
      Audio.bgm_stop
      @@last = RPG::BGM.new
    else
      volume = @volume
      volume *= $game_system.setting_music unless $game_system.nil?
      Audio.bgm_play('Audio/BGM/' + @name, volume, @pitch, pos)
      @@last = self.clone
    end
  end
  
end #RPG::BGM

#██████╗ ██████╗  ██████╗       ███╗   ███╗███████╗
#██╔══██╗██╔══██╗██╔════╝ ██╗██╗████╗ ████║██╔════╝
#██████╔╝██████╔╝██║  ███╗╚═╝╚═╝██╔████╔██║█████╗  
#██╔══██╗██╔═══╝ ██║   ██║██╗██╗██║╚██╔╝██║██╔══╝  
#██║  ██║██║     ╚██████╔╝╚═╝╚═╝██║ ╚═╝ ██║███████╗
#╚═╝  ╚═╝╚═╝      ╚═════╝       ╚═╝     ╚═╝╚══════╝
class RPG::ME < RPG::AudioFile
  
  #--------------------------------------------------------------------------
  # overwrite method: play
  #--------------------------------------------------------------------------
  def play
    if @name.empty?
      Audio.me_stop
    else
      volume = @volume
      volume *= $game_system.setting_music unless $game_system.nil?
      Audio.me_play('Audio/ME/' + @name, volume, @pitch)
    end
  end
  
end #RPG::ME

#██████╗ ██████╗  ██████╗       ██████╗  ██████╗ ███████╗
#██╔══██╗██╔══██╗██╔════╝ ██╗██╗██╔══██╗██╔════╝ ██╔════╝
#██████╔╝██████╔╝██║  ███╗╚═╝╚═╝██████╔╝██║  ███╗███████╗
#██╔══██╗██╔═══╝ ██║   ██║██╗██╗██╔══██╗██║   ██║╚════██║
#██║  ██║██║     ╚██████╔╝╚═╝╚═╝██████╔╝╚██████╔╝███████║
#╚═╝  ╚═╝╚═╝      ╚═════╝       ╚═════╝  ╚═════╝ ╚══════╝
class RPG::BGS < RPG::AudioFile
  
  #--------------------------------------------------------------------------
  # overwrite method: play
  #--------------------------------------------------------------------------
  def play(pos = 0)
    if @name.empty?
      Audio.bgs_stop
      @@last = RPG::BGS.new
    else
      volume = @volume
      volume *= $game_system.setting_sfx unless $game_system.nil?
      Audio.bgs_play('Audio/BGS/' + @name, volume, @pitch, pos)
      @@last = self.clone
    end
  end
  
end #RPG::BGS

#██████╗ ██████╗  ██████╗       ███████╗███████╗
#██╔══██╗██╔══██╗██╔════╝ ██╗██╗██╔════╝██╔════╝
#██████╔╝██████╔╝██║  ███╗╚═╝╚═╝███████╗█████╗  
#██╔══██╗██╔═══╝ ██║   ██║██╗██╗╚════██║██╔══╝  
#██║  ██║██║     ╚██████╔╝╚═╝╚═╝███████║███████╗
#╚═╝  ╚═╝╚═╝      ╚═════╝       ╚══════╝╚══════╝
class RPG::SE < RPG::AudioFile
  
  #--------------------------------------------------------------------------
  # overwrite method: play
  #--------------------------------------------------------------------------
  def play
    unless @name.empty?
      volume = @volume
      volume *= $game_system.setting_sfx unless $game_system.nil?
      Audio.se_play('Audio/SE/' + @name, volume, @pitch)
    end
  end
  
end #RPG::SE
