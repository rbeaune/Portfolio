#██████╗ ██████╗  ██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗ █████╗
#██╔══██╗██╔══██╗██╔════╝ ████╗ ████║██║   ██║╚██╗██╔╝██╔══██╗
#██████╔╝██████╔╝██║  ███╗██╔████╔██║██║   ██║ ╚███╔╝ ███████║
#██╔══██╗██╔═══╝ ██║   ██║██║╚██╔╝██║╚██╗ ██╔╝ ██╔██╗ ██╔══██║
#██║  ██║██║     ╚██████╔╝██║ ╚═╝ ██║ ╚████╔╝ ██╔╝ ██╗██║  ██║
#╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝     ╚═╝  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝
#==============================================================================
# ** Vocab
#------------------------------------------------------------------------------
#  This module defines terms and messages. It defines some data as constant
# variables. Terms in the database are obtained from $data_system.
#==============================================================================

module Vocab

  # Shop Screen
  ShopBuy         = "Buy"
  ShopSell        = "Sell"
  ShopCancel      = "Cancel"
  Possession      = "Possession"

  # Status Screen
  ExpTotal        = "Current Exp"
  ExpNext         = "To Next %s"

  # Save/Load Screen
  SaveMessage     = "Save to which file?"
  LoadMessage     = "Load which file?"
  File            = "File"

  # Display when there are multiple members
  PartyName       = "%s's Party"

  # Basic Battle Messages
  Emerge          = "%s emerged!"
  Preemptive      = "%s got the upper hand!"
  Surprise        = "%s was surprised!"
  EscapeStart     = "%s has started to escape!"
  EscapeFailure   = "However, it was unable to escape!"

  # Battle Ending Messages
  Victory         = "%s was victorious!"
  Defeat          = "%s was defeated."
  ObtainExp       = "%s EXP received!"
  ObtainGold      = "%s\\G found!"
  ObtainItem      = "%s found!"
  LevelUp         = "%s is now %s %s!"
  ObtainSkill     = "%s learned!"

  # Use Item
  UseItem         = "%s uses %s!"

  # Critical Hit
  CriticalToEnemy = "An excellent hit!!"
  CriticalToActor = "A painful blow!!"

  # Results for Actions on Actors
  ActorDamage     = "%s took %s damage!"
  ActorRecovery   = "%s recovered %s %s!"
  ActorGain       = "%s gained %s %s!"
  ActorLoss       = "%s lost %s %s!"
  ActorDrain      = "%s was drained of %s %s!"
  ActorNoDamage   = "%s took no damage!"
  ActorNoHit      = "Miss! %s took no damage!"

  # Results for Actions on Enemies
  EnemyDamage     = "%s took %s damage!"
  EnemyRecovery   = "%s recovered %s %s!"
  EnemyGain       = "%s gained %s %s!"
  EnemyLoss       = "%s lost %s %s!"
  EnemyDrain      = "Drained %s %s from %s!"
  EnemyNoDamage   = "%s took no damage!"
  EnemyNoHit      = "Missed! %s took no damage!"

  # Evasion/Reflection
  Evasion         = "%s evaded the attack!"
  MagicEvasion    = "%s nullified the magic!"
  MagicReflection = "%s reflected the magic!"
  CounterAttack   = "%s counterattacked!"
  Substitute      = "%s protected %s!"

  # Buff/Debuff
  BuffAdd         = "%s's %s went up!"
  DebuffAdd       = "%s's %s went down!"
  BuffRemove      = "%s's %s returned to normal."

  # Skill or Item Had No Effect
  ActionFailure   = "There was no effect on %s!"

  # Error Message
  PlayerPosError  = "Player's starting position is not set."
  EventOverflow   = "Common event calls exceeded the limit."

  # Basic Status
  def self.basic(basic_id)
    $data_system.terms.basic[basic_id]
  end

  # Parameters
  def self.param(param_id)
    $data_system.terms.params[param_id]
  end

  # Equip Type
  def self.etype(etype_id)
    $data_system.terms.etypes[etype_id]
  end

  # Commands
  def self.command(command_id)
    $data_system.terms.commands[command_id]
  end

  # Currency Unit
  def self.currency_unit
    $data_system.currency_unit
  end

  #--------------------------------------------------------------------------
  def self.level;       basic(0);     end   # Level
  def self.level_a;     basic(1);     end   # Level (short)
  def self.hp;          basic(2);     end   # HP
  def self.hp_a;        basic(3);     end   # HP (short)
  def self.mp;          basic(4);     end   # MP
  def self.mp_a;        basic(5);     end   # MP (short)
  def self.tp;          basic(6);     end   # TP
  def self.tp_a;        basic(7);     end   # TP (short)
  def self.fight;       command(0);   end   # Fight
  def self.escape;      command(1);   end   # Escape
  def self.attack;      command(2);   end   # Attack
  def self.guard;       command(3);   end   # Guard
  def self.item;        command(4);   end   # Items
  def self.skill;       command(5);   end   # Skills
  def self.equip;       command(6);   end   # Equip
  def self.status;      command(7);   end   # Status
  def self.formation;   command(8);   end   # Change Formation
  def self.save;        command(9);   end   # Save
  def self.game_end;    command(10);  end   # Exit Game
  def self.weapon;      command(12);  end   # Weapons
  def self.armor;       command(13);  end   # Armor
  def self.key_item;    command(14);  end   # Key Items
  def self.equip2;      command(15);  end   # Change Equipment
  def self.optimize;    command(16);  end   # Ultimate Equipment
  def self.clear;       command(17);  end   # Remove All
  def self.new_game;    command(18);  end   # New Game
  def self.continue;    command(19);  end   # Continue
  def self.shutdown;    command(20);  end   # Shut Down
  def self.to_title;    command(21);  end   # Go to Title
  def self.cancel;      command(22);  end   # Cancel
  #--------------------------------------------------------------------------
end
#==============================================================================
# ** Sound
#------------------------------------------------------------------------------
#  This module plays sound effects. It obtains sound effects specified in the
# database from the global variable $data_system, and plays them.
#==============================================================================

module Sound

  # System Sound Effect
  def self.play_system_sound(n)
    $data_system.sounds[n].play
  end

  # Cursor Movement
  def self.play_cursor
    play_system_sound(0)
  end

  # Decision
  def self.play_ok
    play_system_sound(1)
  end

  # Cancel
  def self.play_cancel
    play_system_sound(2)
  end

  # Buzzer
  def self.play_buzzer
    play_system_sound(3)
  end

  # Equip
  def self.play_equip
    play_system_sound(4)
  end

  # Save
  def self.play_save
    play_system_sound(5)
  end

  # Load
  def self.play_load
    play_system_sound(6)
  end

  # Battle Start
  def self.play_battle_start
    play_system_sound(7)
  end

  # Escape
  def self.play_escape
    play_system_sound(8)
  end

  # Enemy Attack
  def self.play_enemy_attack
    play_system_sound(9)
  end

  # Enemy Damage
  def self.play_enemy_damage
    play_system_sound(10)
  end

  # Enemy Collapse
  def self.play_enemy_collapse
    play_system_sound(11)
  end

  # Boss Collapse 1
  def self.play_boss_collapse1
    play_system_sound(12)
  end

  # Boss Collapse 2
  def self.play_boss_collapse2
    play_system_sound(13)
  end

  # Actor Damage
  def self.play_actor_damage
    play_system_sound(14)
  end

  # Actor Collapse
  def self.play_actor_collapse
    play_system_sound(15)
  end

  # Recovery
  def self.play_recovery
    play_system_sound(16)
  end

  # Miss
  def self.play_miss
    play_system_sound(17)
  end

  # Evasion
  def self.play_evasion
    play_system_sound(18)
  end

  # Magic Evasion
  def self.play_magic_evasion
    play_system_sound(19)
  end

  # Magic Reflection
  def self.play_reflection
    play_system_sound(20)
  end

  # Shop
  def self.play_shop
    play_system_sound(21)
  end

  # Use Item
  def self.play_use_item
    play_system_sound(22)
  end

  # Use Skill
  def self.play_use_skill
    play_system_sound(23)
  end

end
#==============================================================================
# ** Cache
#------------------------------------------------------------------------------
#  This module loads graphics, creates bitmap objects, and retains them.
# To speed up load times and conserve memory, this module holds the
# created bitmap object in the internal hash, allowing the program to
# return preexisting objects when the same bitmap is requested again.
#==============================================================================

module Cache
  #--------------------------------------------------------------------------
  # * Get Animation Graphic
  #--------------------------------------------------------------------------
  def self.animation(filename, hue)
    load_bitmap("Graphics/Animations/", filename, hue)
  end
  #--------------------------------------------------------------------------
  # * Get Battle Background (Floor) Graphic
  #--------------------------------------------------------------------------
  def self.battleback1(filename)
    load_bitmap("Graphics/Battlebacks1/", filename)
  end
  #--------------------------------------------------------------------------
  # * Get Battle Background (Wall) Graphic
  #--------------------------------------------------------------------------
  def self.battleback2(filename)
    load_bitmap("Graphics/Battlebacks2/", filename)
  end
  #--------------------------------------------------------------------------
  # * Get Battle Graphic
  #--------------------------------------------------------------------------
  def self.battler(filename, hue)
    load_bitmap("Graphics/Battlers/", filename, hue)
  end
  #--------------------------------------------------------------------------
  # * Get Character Graphic
  #--------------------------------------------------------------------------
  def self.character(filename)
    load_bitmap("Graphics/Characters/", filename)
  end
  #--------------------------------------------------------------------------
  # * Get Face Graphic
  #--------------------------------------------------------------------------
  def self.face(filename)
    load_bitmap("Graphics/Faces/", filename)
  end
  #--------------------------------------------------------------------------
  # * Get Parallax Background Graphic
  #--------------------------------------------------------------------------
  def self.parallax(filename)
    load_bitmap("Graphics/Parallaxes/", filename)
  end
  #--------------------------------------------------------------------------
  # * Get Picture Graphic
  #--------------------------------------------------------------------------
  def self.picture(filename)
    load_bitmap("Graphics/Pictures/", filename)
  end
  #--------------------------------------------------------------------------
  # * Get System Graphic
  #--------------------------------------------------------------------------
  def self.system(filename)
    load_bitmap("Graphics/System/", filename)
  end
  #--------------------------------------------------------------------------
  # * Get Tileset Graphic
  #--------------------------------------------------------------------------
  def self.tileset(filename)
    load_bitmap("Graphics/Tilesets/", filename)
  end
  #--------------------------------------------------------------------------
  # * Get Title (Background) Graphic
  #--------------------------------------------------------------------------
  def self.title1(filename)
    load_bitmap("Graphics/Titles1/", filename)
  end
  #--------------------------------------------------------------------------
  # * Get Title (Frame) Graphic
  #--------------------------------------------------------------------------
  def self.title2(filename)
    load_bitmap("Graphics/Titles2/", filename)
  end
  #--------------------------------------------------------------------------
  # * Load Bitmap
  #--------------------------------------------------------------------------
  def self.load_bitmap(folder_name, filename, hue = 0)
    @cache ||= {}
    if filename.empty?
      empty_bitmap
    elsif hue == 0
      normal_bitmap(folder_name + filename)
    else
      hue_changed_bitmap(folder_name + filename, hue)
    end
  end
  #--------------------------------------------------------------------------
  # * Create Empty Bitmap
  #--------------------------------------------------------------------------
  def self.empty_bitmap
    Bitmap.new(32, 32)
  end
  #--------------------------------------------------------------------------
  # * Create/Get Normal Bitmap
  #--------------------------------------------------------------------------
  def self.normal_bitmap(path)
    @cache[path] = Bitmap.new(path) unless include?(path)
    @cache[path]
  end
  #--------------------------------------------------------------------------
  # * Create/Get Hue-Changed Bitmap
  #--------------------------------------------------------------------------
  def self.hue_changed_bitmap(path, hue)
    key = [path, hue]
    unless include?(key)
      @cache[key] = normal_bitmap(path).clone
      @cache[key].hue_change(hue)
    end
    @cache[key]
  end
  #--------------------------------------------------------------------------
  # * Check Cache Existence
  #--------------------------------------------------------------------------
  def self.include?(key)
    @cache[key] && !@cache[key].disposed?
  end
  #--------------------------------------------------------------------------
  # * Clear Cache
  #--------------------------------------------------------------------------
  def self.clear
    @cache ||= {}
    @cache.clear
    GC.start
  end
end
#==============================================================================
# ** DataManager
#------------------------------------------------------------------------------
#  This module manages the database and game objects. Almost all of the
# global variables used by the game are initialized by this module.
#==============================================================================

module DataManager
  #--------------------------------------------------------------------------
  # * Module Instance Variables
  #--------------------------------------------------------------------------
  @last_savefile_index = 0                # most recently accessed file
  #--------------------------------------------------------------------------
  # * Initialize Module
  #--------------------------------------------------------------------------
  def self.init
    @last_savefile_index = 0
    load_database
    create_game_objects
    setup_battle_test if $BTEST
  end
  #--------------------------------------------------------------------------
  # * Load Database
  #--------------------------------------------------------------------------
  def self.load_database
    if $BTEST
      load_battle_test_database
    else
      load_normal_database
      check_player_location
    end
  end
  #--------------------------------------------------------------------------
  # * Load Normal Database
  #--------------------------------------------------------------------------
  def self.load_normal_database
    $data_actors        = load_data("Data/Actors.rvdata2")
    $data_classes       = load_data("Data/Classes.rvdata2")
    $data_skills        = load_data("Data/Skills.rvdata2")
    $data_items         = load_data("Data/Items.rvdata2")
    $data_weapons       = load_data("Data/Weapons.rvdata2")
    $data_armors        = load_data("Data/Armors.rvdata2")
    $data_enemies       = load_data("Data/Enemies.rvdata2")
    $data_troops        = load_data("Data/Troops.rvdata2")
    $data_states        = load_data("Data/States.rvdata2")
    $data_animations    = load_data("Data/Animations.rvdata2")
    $data_tilesets      = load_data("Data/Tilesets.rvdata2")
    $data_common_events = load_data("Data/CommonEvents.rvdata2")
    $data_system        = load_data("Data/System.rvdata2")
    $data_mapinfos      = load_data("Data/MapInfos.rvdata2")
  end
  #--------------------------------------------------------------------------
  # * Load Battle Test Database
  #--------------------------------------------------------------------------
  def self.load_battle_test_database
    $data_actors        = load_data("Data/BT_Actors.rvdata2")
    $data_classes       = load_data("Data/BT_Classes.rvdata2")
    $data_skills        = load_data("Data/BT_Skills.rvdata2")
    $data_items         = load_data("Data/BT_Items.rvdata2")
    $data_weapons       = load_data("Data/BT_Weapons.rvdata2")
    $data_armors        = load_data("Data/BT_Armors.rvdata2")
    $data_enemies       = load_data("Data/BT_Enemies.rvdata2")
    $data_troops        = load_data("Data/BT_Troops.rvdata2")
    $data_states        = load_data("Data/BT_States.rvdata2")
    $data_animations    = load_data("Data/BT_Animations.rvdata2")
    $data_tilesets      = load_data("Data/BT_Tilesets.rvdata2")
    $data_common_events = load_data("Data/BT_CommonEvents.rvdata2")
    $data_system        = load_data("Data/BT_System.rvdata2")
  end
  #--------------------------------------------------------------------------
  # * Check Player Start Location Existence
  #--------------------------------------------------------------------------
  def self.check_player_location
    if $data_system.start_map_id == 0
      msgbox(Vocab::PlayerPosError)
      exit
    end
  end
  #--------------------------------------------------------------------------
  # * Create Game Objects
  #--------------------------------------------------------------------------
  def self.create_game_objects
    $game_temp          = Game_Temp.new
    $game_system        = Game_System.new
    $game_timer         = Game_Timer.new
    $game_message       = Game_Message.new
    $game_switches      = Game_Switches.new
    $game_variables     = Game_Variables.new
    $game_self_switches = Game_SelfSwitches.new
    $game_actors        = Game_Actors.new
    $game_party         = Game_Party.new
    $game_troop         = Game_Troop.new
    $game_map           = Game_Map.new
    $game_player        = Game_Player.new
  end
  #--------------------------------------------------------------------------
  # * Set Up New Game
  #--------------------------------------------------------------------------
  def self.setup_new_game
    create_game_objects
    $game_party.setup_starting_members
    $game_map.setup($data_system.start_map_id)
    $game_player.moveto($data_system.start_x, $data_system.start_y)
    $game_player.refresh
    Graphics.frame_count = 0
  end
  #--------------------------------------------------------------------------
  # * Set Up Battle Test
  #--------------------------------------------------------------------------
  def self.setup_battle_test
    $game_party.setup_battle_test
    BattleManager.setup($data_system.test_troop_id)
    BattleManager.play_battle_bgm
  end
  #--------------------------------------------------------------------------
  # * Determine Existence of Save File
  #--------------------------------------------------------------------------
  def self.save_file_exists?
    !Dir.glob('Save*.rvdata2').empty?
  end
  #--------------------------------------------------------------------------
  # * Maximum Number of Save Files
  #--------------------------------------------------------------------------
  def self.savefile_max
    return 16
  end
  #--------------------------------------------------------------------------
  # * Create Filename
  #     index : File Index
  #--------------------------------------------------------------------------
  def self.make_filename(index)
    sprintf("Save%02d.rvdata2", index + 1)
  end
  #--------------------------------------------------------------------------
  # * Execute Save
  #--------------------------------------------------------------------------
  def self.save_game(index)
    begin
      save_game_without_rescue(index)
    rescue
      delete_save_file(index)
      false
    end
  end
  #--------------------------------------------------------------------------
  # * Execute Load
  #--------------------------------------------------------------------------
  def self.load_game(index)
    load_game_without_rescue(index) rescue false
  end
  #--------------------------------------------------------------------------
  # * Load Save Header
  #--------------------------------------------------------------------------
  def self.load_header(index)
    load_header_without_rescue(index) rescue nil
  end
  #--------------------------------------------------------------------------
  # * Execute Save (No Exception Processing)
  #--------------------------------------------------------------------------
  def self.save_game_without_rescue(index)
    File.open(make_filename(index), "wb") do |file|
      $game_system.on_before_save
      Marshal.dump(make_save_header, file)
      Marshal.dump(make_save_contents, file)
      @last_savefile_index = index
    end
    return true
  end
  #--------------------------------------------------------------------------
  # * Execute Load (No Exception Processing)
  #--------------------------------------------------------------------------
  def self.load_game_without_rescue(index)
    File.open(make_filename(index), "rb") do |file|
      Marshal.load(file)
      extract_save_contents(Marshal.load(file))
      reload_map_if_updated
      @last_savefile_index = index
    end
    return true
  end
  #--------------------------------------------------------------------------
  # * Load Save Header (No Exception Processing)
  #--------------------------------------------------------------------------
  def self.load_header_without_rescue(index)
    File.open(make_filename(index), "rb") do |file|
      return Marshal.load(file)
    end
    return nil
  end
  #--------------------------------------------------------------------------
  # * Delete Save File
  #--------------------------------------------------------------------------
  def self.delete_save_file(index)
    File.delete(make_filename(index)) rescue nil
  end
  #--------------------------------------------------------------------------
  # * Create Save Header
  #--------------------------------------------------------------------------
  def self.make_save_header
    header = {}
    header[:characters] = $game_party.characters_for_savefile
    header[:playtime_s] = $game_system.playtime_s
    header
  end
  #--------------------------------------------------------------------------
  # * Create Save Contents
  #--------------------------------------------------------------------------
  def self.make_save_contents
    contents = {}
    contents[:system]        = $game_system
    contents[:timer]         = $game_timer
    contents[:message]       = $game_message
    contents[:switches]      = $game_switches
    contents[:variables]     = $game_variables
    contents[:self_switches] = $game_self_switches
    contents[:actors]        = $game_actors
    contents[:party]         = $game_party
    contents[:troop]         = $game_troop
    contents[:map]           = $game_map
    contents[:player]        = $game_player
    contents
  end
  #--------------------------------------------------------------------------
  # * Extract Save Contents
  #--------------------------------------------------------------------------
  def self.extract_save_contents(contents)
    $game_system        = contents[:system]
    $game_timer         = contents[:timer]
    $game_message       = contents[:message]
    $game_switches      = contents[:switches]
    $game_variables     = contents[:variables]
    $game_self_switches = contents[:self_switches]
    $game_actors        = contents[:actors]
    $game_party         = contents[:party]
    $game_troop         = contents[:troop]
    $game_map           = contents[:map]
    $game_player        = contents[:player]
  end
  #--------------------------------------------------------------------------
  # * Reload Map if Data Is Updated
  #--------------------------------------------------------------------------
  def self.reload_map_if_updated
    if $game_system.version_id != $data_system.version_id
      $game_map.setup($game_map.map_id)
      $game_player.center($game_player.x, $game_player.y)
      $game_player.make_encounter_count
    end
  end
  #--------------------------------------------------------------------------
  # * Get Update Date of Save File
  #--------------------------------------------------------------------------
  def self.savefile_time_stamp(index)
    File.mtime(make_filename(index)) rescue Time.at(0)
  end
  #--------------------------------------------------------------------------
  # * Get File Index with Latest Update Date
  #--------------------------------------------------------------------------
  def self.latest_savefile_index
    savefile_max.times.max_by {|i| savefile_time_stamp(i) }
  end
  #--------------------------------------------------------------------------
  # * Get Index of File Most Recently Accessed
  #--------------------------------------------------------------------------
  def self.last_savefile_index
    @last_savefile_index
  end
end
#==============================================================================
# ** SceneManager
#------------------------------------------------------------------------------
#  This module manages scene transitions. For example, it can handle
# hierarchical structures such as calling the item screen from the main menu
# or returning from the item screen to the main menu.
#==============================================================================

module SceneManager
  #--------------------------------------------------------------------------
  # * Module Instance Variables
  #--------------------------------------------------------------------------
  @scene = nil                            # current scene object
  @stack = []                             # stack for hierarchical transitions
  @background_bitmap = nil                # background bitmap
  #--------------------------------------------------------------------------
  # * Execute
  #--------------------------------------------------------------------------
  def self.run
    DataManager.init
    Audio.setup_midi if use_midi?
    @scene = first_scene_class.new
    @scene.main while @scene
  end
  #--------------------------------------------------------------------------
  # * Get First Scene Class
  #--------------------------------------------------------------------------
  def self.first_scene_class
    $BTEST ? Scene_Battle : Scene_Title
  end
  #--------------------------------------------------------------------------
  # * Use MIDI?
  #--------------------------------------------------------------------------
  def self.use_midi?
    $data_system.opt_use_midi
  end
  #--------------------------------------------------------------------------
  # * Get Current Scene
  #--------------------------------------------------------------------------
  def self.scene
    @scene
  end
  #--------------------------------------------------------------------------
  # * Determine Current Scene Class
  #--------------------------------------------------------------------------
  def self.scene_is?(scene_class)
    @scene.instance_of?(scene_class)
  end
  #--------------------------------------------------------------------------
  # * Direct Transition
  #--------------------------------------------------------------------------
  def self.goto(scene_class)
    @scene = scene_class.new
  end
  #--------------------------------------------------------------------------
  # * Call
  #--------------------------------------------------------------------------
  def self.call(scene_class)
    @stack.push(@scene)
    @scene = scene_class.new
  end
  #--------------------------------------------------------------------------
  # * Return to Caller
  #--------------------------------------------------------------------------
  def self.return
    @scene = @stack.pop
  end
  #--------------------------------------------------------------------------
  # * Clear Call Stack
  #--------------------------------------------------------------------------
  def self.clear
    @stack.clear
  end
  #--------------------------------------------------------------------------
  # * Exit Game
  #--------------------------------------------------------------------------
  def self.exit
    @scene = nil
  end
  #--------------------------------------------------------------------------
  # * Create Snapshot to Use as Background
  #--------------------------------------------------------------------------
  def self.snapshot_for_background
    @background_bitmap.dispose if @background_bitmap
    @background_bitmap = Graphics.snap_to_bitmap
    @background_bitmap.blur
  end
  #--------------------------------------------------------------------------
  # * Get Background Bitmap
  #--------------------------------------------------------------------------
  def self.background_bitmap
    @background_bitmap
  end
end
#==============================================================================
# ** BattleManager
#------------------------------------------------------------------------------
#  This module manages battle progress.
#==============================================================================

module BattleManager
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def self.setup(troop_id, can_escape = true, can_lose = false)
    init_members
    $game_troop.setup(troop_id)
    @can_escape = can_escape
    @can_lose = can_lose
    make_escape_ratio
  end
  #--------------------------------------------------------------------------
  # * Initialize Member Variables
  #--------------------------------------------------------------------------
  def self.init_members
    @phase = :init              # Battle Progress Phase
    @can_escape = false         # Can Escape Flag
    @can_lose = false           # Can Lose Flag
    @event_proc = nil           # Event Callback
    @preemptive = false         # Preemptive Attack Flag
    @surprise = false           # Surprise Flag
    @actor_index = -1           # Actor for Which Command Is Being Entered
    @action_forced = nil        # Force Action
    @map_bgm = nil              # For Memorizing Pre-Battle BGM
    @map_bgs = nil              # For Memorizing Pre-Battle BGS
    @action_battlers = []       # Action Order List
  end
  #--------------------------------------------------------------------------
  # * Processing at Encounter Time
  #--------------------------------------------------------------------------
  def self.on_encounter
    @preemptive = (rand < rate_preemptive)
    @surprise = (rand < rate_surprise && !@preemptive)
  end
  #--------------------------------------------------------------------------
  # * Get Probability of Preemptive Attack
  #--------------------------------------------------------------------------
  def self.rate_preemptive
    $game_party.rate_preemptive($game_troop.agi)
  end
  #--------------------------------------------------------------------------
  # * Get Probability of Surprise
  #--------------------------------------------------------------------------
  def self.rate_surprise
    $game_party.rate_surprise($game_troop.agi)
  end
  #--------------------------------------------------------------------------
  # * Save BGM and BGS
  #--------------------------------------------------------------------------
  def self.save_bgm_and_bgs
    @map_bgm = RPG::BGM.last
    @map_bgs = RPG::BGS.last
  end
  #--------------------------------------------------------------------------
  # * Play Battle BGM
  #--------------------------------------------------------------------------
  def self.play_battle_bgm
    $game_system.battle_bgm.play
    RPG::BGS.stop
  end
  #--------------------------------------------------------------------------
  # * Play Battle End ME
  #--------------------------------------------------------------------------
  def self.play_battle_end_me
    $game_system.battle_end_me.play
  end
  #--------------------------------------------------------------------------
  # * Resume BGM and BGS
  #--------------------------------------------------------------------------
  def self.replay_bgm_and_bgs
    @map_bgm.replay unless $BTEST
    @map_bgs.replay unless $BTEST
  end
  #--------------------------------------------------------------------------
  # * Create Escape Success Probability
  #--------------------------------------------------------------------------
  def self.make_escape_ratio
    @escape_ratio = 1.5 - 1.0 * $game_troop.agi / $game_party.agi
  end
  #--------------------------------------------------------------------------
  # * Determine if Turn Is Executing
  #--------------------------------------------------------------------------
  def self.in_turn?
    @phase == :turn
  end
  #--------------------------------------------------------------------------
  # * Determine if Turn Is Ending
  #--------------------------------------------------------------------------
  def self.turn_end?
    @phase == :turn_end
  end
  #--------------------------------------------------------------------------
  # * Determine if Battle Is Aborting
  #--------------------------------------------------------------------------
  def self.aborting?
    @phase == :aborting
  end
  #--------------------------------------------------------------------------
  # * Get Whether Escape Is Possible
  #--------------------------------------------------------------------------
  def self.can_escape?
    @can_escape
  end
  #--------------------------------------------------------------------------
  # * Get Actor for Which Command Is Being Entered
  #--------------------------------------------------------------------------
  def self.actor
    @actor_index >= 0 ? $game_party.members[@actor_index] : nil
  end
  #--------------------------------------------------------------------------
  # * Clear Actor for Which Command Is Being Entered
  #--------------------------------------------------------------------------
  def self.clear_actor
    @actor_index = -1
  end
  #--------------------------------------------------------------------------
  # * To Next Command Input
  #--------------------------------------------------------------------------
  def self.next_command
    begin
      if !actor || !actor.next_command
        @actor_index += 1
        return false if @actor_index >= $game_party.members.size
      end
    end until actor.inputable?
    return true
  end
  #--------------------------------------------------------------------------
  # * To Previous Command Input
  #--------------------------------------------------------------------------
  def self.prior_command
    begin
      if !actor || !actor.prior_command
        @actor_index -= 1
        return false if @actor_index < 0
      end
    end until actor.inputable?
    return true
  end
  #--------------------------------------------------------------------------
  # * Set Proc for Callback to Event
  #--------------------------------------------------------------------------
  def self.event_proc=(proc)
    @event_proc = proc
  end
  #--------------------------------------------------------------------------
  # * Set Wait Method
  #--------------------------------------------------------------------------
  def self.method_wait_for_message=(method)
    @method_wait_for_message = method
  end
  #--------------------------------------------------------------------------
  # * Wait Until Message Display has Finished
  #--------------------------------------------------------------------------
  def self.wait_for_message
    @method_wait_for_message.call if @method_wait_for_message
  end
  #--------------------------------------------------------------------------
  # * Battle Start
  #--------------------------------------------------------------------------
  def self.battle_start
    $game_system.battle_count += 1
    $game_party.on_battle_start
    $game_troop.on_battle_start
    $game_troop.enemy_names.each do |name|
      $game_message.add(sprintf(Vocab::Emerge, name))
    end
    if @preemptive
      $game_message.add(sprintf(Vocab::Preemptive, $game_party.name))
    elsif @surprise
      $game_message.add(sprintf(Vocab::Surprise, $game_party.name))
    end
    wait_for_message
  end
  #--------------------------------------------------------------------------
  # * Battle Abort
  #--------------------------------------------------------------------------
  def self.abort
    @phase = :aborting
  end
  #--------------------------------------------------------------------------
  # * Determine Win/Loss Results
  #--------------------------------------------------------------------------
  def self.judge_win_loss
    if @phase
      return process_abort   if $game_party.members.empty?
      return process_defeat  if $game_party.all_dead?
      return process_victory if $game_troop.all_dead?
      return process_abort   if aborting?
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Victory Processing
  #--------------------------------------------------------------------------
  def self.process_victory
    play_battle_end_me
    replay_bgm_and_bgs
    $game_message.add(sprintf(Vocab::Victory, $game_party.name))
    display_exp
    gain_gold
    gain_drop_items
    gain_exp
    SceneManager.return
    battle_end(0)
    return true
  end
  #--------------------------------------------------------------------------
  # * Escape Processing
  #--------------------------------------------------------------------------
  def self.process_escape
    $game_message.add(sprintf(Vocab::EscapeStart, $game_party.name))
    success = @preemptive ? true : (rand < @escape_ratio)
    Sound.play_escape
    if success
      process_abort
    else
      @escape_ratio += 0.1
      $game_message.add('\.' + Vocab::EscapeFailure)
      $game_party.clear_actions
    end
    wait_for_message
    return success
  end
  #--------------------------------------------------------------------------
  # * Abort Processing
  #--------------------------------------------------------------------------
  def self.process_abort
    replay_bgm_and_bgs
    SceneManager.return
    battle_end(1)
    return true
  end
  #--------------------------------------------------------------------------
  # * Defeat Processing
  #--------------------------------------------------------------------------
  def self.process_defeat
    $game_message.add(sprintf(Vocab::Defeat, $game_party.name))
    wait_for_message
    if @can_lose
      revive_battle_members
      replay_bgm_and_bgs
      SceneManager.return
    else
      SceneManager.goto(Scene_Gameover)
    end
    battle_end(2)
    return true
  end
  #--------------------------------------------------------------------------
  # * Revive Battle Members (When Defeated)
  #--------------------------------------------------------------------------
  def self.revive_battle_members
    $game_party.battle_members.each do |actor|
      actor.hp = 1 if actor.dead?
    end
  end
  #--------------------------------------------------------------------------
  # * End Battle
  #     result : Result (0: Win 1: Escape 2: Lose)
  #--------------------------------------------------------------------------
  def self.battle_end(result)
    @phase = nil
    @event_proc.call(result) if @event_proc
    $game_party.on_battle_end
    $game_troop.on_battle_end
    SceneManager.exit if $BTEST
  end
  #--------------------------------------------------------------------------
  # * Start Command Input
  #--------------------------------------------------------------------------
  def self.input_start
    if @phase != :input
      @phase = :input
      $game_party.make_actions
      $game_troop.make_actions
      clear_actor
    end
    return !@surprise && $game_party.inputable?
  end
  #--------------------------------------------------------------------------
  # * Start Turn
  #--------------------------------------------------------------------------
  def self.turn_start
    @phase = :turn
    clear_actor
    $game_troop.increase_turn
    make_action_orders
  end
  #--------------------------------------------------------------------------
  # * End Turn
  #--------------------------------------------------------------------------
  def self.turn_end
    @phase = :turn_end
    @preemptive = false
    @surprise = false
  end
  #--------------------------------------------------------------------------
  # * Display EXP Earned
  #--------------------------------------------------------------------------
  def self.display_exp
    if $game_troop.exp_total > 0
      text = sprintf(Vocab::ObtainExp, $game_troop.exp_total)
      $game_message.add('\.' + text)
    end
  end
  #--------------------------------------------------------------------------
  # * Gold Acquisition and Display
  #--------------------------------------------------------------------------
  def self.gain_gold
    if $game_troop.gold_total > 0
      text = sprintf(Vocab::ObtainGold, $game_troop.gold_total)
      $game_message.add('\.' + text)
      $game_party.gain_gold($game_troop.gold_total)
    end
    wait_for_message
  end
  #--------------------------------------------------------------------------
  # * Dropped Item Acquisition and Display
  #--------------------------------------------------------------------------
  def self.gain_drop_items
    $game_troop.make_drop_items.each do |item|
      $game_party.gain_item(item, 1)
      $game_message.add(sprintf(Vocab::ObtainItem, item.name))
    end
    wait_for_message
  end
  #--------------------------------------------------------------------------
  # * EXP Acquisition and Level Up Display
  #--------------------------------------------------------------------------
  def self.gain_exp
    $game_party.all_members.each do |actor|
      actor.gain_exp($game_troop.exp_total)
    end
    wait_for_message
  end
  #--------------------------------------------------------------------------
  # * Create Action Order
  #--------------------------------------------------------------------------
  def self.make_action_orders
    @action_battlers = []
    @action_battlers += $game_party.members unless @surprise
    @action_battlers += $game_troop.members unless @preemptive
    @action_battlers.each {|battler| battler.make_speed }
    @action_battlers.sort! {|a,b| b.speed - a.speed }
  end
  #--------------------------------------------------------------------------
  # * Force Action
  #--------------------------------------------------------------------------
  def self.force_action(battler)
    @action_forced = battler
    @action_battlers.delete(battler)
  end
  #--------------------------------------------------------------------------
  # * Get Forced State of Battle Action
  #--------------------------------------------------------------------------
  def self.action_forced?
    @action_forced != nil
  end
  #--------------------------------------------------------------------------
  # * Get Battler Subjected to Forced Action
  #--------------------------------------------------------------------------
  def self.action_forced_battler
    @action_forced
  end
  #--------------------------------------------------------------------------
  # * Clear Forcing of Battle Action
  #--------------------------------------------------------------------------
  def self.clear_action_force
    @action_forced = nil
  end
  #--------------------------------------------------------------------------
  # * Get Next Action Subject
  #    Get the battler from the beginning of the action order list.
  #    If an actor not currently in the party is obtained (occurs when index
  #    is nil, immediately after escaping in battle events etc.), skip them.
  #--------------------------------------------------------------------------
  def self.next_subject
    loop do
      battler = @action_battlers.shift
      return nil unless battler
      next unless battler.index && battler.alive?
      return battler
    end
  end
end
#==============================================================================
# ** Game_Temp
#------------------------------------------------------------------------------
#  This class handles temporary data that is not included with save data.
# The instance of this class is referenced by $game_temp.
#==============================================================================

class Game_Temp
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :common_event_id          # Common Event ID
  attr_accessor :fade_type                # Fade Type at Player Transfer
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @common_event_id = 0
    @fade_type = 0
  end
  #--------------------------------------------------------------------------
  # * Reserve Common Event Call
  #--------------------------------------------------------------------------
  def reserve_common_event(common_event_id)
    @common_event_id = common_event_id
  end
  #--------------------------------------------------------------------------
  # * Clear Common Event Call Reservation
  #--------------------------------------------------------------------------
  def clear_common_event
    @common_event_id = 0
  end
  #--------------------------------------------------------------------------
  # * Determine Reservation of Common Event Call
  #--------------------------------------------------------------------------
  def common_event_reserved?
    @common_event_id > 0
  end
  #--------------------------------------------------------------------------
  # * Get Reserved Common Event
  #--------------------------------------------------------------------------
  def reserved_common_event
    $data_common_events[@common_event_id]
  end
end
#==============================================================================
# ** Game_System
#------------------------------------------------------------------------------
#  This class handles system data. It saves the disable state of saving and
# menus. Instances of this class are referenced by $game_system.
#==============================================================================

class Game_System
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :save_disabled            # save forbidden
  attr_accessor :menu_disabled            # menu forbidden
  attr_accessor :encounter_disabled       # encounter forbidden
  attr_accessor :formation_disabled       # formation change forbidden
  attr_accessor :battle_count             # battle count
  attr_reader   :save_count               # save count
  attr_reader   :version_id               # game version ID
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @save_disabled = false
    @menu_disabled = false
    @encounter_disabled = false
    @formation_disabled = false
    @battle_count = 0
    @save_count = 0
    @version_id = 0
    @window_tone = nil
    @battle_bgm = nil
    @battle_end_me = nil
    @saved_bgm = nil
  end
  #--------------------------------------------------------------------------
  # * Determine if Japanese Mode
  #--------------------------------------------------------------------------
  def japanese?
    $data_system.japanese
  end
  #--------------------------------------------------------------------------
  # * Get Window Color
  #--------------------------------------------------------------------------
  def window_tone
    @window_tone || $data_system.window_tone
  end
  #--------------------------------------------------------------------------
  # * Set Window Color
  #--------------------------------------------------------------------------
  def window_tone=(window_tone)
    @window_tone = window_tone
  end
  #--------------------------------------------------------------------------
  # * Get Battle BGM
  #--------------------------------------------------------------------------
  def battle_bgm
    @battle_bgm || $data_system.battle_bgm
  end
  #--------------------------------------------------------------------------
  # * Set Battle BGM
  #--------------------------------------------------------------------------
  def battle_bgm=(battle_bgm)
    @battle_bgm = battle_bgm
  end
  #--------------------------------------------------------------------------
  # * Get Battle End ME
  #--------------------------------------------------------------------------
  def battle_end_me
    @battle_end_me || $data_system.battle_end_me
  end
  #--------------------------------------------------------------------------
  # * Set Battle End ME
  #--------------------------------------------------------------------------
  def battle_end_me=(battle_end_me)
    @battle_end_me = battle_end_me
  end
  #--------------------------------------------------------------------------
  # * Pre-Save Processing
  #--------------------------------------------------------------------------
  def on_before_save
    @save_count += 1
    @version_id = $data_system.version_id
    @frames_on_save = Graphics.frame_count
    @bgm_on_save = RPG::BGM.last
    @bgs_on_save = RPG::BGS.last
  end
  #--------------------------------------------------------------------------
  # * Post-Load Processing
  #--------------------------------------------------------------------------
  def on_after_load
    Graphics.frame_count = @frames_on_save
    @bgm_on_save.play
    @bgs_on_save.play
  end
  #--------------------------------------------------------------------------
  # * Get Play Time in Seconds
  #--------------------------------------------------------------------------
  def playtime
    Graphics.frame_count / Graphics.frame_rate
  end
  #--------------------------------------------------------------------------
  # * Get Play Time in Character String
  #--------------------------------------------------------------------------
  def playtime_s
    hour = playtime / 60 / 60
    min = playtime / 60 % 60
    sec = playtime % 60
    sprintf("%02d:%02d:%02d", hour, min, sec)
  end
  #--------------------------------------------------------------------------
  # * Save BGM
  #--------------------------------------------------------------------------
  def save_bgm
    @saved_bgm = RPG::BGM.last
  end
  #--------------------------------------------------------------------------
  # * Resume BGM
  #--------------------------------------------------------------------------
  def replay_bgm
    @saved_bgm.replay if @saved_bgm
  end
end
#==============================================================================
# ** Game_Timer
#------------------------------------------------------------------------------
#  This class handles timers. Instances of this class are referenced by
# $game_timer.
#==============================================================================

class Game_Timer
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @count = 0
    @working = false
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    if @working && @count > 0
      @count -= 1
      on_expire if @count == 0
    end
  end
  #--------------------------------------------------------------------------
  # * Start
  #--------------------------------------------------------------------------
  def start(count)
    @count = count
    @working = true
  end
  #--------------------------------------------------------------------------
  # * Stop
  #--------------------------------------------------------------------------
  def stop
    @working = false
  end
  #--------------------------------------------------------------------------
  # * Determine if Working
  #--------------------------------------------------------------------------
  def working?
    @working
  end
  #--------------------------------------------------------------------------
  # * Get Seconds
  #--------------------------------------------------------------------------
  def sec
    @count / Graphics.frame_rate
  end
  #--------------------------------------------------------------------------
  # * Processing When Timer Reaches 0
  #--------------------------------------------------------------------------
  def on_expire
    BattleManager.abort
  end
end
#==============================================================================
# ** Game_Message
#------------------------------------------------------------------------------
#  This class handles the state of the message window that displays text or
# selections, etc. The instance of this class is referenced by $game_message.
#==============================================================================

class Game_Message
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :texts                    # text array (in rows)
  attr_reader   :choices                  # choice array
  attr_accessor :face_name                # face graphic filename
  attr_accessor :face_index               # face graphic index
  attr_accessor :background               # background type
  attr_accessor :position                 # display position
  attr_accessor :choice_proc              # show choices: call back (Proc)
  attr_accessor :choice_cancel_type       # show choices: cancel
  attr_accessor :num_input_variable_id    # input number: variable ID
  attr_accessor :num_input_digits_max     # input number: digit count
  attr_accessor :item_choice_variable_id  # item selection: variable ID
  attr_accessor :scroll_mode              # scroll text flag
  attr_accessor :scroll_speed             # scroll text: speed
  attr_accessor :scroll_no_fast           # scroll text: disable fast forward
  attr_accessor :visible                  # displaying a message
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    clear
    @visible = false
  end
  #--------------------------------------------------------------------------
  # * Clear
  #--------------------------------------------------------------------------
  def clear
    @texts = []
    @choices = []
    @face_name = ""
    @face_index = 0
    @background = 0
    @position = 2
    @choice_cancel_type = 0
    @choice_proc = nil
    @num_input_variable_id = 0
    @num_input_digits_max = 0
    @item_choice_variable_id = 0
    @scroll_mode = false
    @scroll_speed = 2
    @scroll_no_fast = false
  end
  #--------------------------------------------------------------------------
  # * Add Text
  #--------------------------------------------------------------------------
  def add(text)
    @texts.push(text)
  end
  #--------------------------------------------------------------------------
  # * Determine Existence of Text
  #--------------------------------------------------------------------------
  def has_text?
    @texts.size > 0
  end
  #--------------------------------------------------------------------------
  # * Determine if Choices Mode
  #--------------------------------------------------------------------------
  def choice?
    @choices.size > 0
  end
  #--------------------------------------------------------------------------
  # * Determine if Number Input Mode
  #--------------------------------------------------------------------------
  def num_input?
    @num_input_variable_id > 0
  end
  #--------------------------------------------------------------------------
  # * Determine if Item Selection Mode
  #--------------------------------------------------------------------------
  def item_choice?
    @item_choice_variable_id > 0
  end
  #--------------------------------------------------------------------------
  # * Determine if Busy
  #--------------------------------------------------------------------------
  def busy?
    has_text? || choice? || num_input? || item_choice?
  end
  #--------------------------------------------------------------------------
  # * New Page
  #--------------------------------------------------------------------------
  def new_page
    @texts[-1] += "\f" if @texts.size > 0
  end
  #--------------------------------------------------------------------------
  # * Get All Text Including New Lines
  #--------------------------------------------------------------------------
  def all_text
    @texts.inject("") {|r, text| r += text + "\n" }
  end
end
#==============================================================================
# ** Game_Switches
#------------------------------------------------------------------------------
#  This class handles switches. It's a wrapper for the built-in class "Array."
# The instance of this class is referenced by $game_switches.
#==============================================================================

class Game_Switches
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @data = []
  end
  #--------------------------------------------------------------------------
  # * Get Switch
  #--------------------------------------------------------------------------
  def [](switch_id)
    @data[switch_id] || false
  end
  #--------------------------------------------------------------------------
  # * Set Switch
  #     value : ON (true) / OFF (false)
  #--------------------------------------------------------------------------
  def []=(switch_id, value)
    @data[switch_id] = value
    on_change
  end
  #--------------------------------------------------------------------------
  # * Processing When Setting Switches
  #--------------------------------------------------------------------------
  def on_change
    $game_map.need_refresh = true
  end
end
#==============================================================================
# ** Game_Variables
#------------------------------------------------------------------------------
#  This class handles variables. It's a wrapper for the built-in class "Array."
# The instance of this class is referenced by $game_variables.
#==============================================================================

class Game_Variables
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @data = []
  end
  #--------------------------------------------------------------------------
  # * Get Variable
  #--------------------------------------------------------------------------
  def [](variable_id)
    @data[variable_id] || 0
  end
  #--------------------------------------------------------------------------
  # * Set Variable
  #--------------------------------------------------------------------------
  def []=(variable_id, value)
    @data[variable_id] = value
    on_change
  end
  #--------------------------------------------------------------------------
  # * Processing When Setting Variables
  #--------------------------------------------------------------------------
  def on_change
    $game_map.need_refresh = true
  end
end
#==============================================================================
# ** Game_SelfSwitches
#------------------------------------------------------------------------------
#  This class handles self switches. It's a wrapper for the built-in class
# "Hash." The instance of this class is referenced by $game_self_switches.
#==============================================================================

class Game_SelfSwitches
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @data = {}
  end
  #--------------------------------------------------------------------------
  # * Get Self Switch
  #--------------------------------------------------------------------------
  def [](key)
    @data[key] == true
  end
  #--------------------------------------------------------------------------
  # * Set Self Switch
  #     value : ON (true) / OFF (false)
  #--------------------------------------------------------------------------
  def []=(key, value)
    @data[key] = value
    on_change
  end
  #--------------------------------------------------------------------------
  # * Processing When Setting Self Switches
  #--------------------------------------------------------------------------
  def on_change
    $game_map.need_refresh = true
  end
end
#==============================================================================
# ** Game_Screen
#------------------------------------------------------------------------------
#  This class handles screen maintenance data, such as changes in color tone,
# flashes, etc. It's used within the Game_Map and Game_Troop classes.
#==============================================================================

class Game_Screen
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :brightness               # brightness
  attr_reader   :tone                     # color tone
  attr_reader   :flash_color              # flash color
  attr_reader   :pictures                 # pictures
  attr_reader   :shake                    # shake positioning
  attr_reader   :weather_type             # weather type
  attr_reader   :weather_power            # weather intensity (Float)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @pictures = Game_Pictures.new
    clear
  end
  #--------------------------------------------------------------------------
  # * Clear
  #--------------------------------------------------------------------------
  def clear
    clear_fade
    clear_tone
    clear_flash
    clear_shake
    clear_weather
    clear_pictures
  end
  #--------------------------------------------------------------------------
  # * Clear Fade In/Out
  #--------------------------------------------------------------------------
  def clear_fade
    @brightness = 255
    @fadeout_duration = 0
    @fadein_duration = 0
  end
  #--------------------------------------------------------------------------
  # * Clear Color Tone
  #--------------------------------------------------------------------------
  def clear_tone
    @tone = Tone.new
    @tone_target = Tone.new
    @tone_duration = 0
  end
  #--------------------------------------------------------------------------
  # * Clear Flash
  #--------------------------------------------------------------------------
  def clear_flash
    @flash_color = Color.new
    @flash_duration = 0
  end
  #--------------------------------------------------------------------------
  # * Clear Shake
  #--------------------------------------------------------------------------
  def clear_shake
    @shake_power = 0
    @shake_speed = 0
    @shake_duration = 0
    @shake_direction = 1
    @shake = 0
  end
  #--------------------------------------------------------------------------
  # * Clear Weather
  #--------------------------------------------------------------------------
  def clear_weather
    @weather_type = :none
    @weather_power = 0
    @weather_power_target = 0
    @weather_duration = 0
  end
  #--------------------------------------------------------------------------
  # * Clear Picture
  #--------------------------------------------------------------------------
  def clear_pictures
    @pictures.each {|picture| picture.erase }
  end
  #--------------------------------------------------------------------------
  # * Start Fadeout
  #--------------------------------------------------------------------------
  def start_fadeout(duration)
    @fadeout_duration = duration
    @fadein_duration = 0
  end
  #--------------------------------------------------------------------------
  # * Start Fadein
  #--------------------------------------------------------------------------
  def start_fadein(duration)
    @fadein_duration = duration
    @fadeout_duration = 0
  end
  #--------------------------------------------------------------------------
  # * Start Changing Color Tone
  #--------------------------------------------------------------------------
  def start_tone_change(tone, duration)
    @tone_target = tone.clone
    @tone_duration = duration
    @tone = @tone_target.clone if @tone_duration == 0
  end
  #--------------------------------------------------------------------------
  # * Start Flashing
  #--------------------------------------------------------------------------
  def start_flash(color, duration)
    @flash_color = color.clone
    @flash_duration = duration
  end
  #--------------------------------------------------------------------------
  # * Start Shaking
  #     power: intensity
  #     speed: speed
  #--------------------------------------------------------------------------
  def start_shake(power, speed, duration)
    @shake_power = power
    @shake_speed = speed
    @shake_duration = duration
  end
  #--------------------------------------------------------------------------
  # * Change Weather
  #     type  : type (:none, :rain, :storm, :snow)
  #     power: intensity
  #    If weather type is none (:none), set @weather_power_target (target
  #    value of intensity) to 0 to represent gradual stopping of rain, but
  #    only in this case.
  #--------------------------------------------------------------------------
  def change_weather(type, power, duration)
    @weather_type = type if type != :none || duration == 0
    @weather_power_target = type == :none ? 0.0 : power.to_f
    @weather_duration = duration
    @weather_power = @weather_power_target if duration == 0
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_fadeout
    update_fadein
    update_tone
    update_flash
    update_shake
    update_weather
    update_pictures
  end
  #--------------------------------------------------------------------------
  # * Update Fadeout
  #--------------------------------------------------------------------------
  def update_fadeout
    if @fadeout_duration > 0
      d = @fadeout_duration
      @brightness = (@brightness * (d - 1)) / d
      @fadeout_duration -= 1
    end
  end
  #--------------------------------------------------------------------------
  # * Update Fadein
  #--------------------------------------------------------------------------
  def update_fadein
    if @fadein_duration > 0
      d = @fadein_duration
      @brightness = (@brightness * (d - 1) + 255) / d
      @fadein_duration -= 1
    end
  end
  #--------------------------------------------------------------------------
  # * Update Tone
  #--------------------------------------------------------------------------
  def update_tone
    if @tone_duration > 0
      d = @tone_duration
      @tone.red = (@tone.red * (d - 1) + @tone_target.red) / d
      @tone.green = (@tone.green * (d - 1) + @tone_target.green) / d
      @tone.blue = (@tone.blue * (d - 1) + @tone_target.blue) / d
      @tone.gray = (@tone.gray * (d - 1) + @tone_target.gray) / d
      @tone_duration -= 1
    end
  end
  #--------------------------------------------------------------------------
  # * Update Flash
  #--------------------------------------------------------------------------
  def update_flash
    if @flash_duration > 0
      d = @flash_duration
      @flash_color.alpha = @flash_color.alpha * (d - 1) / d
      @flash_duration -= 1
    end
  end
  #--------------------------------------------------------------------------
  # * Update Shake
  #--------------------------------------------------------------------------
  def update_shake
    if @shake_duration > 0 || @shake != 0
      delta = (@shake_power * @shake_speed * @shake_direction) / 10.0
      if @shake_duration <= 1 && @shake * (@shake + delta) < 0
        @shake = 0
      else
        @shake += delta
      end
      @shake_direction = -1 if @shake > @shake_power * 2
      @shake_direction = 1 if @shake < - @shake_power * 2
      @shake_duration -= 1
    end
  end
  #--------------------------------------------------------------------------
  # * Update Weather
  #--------------------------------------------------------------------------
  def update_weather
    if @weather_duration > 0
      d = @weather_duration
      @weather_power = (@weather_power * (d - 1) + @weather_power_target) / d
      @weather_duration -= 1
      if @weather_duration == 0 && @weather_power_target == 0
        @weather_type = :none
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Update Pictures
  #--------------------------------------------------------------------------
  def update_pictures
    @pictures.each {|picture| picture.update }
  end
  #--------------------------------------------------------------------------
  # * Start Flash (for Poison/Damage Floor)
  #--------------------------------------------------------------------------
  def start_flash_for_damage
    start_flash(Color.new(255,0,0,128), 8)
  end
end
#==============================================================================
# ** Game_Picture
#------------------------------------------------------------------------------
#  This class handles pictures. It is created only when a picture of a specific
# number is required internally for the Game_Pictures class.
#==============================================================================

class Game_Picture
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :number                   # picture index
  attr_reader   :name                     # filename
  attr_reader   :origin                   # starting point
  attr_reader   :x                        # x-coordinate
  attr_reader   :y                        # y-coordinate
  attr_reader   :zoom_x                   # x directional zoom rate
  attr_reader   :zoom_y                   # y directional zoom rate
  attr_reader   :opacity                  # opacity level
  attr_reader   :blend_type               # blend method
  attr_reader   :tone                     # color tone
  attr_reader   :angle                    # rotation angle
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(number)
    @number = number
    init_basic
    init_target
    init_tone
    init_rotate
  end
  #--------------------------------------------------------------------------
  # * Initialize Basic Variable
  #--------------------------------------------------------------------------
  def init_basic
    @name = ""
    @origin = @x = @y = 0
    @zoom_x = @zoom_y = 100.0
    @opacity = 255.0
    @blend_type = 1
  end
  #--------------------------------------------------------------------------
  # * Initialize Movement Target
  #--------------------------------------------------------------------------
  def init_target
    @target_x = @x
    @target_y = @y
    @target_zoom_x = @zoom_x
    @target_zoom_y = @zoom_y
    @target_opacity = @opacity
    @duration = 0
  end
  #--------------------------------------------------------------------------
  # * Initialize Color Tone
  #--------------------------------------------------------------------------
  def init_tone
    @tone = Tone.new
    @tone_target = Tone.new
    @tone_duration = 0
  end
  #--------------------------------------------------------------------------
  # * Initialize Rotation
  #--------------------------------------------------------------------------
  def init_rotate
    @angle = 0
    @rotate_speed = 0
  end
  #--------------------------------------------------------------------------
  # * Show Picture
  #--------------------------------------------------------------------------
  def show(name, origin, x, y, zoom_x, zoom_y, opacity, blend_type)
    @name = name
    @origin = origin
    @x = x.to_f
    @y = y.to_f
    @zoom_x = zoom_x.to_f
    @zoom_y = zoom_y.to_f
    @opacity = opacity.to_f
    @blend_type = blend_type
    init_target
    init_tone
    init_rotate
  end
  #--------------------------------------------------------------------------
  # * Move Picture
  #--------------------------------------------------------------------------
  def move(origin, x, y, zoom_x, zoom_y, opacity, blend_type, duration)
    @origin = origin
    @target_x = x.to_f
    @target_y = y.to_f
    @target_zoom_x = zoom_x.to_f
    @target_zoom_y = zoom_y.to_f
    @target_opacity = opacity.to_f
    @blend_type = blend_type
    @duration = duration
  end
  #--------------------------------------------------------------------------
  # * Change Rotation Speed
  #--------------------------------------------------------------------------
  def rotate(speed)
    @rotate_speed = speed
  end
  #--------------------------------------------------------------------------
  # * Start Changing Color Tone
  #--------------------------------------------------------------------------
  def start_tone_change(tone, duration)
    @tone_target = tone.clone
    @tone_duration = duration
    @tone = @tone_target.clone if @tone_duration == 0
  end
  #--------------------------------------------------------------------------
  # * Erase Picture
  #--------------------------------------------------------------------------
  def erase
    @name = ""
    @origin = 0
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_move
    update_tone_change
    update_rotate
  end
  #--------------------------------------------------------------------------
  # * Update Picture Move
  #--------------------------------------------------------------------------
  def update_move
    return if @duration == 0
    d = @duration
    @x = (@x * (d - 1) + @target_x) / d
    @y = (@y * (d - 1) + @target_y) / d
    @zoom_x  = (@zoom_x  * (d - 1) + @target_zoom_x)  / d
    @zoom_y  = (@zoom_y  * (d - 1) + @target_zoom_y)  / d
    @opacity = (@opacity * (d - 1) + @target_opacity) / d
    @duration -= 1
  end
  #--------------------------------------------------------------------------
  # * Update Color Tone Change
  #--------------------------------------------------------------------------
  def update_tone_change
    return if @tone_duration == 0
    d = @tone_duration
    @tone.red   = (@tone.red   * (d - 1) + @tone_target.red)   / d
    @tone.green = (@tone.green * (d - 1) + @tone_target.green) / d
    @tone.blue  = (@tone.blue  * (d - 1) + @tone_target.blue)  / d
    @tone.gray  = (@tone.gray  * (d - 1) + @tone_target.gray)  / d
    @tone_duration -= 1
  end
  #--------------------------------------------------------------------------
  # * Update Rotation
  #--------------------------------------------------------------------------
  def update_rotate
    return if @rotate_speed == 0
    @angle += @rotate_speed / 2.0
    @angle += 360 while @angle < 0
    @angle %= 360
  end
end
#==============================================================================
# ** Game_Pictures
#------------------------------------------------------------------------------
#  This is a wrapper for a picture array. This class is used within the
# Game_Screen class. Map screen pictures and battle screen pictures are
# handled separately.
#==============================================================================

class Game_Pictures
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @data = []
  end
  #--------------------------------------------------------------------------
  # * Get Picture
  #--------------------------------------------------------------------------
  def [](number)
    @data[number] ||= Game_Picture.new(number)
  end
  #--------------------------------------------------------------------------
  # * Iterator
  #--------------------------------------------------------------------------
  def each
    @data.compact.each {|picture| yield picture } if block_given?
  end
end
#==============================================================================
# ** Game_BaseItem
#------------------------------------------------------------------------------
#  This class uniformly handles skills, items, weapons, and armor. References
# to the database object itself are not retained to enable inclusion in save
# data.
#==============================================================================

class Game_BaseItem
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @class = nil
    @item_id = 0
  end
  #--------------------------------------------------------------------------
  # * Determine Class
  #--------------------------------------------------------------------------
  def is_skill?;   @class == RPG::Skill;   end
  def is_item?;    @class == RPG::Item;    end
  def is_weapon?;  @class == RPG::Weapon;  end
  def is_armor?;   @class == RPG::Armor;   end
  def is_nil?;     @class == nil;          end
  #--------------------------------------------------------------------------
  # * Get Item Object
  #--------------------------------------------------------------------------
  def object
    return $data_skills[@item_id]  if is_skill?
    return $data_items[@item_id]   if is_item?
    return $data_weapons[@item_id] if is_weapon?
    return $data_armors[@item_id]  if is_armor?
    return nil
  end
  #--------------------------------------------------------------------------
  # * Set Item Object
  #--------------------------------------------------------------------------
  def object=(item)
    @class = item ? item.class : nil
    @item_id = item ? item.id : 0
  end
  #--------------------------------------------------------------------------
  # * Set Equipment with ID
  #     is_weapon:  Whether it is a weapon
  #     item_id: Weapon/armor ID
  #--------------------------------------------------------------------------
  def set_equip(is_weapon, item_id)
    @class = is_weapon ? RPG::Weapon : RPG::Armor
    @item_id = item_id
  end
end
#==============================================================================
# ** Game_Action
#------------------------------------------------------------------------------
#  This class handles battle actions. This class is used within the
# Game_Battler class.
#==============================================================================

class Game_Action
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :subject                  # action subject
  attr_reader   :forcing                  # forcing flag for battle action
  attr_reader   :item                     # skill/item
  attr_accessor :target_index             # target index
  attr_reader   :value                    # evaluation value for auto battle
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(subject, forcing = false)
    @subject = subject
    @forcing = forcing
    clear
  end
  #--------------------------------------------------------------------------
  # * Clear
  #--------------------------------------------------------------------------
  def clear
    @item = Game_BaseItem.new
    @target_index = -1
    @value = 0
  end
  #--------------------------------------------------------------------------
  # * Get Allied Units
  #--------------------------------------------------------------------------
  def friends_unit
    subject.friends_unit
  end
  #--------------------------------------------------------------------------
  # * Get Enemy Units
  #--------------------------------------------------------------------------
  def opponents_unit
    subject.opponents_unit
  end
  #--------------------------------------------------------------------------
  # * Set Battle Action of Enemy Character
  #     action : RPG::Enemy::Action
  #--------------------------------------------------------------------------
  def set_enemy_action(action)
    if action
      set_skill(action.skill_id)
    else
      clear
    end
  end
  #--------------------------------------------------------------------------
  # * Set Normal Attack
  #--------------------------------------------------------------------------
  def set_attack
    set_skill(subject.attack_skill_id)
    self
  end
  #--------------------------------------------------------------------------
  # * Set Guard
  #--------------------------------------------------------------------------
  def set_guard
    set_skill(subject.guard_skill_id)
    self
  end
  #--------------------------------------------------------------------------
  # * Set Skill
  #--------------------------------------------------------------------------
  def set_skill(skill_id)
    @item.object = $data_skills[skill_id]
    self
  end
  #--------------------------------------------------------------------------
  # * Set Item
  #--------------------------------------------------------------------------
  def set_item(item_id)
    @item.object = $data_items[item_id]
    self
  end
  #--------------------------------------------------------------------------
  # * Get Item Object
  #--------------------------------------------------------------------------
  def item
    @item.object
  end
  #--------------------------------------------------------------------------
  # * Normal Attack Determination
  #--------------------------------------------------------------------------
  def attack?
    item == $data_skills[subject.attack_skill_id]
  end
  #--------------------------------------------------------------------------
  # * Random Target
  #--------------------------------------------------------------------------
  def decide_random_target
    if item.for_dead_friend?
      target = friends_unit.random_dead_target
    elsif item.for_friend?
      target = friends_unit.random_target
    else
      target = opponents_unit.random_target
    end
    if target
      @target_index = target.index
    else
      clear
    end
  end
  #--------------------------------------------------------------------------
  # * Set Confusion Action
  #--------------------------------------------------------------------------
  def set_confusion
    set_attack
  end
  #--------------------------------------------------------------------------
  # * Action Preparation
  #--------------------------------------------------------------------------
  def prepare
    set_confusion if subject.confusion? && !forcing
  end
  #--------------------------------------------------------------------------
  # * Determination if Action is Valid or Not
  #    Assuming that an event command does not cause [Force Battle Action],
  #    if state limitations or lack of items, etc. make the planned action
  #    impossible, return false.
  #--------------------------------------------------------------------------
  def valid?
    (forcing && item) || subject.usable?(item)
  end
  #--------------------------------------------------------------------------
  # * Calculate Action Speed
  #--------------------------------------------------------------------------
  def speed
    speed = subject.agi + rand(5 + subject.agi / 4)
    speed += item.speed if item
    speed += subject.atk_speed if attack?
    speed
  end
  #--------------------------------------------------------------------------
  # * Create Target Array
  #--------------------------------------------------------------------------
  def make_targets
    if !forcing && subject.confusion?
      [confusion_target]
    elsif item.for_opponent?
      targets_for_opponents
    elsif item.for_friend?
      targets_for_friends
    else
      []
    end
  end
  #--------------------------------------------------------------------------
  # * Target When Confused
  #--------------------------------------------------------------------------
  def confusion_target
    case subject.confusion_level
    when 1
      opponents_unit.random_target
    when 2
      if rand(2) == 0
        opponents_unit.random_target
      else
        friends_unit.random_target
      end
    else
      friends_unit.random_target
    end
  end
  #--------------------------------------------------------------------------
  # * Targets for Opponents
  #--------------------------------------------------------------------------
  def targets_for_opponents
    if item.for_random?
      Array.new(item.number_of_targets) { opponents_unit.random_target }
    elsif item.for_one?
      num = 1 + (attack? ? subject.atk_times_add.to_i : 0)
      if @target_index < 0
        [opponents_unit.random_target] * num
      else
        [opponents_unit.smooth_target(@target_index)] * num
      end
    else
      opponents_unit.alive_members
    end
  end
  #--------------------------------------------------------------------------
  # * Targets for Allies
  #--------------------------------------------------------------------------
  def targets_for_friends
    if item.for_user?
      [subject]
    elsif item.for_dead_friend?
      if item.for_one?
        [friends_unit.smooth_dead_target(@target_index)]
      else
        friends_unit.dead_members
      end
    elsif item.for_friend?
      if item.for_one?
        [friends_unit.smooth_target(@target_index)]
      else
        friends_unit.alive_members
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Evaluate Value of Action (for Auto Battle)
  #    @value and @target_index are automatically set.
  #--------------------------------------------------------------------------
  def evaluate
    @value = 0
    evaluate_item if valid?
    @value += rand if @value > 0
    self
  end
  #--------------------------------------------------------------------------
  # * Evaluate Skill/Item
  #--------------------------------------------------------------------------
  def evaluate_item
    item_target_candidates.each do |target|
      value = evaluate_item_with_target(target)
      if item.for_all?
        @value += value
      elsif value > @value
        @value = value
        @target_index = target.index
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Get Use Target Candidates for Skills/Items
  #--------------------------------------------------------------------------
  def item_target_candidates
    if item.for_opponent?
      opponents_unit.alive_members
    elsif item.for_user?
      [subject]
    elsif item.for_dead_friend?
      friends_unit.dead_members
    else
      friends_unit.alive_members
    end
  end
  #--------------------------------------------------------------------------
  # * Evaluate Skill/Item (Target Specification)
  #--------------------------------------------------------------------------
  def evaluate_item_with_target(target)
    target.result.clear
    target.make_damage_value(subject, item)
    if item.for_opponent?
      return target.result.hp_damage.to_f / [target.hp, 1].max
    else
      recovery = [-target.result.hp_damage, target.mhp - target.hp].min
      return recovery.to_f / target.mhp
    end
  end
end
#==============================================================================
# ** Game_ActionResult
#------------------------------------------------------------------------------
#  This class handles the results of battle actions. It is used internally for
# the Game_Battler class.
#==============================================================================

class Game_ActionResult
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :used                     # used flag
  attr_accessor :missed                   # missed flag
  attr_accessor :evaded                   # evaded flag
  attr_accessor :critical                 # critical flag
  attr_accessor :success                  # success flag
  attr_accessor :hp_damage                # HP damage
  attr_accessor :mp_damage                # MP damage
  attr_accessor :tp_damage                # TP damage
  attr_accessor :hp_drain                 # HP drain
  attr_accessor :mp_drain                 # MP drain
  attr_accessor :added_states             # added states
  attr_accessor :removed_states           # removed states
  attr_accessor :added_buffs              # added buffs
  attr_accessor :added_debuffs            # added debuffs
  attr_accessor :removed_buffs            # removed buffs/debuffs
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(battler)
    @battler = battler
    clear
  end
  #--------------------------------------------------------------------------
  # * Clear
  #--------------------------------------------------------------------------
  def clear
    clear_hit_flags
    clear_damage_values
    clear_status_effects
  end
  #--------------------------------------------------------------------------
  # * Clear Hit Flags
  #--------------------------------------------------------------------------
  def clear_hit_flags
    @used = false
    @missed = false
    @evaded = false
    @critical = false
    @success = false
  end
  #--------------------------------------------------------------------------
  # * Clear Damage Values
  #--------------------------------------------------------------------------
  def clear_damage_values
    @hp_damage = 0
    @mp_damage = 0
    @tp_damage = 0
    @hp_drain = 0
    @mp_drain = 0
  end
  #--------------------------------------------------------------------------
  # * Create Damage
  #--------------------------------------------------------------------------
  def make_damage(value, item)
    @critical = false if value == 0
    @hp_damage = value if item.damage.to_hp?
    @mp_damage = value if item.damage.to_mp?
    @mp_damage = [@battler.mp, @mp_damage].min
    @hp_drain = @hp_damage if item.damage.drain?
    @mp_drain = @mp_damage if item.damage.drain?
    @hp_drain = [@battler.hp, @hp_drain].min
    @success = true if item.damage.to_hp? || @mp_damage != 0
  end
  #--------------------------------------------------------------------------
  # * Clear Status Effects
  #--------------------------------------------------------------------------
  def clear_status_effects
    @added_states = []
    @removed_states = []
    @added_buffs = []
    @added_debuffs = []
    @removed_buffs = []
  end
  #--------------------------------------------------------------------------
  # * Get Added States as an Object Array
  #--------------------------------------------------------------------------
  def added_state_objects
    @added_states.collect {|id| $data_states[id] }
  end
  #--------------------------------------------------------------------------
  # * Get Removed States as an Object Array
  #--------------------------------------------------------------------------
  def removed_state_objects
    @removed_states.collect {|id| $data_states[id] }
  end
  #--------------------------------------------------------------------------
  # * Determine Whether Some Sort of Status (Parameter or State) Was Affected
  #--------------------------------------------------------------------------
  def status_affected?
    !(@added_states.empty? && @removed_states.empty? &&
      @added_buffs.empty? && @added_debuffs.empty? && @removed_buffs.empty?)
  end
  #--------------------------------------------------------------------------
  # * Determine Final Hit
  #--------------------------------------------------------------------------
  def hit?
    @used && !@missed && !@evaded
  end
  #--------------------------------------------------------------------------
  # * Get Text for HP Damage
  #--------------------------------------------------------------------------
  def hp_damage_text
    if @hp_drain > 0
      fmt = @battler.actor? ? Vocab::ActorDrain : Vocab::EnemyDrain
      sprintf(fmt, @battler.name, Vocab::hp, @hp_drain)
    elsif @hp_damage > 0
      fmt = @battler.actor? ? Vocab::ActorDamage : Vocab::EnemyDamage
      sprintf(fmt, @battler.name, @hp_damage)
    elsif @hp_damage < 0
      fmt = @battler.actor? ? Vocab::ActorRecovery : Vocab::EnemyRecovery
      sprintf(fmt, @battler.name, Vocab::hp, -hp_damage)
    else
      fmt = @battler.actor? ? Vocab::ActorNoDamage : Vocab::EnemyNoDamage
      sprintf(fmt, @battler.name)
    end
  end
  #--------------------------------------------------------------------------
  # * Get Text for MP Damage
  #--------------------------------------------------------------------------
  def mp_damage_text
    if @mp_drain > 0
      fmt = @battler.actor? ? Vocab::ActorDrain : Vocab::EnemyDrain
      sprintf(fmt, @battler.name, Vocab::mp, @mp_drain)
    elsif @mp_damage > 0
      fmt = @battler.actor? ? Vocab::ActorLoss : Vocab::EnemyLoss
      sprintf(fmt, @battler.name, Vocab::mp, @mp_damage)
    elsif @mp_damage < 0
      fmt = @battler.actor? ? Vocab::ActorRecovery : Vocab::EnemyRecovery
      sprintf(fmt, @battler.name, Vocab::mp, -@mp_damage)
    else
      ""
    end
  end
  #--------------------------------------------------------------------------
  # * Get Text for TP Damage
  #--------------------------------------------------------------------------
  def tp_damage_text
    if @tp_damage > 0
      fmt = @battler.actor? ? Vocab::ActorLoss : Vocab::EnemyLoss
      sprintf(fmt, @battler.name, Vocab::tp, @tp_damage)
    elsif @tp_damage < 0
      fmt = @battler.actor? ? Vocab::ActorGain : Vocab::EnemyGain
      sprintf(fmt, @battler.name, Vocab::tp, -@tp_damage)
    else
      ""
    end
  end
end
#==============================================================================
# ** Game_BattlerBase
#------------------------------------------------------------------------------
#  This base class handles battlers. It mainly contains methods for calculating
# parameters. It is used as a super class of the Game_Battler class.
#==============================================================================

class Game_BattlerBase
  #--------------------------------------------------------------------------
  # * Constants (Features)
  #--------------------------------------------------------------------------
  FEATURE_ELEMENT_RATE  = 11              # Element Rate
  FEATURE_DEBUFF_RATE   = 12              # Debuff Rate
  FEATURE_STATE_RATE    = 13              # State Rate
  FEATURE_STATE_RESIST  = 14              # State Resist
  FEATURE_PARAM         = 21              # Parameter
  FEATURE_XPARAM        = 22              # Ex-Parameter
  FEATURE_SPARAM        = 23              # Sp-Parameter
  FEATURE_ATK_ELEMENT   = 31              # Atk Element
  FEATURE_ATK_STATE     = 32              # Atk State
  FEATURE_ATK_SPEED     = 33              # Atk Speed
  FEATURE_ATK_TIMES     = 34              # Atk Times+
  FEATURE_STYPE_ADD     = 41              # Add Skill Type
  FEATURE_STYPE_SEAL    = 42              # Disable Skill Type
  FEATURE_SKILL_ADD     = 43              # Add Skill
  FEATURE_SKILL_SEAL    = 44              # Disable Skill
  FEATURE_EQUIP_WTYPE   = 51              # Equip Weapon
  FEATURE_EQUIP_ATYPE   = 52              # Equip Armor
  FEATURE_EQUIP_FIX     = 53              # Lock Equip
  FEATURE_EQUIP_SEAL    = 54              # Seal Equip
  FEATURE_SLOT_TYPE     = 55              # Slot Type
  FEATURE_ACTION_PLUS   = 61              # Action Times+
  FEATURE_SPECIAL_FLAG  = 62              # Special Flag
  FEATURE_COLLAPSE_TYPE = 63              # Collapse Effect
  FEATURE_PARTY_ABILITY = 64              # Party Ability
  #--------------------------------------------------------------------------
  # * Constants (Feature Flags)
  #--------------------------------------------------------------------------
  FLAG_ID_AUTO_BATTLE   = 0               # auto battle
  FLAG_ID_GUARD         = 1               # guard
  FLAG_ID_SUBSTITUTE    = 2               # substitute
  FLAG_ID_PRESERVE_TP   = 3               # preserve TP
  #--------------------------------------------------------------------------
  # * Constants (Starting Number of Buff/Debuff Icons)
  #--------------------------------------------------------------------------
  ICON_BUFF_START       = 64              # buff (16 icons)
  ICON_DEBUFF_START     = 80              # debuff (16 icons)
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :hp                       # HP
  attr_reader   :mp                       # MP
  attr_reader   :tp                       # TP
  #--------------------------------------------------------------------------
  # * Access Method by Parameter Abbreviations
  #--------------------------------------------------------------------------
  def mhp;  param(0);   end               # MHP  Maximum Hit Points
  def mmp;  param(1);   end               # MMP  Maximum Magic Points
  def atk;  param(2);   end               # ATK  ATtacK power
  def def;  param(3);   end               # DEF  DEFense power
  def mat;  param(4);   end               # MAT  Magic ATtack power
  def mdf;  param(5);   end               # MDF  Magic DeFense power
  def agi;  param(6);   end               # AGI  AGIlity
  def luk;  param(7);   end               # LUK  LUcK
  def hit;  xparam(0);  end               # HIT  HIT rate
  def eva;  xparam(1);  end               # EVA  EVAsion rate
  def cri;  xparam(2);  end               # CRI  CRItical rate
  def cev;  xparam(3);  end               # CEV  Critical EVasion rate
  def mev;  xparam(4);  end               # MEV  Magic EVasion rate
  def mrf;  xparam(5);  end               # MRF  Magic ReFlection rate
  def cnt;  xparam(6);  end               # CNT  CouNTer attack rate
  def hrg;  xparam(7);  end               # HRG  Hp ReGeneration rate
  def mrg;  xparam(8);  end               # MRG  Mp ReGeneration rate
  def trg;  xparam(9);  end               # TRG  Tp ReGeneration rate
  def tgr;  sparam(0);  end               # TGR  TarGet Rate
  def grd;  sparam(1);  end               # GRD  GuaRD effect rate
  def rec;  sparam(2);  end               # REC  RECovery effect rate
  def pha;  sparam(3);  end               # PHA  PHArmacology
  def mcr;  sparam(4);  end               # MCR  Mp Cost Rate
  def tcr;  sparam(5);  end               # TCR  Tp Charge Rate
  def pdr;  sparam(6);  end               # PDR  Physical Damage Rate
  def mdr;  sparam(7);  end               # MDR  Magical Damage Rate
  def fdr;  sparam(8);  end               # FDR  Floor Damage Rate
  def exr;  sparam(9);  end               # EXR  EXperience Rate
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @hp = @mp = @tp = 0
    @hidden = false
    clear_param_plus
    clear_states
    clear_buffs
  end
  #--------------------------------------------------------------------------
  # * Clear Values Added to Parameter
  #--------------------------------------------------------------------------
  def clear_param_plus
    @param_plus = [0] * 8
  end
  #--------------------------------------------------------------------------
  # * Clear State Information
  #--------------------------------------------------------------------------
  def clear_states
    @states = []
    @state_turns = {}
    @state_steps = {}
  end
  #--------------------------------------------------------------------------
  # * Erase States
  #--------------------------------------------------------------------------
  def erase_state(state_id)
    @states.delete(state_id)
    @state_turns.delete(state_id)
    @state_steps.delete(state_id)
  end
  #--------------------------------------------------------------------------
  # * Clear Buff Information
  #--------------------------------------------------------------------------
  def clear_buffs
    @buffs = Array.new(8) { 0 }
    @buff_turns = {}
  end
  #--------------------------------------------------------------------------
  # * Check State
  #--------------------------------------------------------------------------
  def state?(state_id)
    @states.include?(state_id)
  end
  #--------------------------------------------------------------------------
  # * Check K.O. State
  #--------------------------------------------------------------------------
  def death_state?
    state?(death_state_id)
  end
  #--------------------------------------------------------------------------
  # * Get State ID of K.O.
  #--------------------------------------------------------------------------
  def death_state_id
    return 1
  end
  #--------------------------------------------------------------------------
  # * Get Current States as an Object Array
  #--------------------------------------------------------------------------
  def states
    @states.collect {|id| $data_states[id] }
  end
  #--------------------------------------------------------------------------
  # * Get Current States as an Array of Icon Numbers
  #--------------------------------------------------------------------------
  def state_icons
    icons = states.collect {|state| state.icon_index }
    icons.delete(0)
    icons
  end
  #--------------------------------------------------------------------------
  # * Get Current Buffs/Debuffs as an Array of Icon Numbers
  #--------------------------------------------------------------------------
  def buff_icons
    icons = []
    @buffs.each_with_index {|lv, i| icons.push(buff_icon_index(lv, i)) }
    icons.delete(0)
    icons
  end
  #--------------------------------------------------------------------------
  # * Get Icon Number Corresponding to Buff/Debuff
  #--------------------------------------------------------------------------
  def buff_icon_index(buff_level, param_id)
    if buff_level > 0
      return ICON_BUFF_START + (buff_level - 1) * 8 + param_id
    elsif buff_level < 0
      return ICON_DEBUFF_START + (-buff_level - 1) * 8 + param_id
    else
      return 0
    end
  end
  #--------------------------------------------------------------------------
  # * Get Array of All Objects Retaining Features
  #--------------------------------------------------------------------------
  def feature_objects
    states
  end
  #--------------------------------------------------------------------------
  # * Get Array of All Feature Objects
  #--------------------------------------------------------------------------
  def all_features
    feature_objects.inject([]) {|r, obj| r + obj.features }
  end
  #--------------------------------------------------------------------------
  # * Get Feature Object Array (Feature Codes Limited)
  #--------------------------------------------------------------------------
  def features(code)
    all_features.select {|ft| ft.code == code }
  end
  #--------------------------------------------------------------------------
  # * Get Feature Object Array (Feature Codes and Data IDs Limited)
  #--------------------------------------------------------------------------
  def features_with_id(code, id)
    all_features.select {|ft| ft.code == code && ft.data_id == id }
  end
  #--------------------------------------------------------------------------
  # * Calculate Complement of Feature Values
  #--------------------------------------------------------------------------
  def features_pi(code, id)
    features_with_id(code, id).inject(1.0) {|r, ft| r *= ft.value }
  end
  #--------------------------------------------------------------------------
  # * Calculate Sum of Feature Values (Specify Data ID)
  #--------------------------------------------------------------------------
  def features_sum(code, id)
    features_with_id(code, id).inject(0.0) {|r, ft| r += ft.value }
  end
  #--------------------------------------------------------------------------
  # * Calculate Sum of Feature Values (Data ID Unspecified)
  #--------------------------------------------------------------------------
  def features_sum_all(code)
    features(code).inject(0.0) {|r, ft| r += ft.value }
  end
  #--------------------------------------------------------------------------
  # * Calculate Set Sum of Features
  #--------------------------------------------------------------------------
  def features_set(code)
    features(code).inject([]) {|r, ft| r |= [ft.data_id] }
  end
  #--------------------------------------------------------------------------
  # * Get Base Value of Parameter
  #--------------------------------------------------------------------------
  def param_base(param_id)
    return 0
  end
  #--------------------------------------------------------------------------
  # * Get Added Value of Parameter
  #--------------------------------------------------------------------------
  def param_plus(param_id)
    @param_plus[param_id]
  end
  #--------------------------------------------------------------------------
  # * Get Reduced Value of Parameter
  #--------------------------------------------------------------------------
  def param_min(param_id)
    return 0 if param_id == 1  # MMP
    return 1
  end
  #--------------------------------------------------------------------------
  # * Get Maximum Value of Parameter
  #--------------------------------------------------------------------------
  def param_max(param_id)
    return 999999 if param_id == 0  # MHP
    return 9999   if param_id == 1  # MMP
    return 999
  end
  #--------------------------------------------------------------------------
  # * Get Rate of Parameter Change
  #--------------------------------------------------------------------------
  def param_rate(param_id)
    features_pi(FEATURE_PARAM, param_id)
  end
  #--------------------------------------------------------------------------
  # * Get Rate of Change Due to Parameter Buff/Debuff
  #--------------------------------------------------------------------------
  def param_buff_rate(param_id)
    @buffs[param_id] * 0.25 + 1.0
  end
  #--------------------------------------------------------------------------
  # * Get Parameter
  #--------------------------------------------------------------------------
  def param(param_id)
    value = param_base(param_id) + param_plus(param_id)
    value *= param_rate(param_id) * param_buff_rate(param_id)
    [[value, param_max(param_id)].min, param_min(param_id)].max.to_i
  end
  #--------------------------------------------------------------------------
  # * Get Ex-Parameter
  #--------------------------------------------------------------------------
  def xparam(xparam_id)
    features_sum(FEATURE_XPARAM, xparam_id)
  end
  #--------------------------------------------------------------------------
  # * Get Sp-Parameter
  #--------------------------------------------------------------------------
  def sparam(sparam_id)
    features_pi(FEATURE_SPARAM, sparam_id)
  end
  #--------------------------------------------------------------------------
  # * Get Element Rate
  #--------------------------------------------------------------------------
  def element_rate(element_id)
    features_pi(FEATURE_ELEMENT_RATE, element_id)
  end
  #--------------------------------------------------------------------------
  # * Get Debuff Rate
  #--------------------------------------------------------------------------
  def debuff_rate(param_id)
    features_pi(FEATURE_DEBUFF_RATE, param_id)
  end
  #--------------------------------------------------------------------------
  # * Get State Rate
  #--------------------------------------------------------------------------
  def state_rate(state_id)
    features_pi(FEATURE_STATE_RATE, state_id)
  end
  #--------------------------------------------------------------------------
  # * Get Array of States to Resist
  #--------------------------------------------------------------------------
  def state_resist_set
    features_set(FEATURE_STATE_RESIST)
  end
  #--------------------------------------------------------------------------
  # * Determine if State Is Resisted
  #--------------------------------------------------------------------------
  def state_resist?(state_id)
    state_resist_set.include?(state_id)
  end
  #--------------------------------------------------------------------------
  # * Get Attack Element
  #--------------------------------------------------------------------------
  def atk_elements
    features_set(FEATURE_ATK_ELEMENT)
  end
  #--------------------------------------------------------------------------
  # * Get Attack State
  #--------------------------------------------------------------------------
  def atk_states
    features_set(FEATURE_ATK_STATE)
  end
  #--------------------------------------------------------------------------
  # * Get Attack State Invocation Rate
  #--------------------------------------------------------------------------
  def atk_states_rate(state_id)
    features_sum(FEATURE_ATK_STATE, state_id)
  end
  #--------------------------------------------------------------------------
  # * Get Attack Speed
  #--------------------------------------------------------------------------
  def atk_speed
    features_sum_all(FEATURE_ATK_SPEED)
  end
  #--------------------------------------------------------------------------
  # * Get Additional Attack Times
  #--------------------------------------------------------------------------
  def atk_times_add
    [features_sum_all(FEATURE_ATK_TIMES), 0].max
  end
  #--------------------------------------------------------------------------
  # * Get Added Skill Types
  #--------------------------------------------------------------------------
  def added_skill_types
    features_set(FEATURE_STYPE_ADD)
  end
  #--------------------------------------------------------------------------
  # * Determine if Skill Type Is Disabled
  #--------------------------------------------------------------------------
  def skill_type_sealed?(stype_id)
    features_set(FEATURE_STYPE_SEAL).include?(stype_id)
  end
  #--------------------------------------------------------------------------
  # * Get Added Skills
  #--------------------------------------------------------------------------
  def added_skills
    features_set(FEATURE_SKILL_ADD)
  end
  #--------------------------------------------------------------------------
  # * Determine if Skill Is Disabled
  #--------------------------------------------------------------------------
  def skill_sealed?(skill_id)
    features_set(FEATURE_SKILL_SEAL).include?(skill_id)
  end
  #--------------------------------------------------------------------------
  # * Determine if Weapon Can Be Equipped
  #--------------------------------------------------------------------------
  def equip_wtype_ok?(wtype_id)
    features_set(FEATURE_EQUIP_WTYPE).include?(wtype_id)
  end
  #--------------------------------------------------------------------------
  # * Determine if Armor Can Be Equipped
  #--------------------------------------------------------------------------
  def equip_atype_ok?(atype_id)
    features_set(FEATURE_EQUIP_ATYPE).include?(atype_id)
  end
  #--------------------------------------------------------------------------
  # * Determine if Equipment Is Locked
  #--------------------------------------------------------------------------
  def equip_type_fixed?(etype_id)
    features_set(FEATURE_EQUIP_FIX).include?(etype_id)
  end
  #--------------------------------------------------------------------------
  # * Determine if Equipment Is Sealed
  #--------------------------------------------------------------------------
  def equip_type_sealed?(etype_id)
    features_set(FEATURE_EQUIP_SEAL).include?(etype_id)
  end
  #--------------------------------------------------------------------------
  # * Get Slot Type
  #--------------------------------------------------------------------------
  def slot_type
    features_set(FEATURE_SLOT_TYPE).max || 0
  end
  #--------------------------------------------------------------------------
  # * Determine if Dual Wield
  #--------------------------------------------------------------------------
  def dual_wield?
    slot_type == 1
  end
  #--------------------------------------------------------------------------
  # * Get Array of Additional Action Time Probabilities
  #--------------------------------------------------------------------------
  def action_plus_set
    features(FEATURE_ACTION_PLUS).collect {|ft| ft.value }
  end
  #--------------------------------------------------------------------------
  # * Determine if Special Flag
  #--------------------------------------------------------------------------
  def special_flag(flag_id)
    features(FEATURE_SPECIAL_FLAG).any? {|ft| ft.data_id == flag_id }
  end
  #--------------------------------------------------------------------------
  # * Get Collapse Effect
  #--------------------------------------------------------------------------
  def collapse_type
    features_set(FEATURE_COLLAPSE_TYPE).max || 0
  end
  #--------------------------------------------------------------------------
  # * Determine Party Ability
  #--------------------------------------------------------------------------
  def party_ability(ability_id)
    features(FEATURE_PARTY_ABILITY).any? {|ft| ft.data_id == ability_id }
  end
  #--------------------------------------------------------------------------
  # * Determine if Auto Battle
  #--------------------------------------------------------------------------
  def auto_battle?
    special_flag(FLAG_ID_AUTO_BATTLE)
  end
  #--------------------------------------------------------------------------
  # * Determine if Guard
  #--------------------------------------------------------------------------
  def guard?
    special_flag(FLAG_ID_GUARD) && movable?
  end
  #--------------------------------------------------------------------------
  # * Determine if Substitute
  #--------------------------------------------------------------------------
  def substitute?
    special_flag(FLAG_ID_SUBSTITUTE) && movable?
  end
  #--------------------------------------------------------------------------
  # * Determine if Preserve TP
  #--------------------------------------------------------------------------
  def preserve_tp?
    special_flag(FLAG_ID_PRESERVE_TP)
  end
  #--------------------------------------------------------------------------
  # * Increase Parameter
  #--------------------------------------------------------------------------
  def add_param(param_id, value)
    @param_plus[param_id] += value
    refresh
  end
  #--------------------------------------------------------------------------
  # * Change HP
  #--------------------------------------------------------------------------
  def hp=(hp)
    @hp = hp
    refresh
  end
  #--------------------------------------------------------------------------
  # * Change MP
  #--------------------------------------------------------------------------
  def mp=(mp)
    @mp = mp
    refresh
  end
  #--------------------------------------------------------------------------
  # * Change HP (for Events)
  #     value:         Amount of increase/decrease
  #     enable_death:  Allow knockout
  #--------------------------------------------------------------------------
  def change_hp(value, enable_death)
    if !enable_death && @hp + value <= 0
      self.hp = 1
    else
      self.hp += value
    end
  end
  #--------------------------------------------------------------------------
  # * Change TP
  #--------------------------------------------------------------------------
  def tp=(tp)
    @tp = [[tp, max_tp].min, 0].max
  end
  #--------------------------------------------------------------------------
  # * Get Maximum Value of TP
  #--------------------------------------------------------------------------
  def max_tp
    return 100
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    state_resist_set.each {|state_id| erase_state(state_id) }
    @hp = [[@hp, mhp].min, 0].max
    @mp = [[@mp, mmp].min, 0].max
    @hp == 0 ? add_state(death_state_id) : remove_state(death_state_id)
  end
  #--------------------------------------------------------------------------
  # * Recover All
  #--------------------------------------------------------------------------
  def recover_all
    clear_states
    @hp = mhp
    @mp = mmp
  end
  #--------------------------------------------------------------------------
  # * Get Percentage of HP
  #--------------------------------------------------------------------------
  def hp_rate
    @hp.to_f / mhp
  end
  #--------------------------------------------------------------------------
  # * Get Percentage of MP
  #--------------------------------------------------------------------------
  def mp_rate
    mmp > 0 ? @mp.to_f / mmp : 0
  end
  #--------------------------------------------------------------------------
  # * Get Percentage of TP
  #--------------------------------------------------------------------------
  def tp_rate
    @tp.to_f / 100
  end
  #--------------------------------------------------------------------------
  # * Hide
  #--------------------------------------------------------------------------
  def hide
    @hidden = true
  end
  #--------------------------------------------------------------------------
  # * Appear
  #--------------------------------------------------------------------------
  def appear
    @hidden = false
  end
  #--------------------------------------------------------------------------
  # * Get Hide State
  #--------------------------------------------------------------------------
  def hidden?
    @hidden
  end
  #--------------------------------------------------------------------------
  # * Determine Existence
  #--------------------------------------------------------------------------
  def exist?
    !hidden?
  end
  #--------------------------------------------------------------------------
  # * Determine Incapacitation
  #--------------------------------------------------------------------------
  def dead?
    exist? && death_state?
  end
  #--------------------------------------------------------------------------
  # * Determine Survival
  #--------------------------------------------------------------------------
  def alive?
    exist? && !death_state?
  end
  #--------------------------------------------------------------------------
  # * Determine Normality
  #--------------------------------------------------------------------------
  def normal?
    exist? && restriction == 0
  end
  #--------------------------------------------------------------------------
  # * Determine if Command is Inputable
  #--------------------------------------------------------------------------
  def inputable?
    normal? && !auto_battle?
  end
  #--------------------------------------------------------------------------
  # * Determine if Action is Possible
  #--------------------------------------------------------------------------
  def movable?
    exist? && restriction < 4
  end
  #--------------------------------------------------------------------------
  # * Determine if Character is Confused
  #--------------------------------------------------------------------------
  def confusion?
    exist? && restriction >= 1 && restriction <= 3
  end
  #--------------------------------------------------------------------------
  # * Get Confusion Level
  #--------------------------------------------------------------------------
  def confusion_level
    confusion? ? restriction : 0
  end
  #--------------------------------------------------------------------------
  # * Determine if Actor or Not
  #--------------------------------------------------------------------------
  def actor?
    return false
  end
  #--------------------------------------------------------------------------
  # * Determine if Enemy
  #--------------------------------------------------------------------------
  def enemy?
    return false
  end
  #--------------------------------------------------------------------------
  # * Sorting States
  #    Sort the content of the @states array, with higher priority states
  #    coming first.
  #--------------------------------------------------------------------------
  def sort_states
    @states = @states.sort_by {|id| [-$data_states[id].priority, id] }
  end
  #--------------------------------------------------------------------------
  # * Get Restriction
  #    Get the largest restriction from the currently added states.
  #--------------------------------------------------------------------------
  def restriction
    states.collect {|state| state.restriction }.push(0).max
  end
  #--------------------------------------------------------------------------
  # * Get Most Important State Continuation Message
  #--------------------------------------------------------------------------
  def most_important_state_text
    states.each {|state| return state.message3 unless state.message3.empty? }
    return ""
  end
  #--------------------------------------------------------------------------
  # * Determine if Skill-Required Weapon Is Equipped
  #--------------------------------------------------------------------------
  def skill_wtype_ok?(skill)
    return true
  end
  #--------------------------------------------------------------------------
  # * Calculate Skill's MP Cost
  #--------------------------------------------------------------------------
  def skill_mp_cost(skill)
    (skill.mp_cost * mcr).to_i
  end
  #--------------------------------------------------------------------------
  # * Calculate Skill's TP Cost
  #--------------------------------------------------------------------------
  def skill_tp_cost(skill)
    skill.tp_cost
  end
  #--------------------------------------------------------------------------
  # * Determine if Cost of Using Skill Can Be Paid
  #--------------------------------------------------------------------------
  def skill_cost_payable?(skill)
    tp >= skill_tp_cost(skill) && mp >= skill_mp_cost(skill)
  end
  #--------------------------------------------------------------------------
  # * Pay Cost of Using Skill
  #--------------------------------------------------------------------------
  def pay_skill_cost(skill)
    self.mp -= skill_mp_cost(skill)
    self.tp -= skill_tp_cost(skill)
  end
  #--------------------------------------------------------------------------
  # * Check When Skill/Item Can Be Used
  #--------------------------------------------------------------------------
  def occasion_ok?(item)
    $game_party.in_battle ? item.battle_ok? : item.menu_ok?
  end
  #--------------------------------------------------------------------------
  # * Check Common Usability Conditions for Skill/Item
  #--------------------------------------------------------------------------
  def usable_item_conditions_met?(item)
    movable? && occasion_ok?(item)
  end
  #--------------------------------------------------------------------------
  # * Check Usability Conditions for Skill
  #--------------------------------------------------------------------------
  def skill_conditions_met?(skill)
    usable_item_conditions_met?(skill) &&
      skill_wtype_ok?(skill) && skill_cost_payable?(skill) &&
      !skill_sealed?(skill.id) && !skill_type_sealed?(skill.stype_id)
  end
  #--------------------------------------------------------------------------
  # * Check Usability Conditions for Item
  #--------------------------------------------------------------------------
  def item_conditions_met?(item)
    usable_item_conditions_met?(item) && $game_party.has_item?(item)
  end
  #--------------------------------------------------------------------------
  # * Determine Skill/Item Usability
  #--------------------------------------------------------------------------
  def usable?(item)
    return skill_conditions_met?(item) if item.is_a?(RPG::Skill)
    return item_conditions_met?(item)  if item.is_a?(RPG::Item)
    return false
  end
  #--------------------------------------------------------------------------
  # * Determine if Equippable
  #--------------------------------------------------------------------------
  def equippable?(item)
    return false unless item.is_a?(RPG::EquipItem)
    return false if equip_type_sealed?(item.etype_id)
    return equip_wtype_ok?(item.wtype_id) if item.is_a?(RPG::Weapon)
    return equip_atype_ok?(item.atype_id) if item.is_a?(RPG::Armor)
    return false
  end
  #--------------------------------------------------------------------------
  # * Get Skill ID of Normal Attack
  #--------------------------------------------------------------------------
  def attack_skill_id
    return 1
  end
  #--------------------------------------------------------------------------
  # * Get Skill ID of Guard
  #--------------------------------------------------------------------------
  def guard_skill_id
    return 2
  end
  #--------------------------------------------------------------------------
  # * Determine Usability of Normal Attack
  #--------------------------------------------------------------------------
  def attack_usable?
    usable?($data_skills[attack_skill_id])
  end
  #--------------------------------------------------------------------------
  # * Determine Usability of Guard
  #--------------------------------------------------------------------------
  def guard_usable?
    usable?($data_skills[guard_skill_id])
  end
end
#==============================================================================
# ** Game_Battler
#------------------------------------------------------------------------------
#  A battler class with methods for sprites and actions added. This class
# is used as a super class of the Game_Actor class and Game_Enemy class.
#==============================================================================

class Game_Battler < Game_BattlerBase
  #--------------------------------------------------------------------------
  # * Constants (Effects)
  #--------------------------------------------------------------------------
  EFFECT_RECOVER_HP     = 11              # HP Recovery
  EFFECT_RECOVER_MP     = 12              # MP Recovery
  EFFECT_GAIN_TP        = 13              # TP Gain
  EFFECT_ADD_STATE      = 21              # Add State
  EFFECT_REMOVE_STATE   = 22              # Remove State
  EFFECT_ADD_BUFF       = 31              # Add Buff
  EFFECT_ADD_DEBUFF     = 32              # Add Debuff
  EFFECT_REMOVE_BUFF    = 33              # Remove Buff
  EFFECT_REMOVE_DEBUFF  = 34              # Remove Debuff
  EFFECT_SPECIAL        = 41              # Special Effect
  EFFECT_GROW           = 42              # Raise Parameter
  EFFECT_LEARN_SKILL    = 43              # Learn Skill
  EFFECT_COMMON_EVENT   = 44              # Common Events
  #--------------------------------------------------------------------------
  # * Constants (Special Effects)
  #--------------------------------------------------------------------------
  SPECIAL_EFFECT_ESCAPE = 0               # Escape
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :battler_name             # battle graphic filename
  attr_reader   :battler_hue              # battle graphic hue
  attr_reader   :action_times             # action times
  attr_reader   :actions                  # combat actions (action side)
  attr_reader   :speed                    # action speed
  attr_reader   :result                   # action result (target side)
  attr_accessor :last_target_index        # last target
  attr_accessor :animation_id             # animation ID
  attr_accessor :animation_mirror         # animation flip horizontal flag
  attr_accessor :sprite_effect_type       # sprite effect
  attr_accessor :magic_reflection         # reflection flag
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @battler_name = ""
    @battler_hue = 0
    @actions = []
    @speed = 0
    @result = Game_ActionResult.new(self)
    @last_target_index = 0
    @guarding = false
    clear_sprite_effects
    super
  end
  #--------------------------------------------------------------------------
  # * Clear Sprite Effects
  #--------------------------------------------------------------------------
  def clear_sprite_effects
    @animation_id = 0
    @animation_mirror = false
    @sprite_effect_type = nil
  end
  #--------------------------------------------------------------------------
  # * Clear Actions
  #--------------------------------------------------------------------------
  def clear_actions
    @actions.clear
  end
  #--------------------------------------------------------------------------
  # * Clear State Information
  #--------------------------------------------------------------------------
  def clear_states
    super
    @result.clear_status_effects
  end
  #--------------------------------------------------------------------------
  # * Add State
  #--------------------------------------------------------------------------
  def add_state(state_id)
    if state_addable?(state_id)
      add_new_state(state_id) unless state?(state_id)
      reset_state_counts(state_id)
      @result.added_states.push(state_id).uniq!
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if States Are Addable
  #--------------------------------------------------------------------------
  def state_addable?(state_id)
    alive? && $data_states[state_id] && !state_resist?(state_id) &&
      !state_removed?(state_id) && !state_restrict?(state_id)
  end
  #--------------------------------------------------------------------------
  # * Determine States Removed During Same Action
  #--------------------------------------------------------------------------
  def state_removed?(state_id)
    @result.removed_states.include?(state_id)
  end
  #--------------------------------------------------------------------------
  # * Determine States Removed by Action Restriction
  #--------------------------------------------------------------------------
  def state_restrict?(state_id)
    $data_states[state_id].remove_by_restriction && restriction > 0
  end
  #--------------------------------------------------------------------------
  # * Add New State
  #--------------------------------------------------------------------------
  def add_new_state(state_id)
    die if state_id == death_state_id
    @states.push(state_id)
    on_restrict if restriction > 0
    sort_states
    refresh
  end
  #--------------------------------------------------------------------------
  # * Processing Performed When Action Restriction Occurs
  #--------------------------------------------------------------------------
  def on_restrict
    clear_actions
    states.each do |state|
      remove_state(state.id) if state.remove_by_restriction
    end
  end
  #--------------------------------------------------------------------------
  # * Reset State Counts (Turns and Steps)
  #--------------------------------------------------------------------------
  def reset_state_counts(state_id)
    state = $data_states[state_id]
    variance = 1 + [state.max_turns - state.min_turns, 0].max
    @state_turns[state_id] = state.min_turns + rand(variance)
    @state_steps[state_id] = state.steps_to_remove
  end
  #--------------------------------------------------------------------------
  # * Remove State
  #--------------------------------------------------------------------------
  def remove_state(state_id)
    if state?(state_id)
      revive if state_id == death_state_id
      erase_state(state_id)
      refresh
      @result.removed_states.push(state_id).uniq!
    end
  end
  #--------------------------------------------------------------------------
  # * Knock Out
  #--------------------------------------------------------------------------
  def die
    @hp = 0
    clear_states
    clear_buffs
  end
  #--------------------------------------------------------------------------
  # * Revive from Knock Out
  #--------------------------------------------------------------------------
  def revive
    @hp = 1 if @hp == 0
  end
  #--------------------------------------------------------------------------
  # * Escape
  #--------------------------------------------------------------------------
  def escape
    hide if $game_party.in_battle
    clear_actions
    clear_states
    Sound.play_escape
  end
  #--------------------------------------------------------------------------
  # * Add Buff
  #--------------------------------------------------------------------------
  def add_buff(param_id, turns)
    return unless alive?
    @buffs[param_id] += 1 unless buff_max?(param_id)
    erase_buff(param_id) if debuff?(param_id)
    overwrite_buff_turns(param_id, turns)
    @result.added_buffs.push(param_id).uniq!
    refresh
  end
  #--------------------------------------------------------------------------
  # * Add Debuff
  #--------------------------------------------------------------------------
  def add_debuff(param_id, turns)
    return unless alive?
    @buffs[param_id] -= 1 unless debuff_max?(param_id)
    erase_buff(param_id) if buff?(param_id)
    overwrite_buff_turns(param_id, turns)
    @result.added_debuffs.push(param_id).uniq!
    refresh
  end
  #--------------------------------------------------------------------------
  # * Remove Buff/Debuff
  #--------------------------------------------------------------------------
  def remove_buff(param_id)
    return unless alive?
    return if @buffs[param_id] == 0
    erase_buff(param_id)
    @buff_turns.delete(param_id)
    @result.removed_buffs.push(param_id).uniq!
    refresh
  end
  #--------------------------------------------------------------------------
  # * Erase Buff/Debuff
  #--------------------------------------------------------------------------
  def erase_buff(param_id)
    @buffs[param_id] = 0
    @buff_turns[param_id] = 0
  end
  #--------------------------------------------------------------------------
  # * Determine Buff Status
  #--------------------------------------------------------------------------
  def buff?(param_id)
    @buffs[param_id] > 0
  end
  #--------------------------------------------------------------------------
  # * Determine Debuff Status
  #--------------------------------------------------------------------------
  def debuff?(param_id)
    @buffs[param_id] < 0
  end
  #--------------------------------------------------------------------------
  # * Determine if Buff Is at Maximum Level
  #--------------------------------------------------------------------------
  def buff_max?(param_id)
    @buffs[param_id] == 2
  end
  #--------------------------------------------------------------------------
  # * Determine if Debuff Is at Maximum Level
  #--------------------------------------------------------------------------
  def debuff_max?(param_id)
    @buffs[param_id] == -2
  end
  #--------------------------------------------------------------------------
  # * Overwrite Buff/Debuff Turns
  #    Doesn't overwrite if number of turns would become shorter.
  #--------------------------------------------------------------------------
  def overwrite_buff_turns(param_id, turns)
    @buff_turns[param_id] = turns if @buff_turns[param_id].to_i < turns
  end
  #--------------------------------------------------------------------------
  # * Update State Turn Count
  #--------------------------------------------------------------------------
  def update_state_turns
    states.each do |state|
      @state_turns[state.id] -= 1 if @state_turns[state.id] > 0
    end
  end
  #--------------------------------------------------------------------------
  # * Update Buff/Debuff Turn Count
  #--------------------------------------------------------------------------
  def update_buff_turns
    @buff_turns.keys.each do |param_id|
      @buff_turns[param_id] -= 1 if @buff_turns[param_id] > 0
    end
  end
  #--------------------------------------------------------------------------
  # * Remove Battle States
  #--------------------------------------------------------------------------
  def remove_battle_states
    states.each do |state|
      remove_state(state.id) if state.remove_at_battle_end
    end
  end
  #--------------------------------------------------------------------------
  # * Remove All Buffs/Debuffs
  #--------------------------------------------------------------------------
  def remove_all_buffs
    @buffs.size.times {|param_id| remove_buff(param_id) }
  end
  #--------------------------------------------------------------------------
  # * Automatically Remove States
  #     timing:  Timing (1: End of action 2: End of turn)
  #--------------------------------------------------------------------------
  def remove_states_auto(timing)
    states.each do |state|
      if @state_turns[state.id] == 0 && state.auto_removal_timing == timing
        remove_state(state.id)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Automatically Remove Buffs/Debuffs
  #--------------------------------------------------------------------------
  def remove_buffs_auto
    @buffs.size.times do |param_id|
      next if @buffs[param_id] == 0 || @buff_turns[param_id] > 0
      remove_buff(param_id)
    end
  end
  #--------------------------------------------------------------------------
  # * Remove State by Damage
  #--------------------------------------------------------------------------
  def remove_states_by_damage
    states.each do |state|
      if state.remove_by_damage && rand(100) < state.chance_by_damage
        remove_state(state.id)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Determine Action Times
  #--------------------------------------------------------------------------
  def make_action_times
    action_plus_set.inject(1) {|r, p| rand < p ? r + 1 : r }
  end
  #--------------------------------------------------------------------------
  # * Create Battle Action
  #--------------------------------------------------------------------------
  def make_actions
    clear_actions
    return unless movable?
    @actions = Array.new(make_action_times) { Game_Action.new(self) }
  end
  #--------------------------------------------------------------------------
  # * Determine Action Speed
  #--------------------------------------------------------------------------
  def make_speed
    @speed = @actions.collect {|action| action.speed }.min || 0
  end
  #--------------------------------------------------------------------------
  # * Get Current Action
  #--------------------------------------------------------------------------
  def current_action
    @actions[0]
  end
  #--------------------------------------------------------------------------
  # * Remove Current Action
  #--------------------------------------------------------------------------
  def remove_current_action
    @actions.shift
  end
  #--------------------------------------------------------------------------
  # * Force Action
  #--------------------------------------------------------------------------
  def force_action(skill_id, target_index)
    clear_actions
    action = Game_Action.new(self, true)
    action.set_skill(skill_id)
    if target_index == -2
      action.target_index = last_target_index
    elsif target_index == -1
      action.decide_random_target
    else
      action.target_index = target_index
    end
    @actions.push(action)
  end
  #--------------------------------------------------------------------------
  # * Calculate Damage
  #--------------------------------------------------------------------------
  def make_damage_value(user, item)
    value = item.damage.eval(user, self, $game_variables)
    value *= item_element_rate(user, item)
    value *= pdr if item.physical?
    value *= mdr if item.magical?
    value *= rec if item.damage.recover?
    value = apply_critical(value) if @result.critical
    value = apply_variance(value, item.damage.variance)
    value = apply_guard(value)
    @result.make_damage(value.to_i, item)
  end
  #--------------------------------------------------------------------------
  # * Get Element Modifier for Skill/Item
  #--------------------------------------------------------------------------
  def item_element_rate(user, item)
    if item.damage.element_id < 0
      user.atk_elements.empty? ? 1.0 : elements_max_rate(user.atk_elements)
    else
      element_rate(item.damage.element_id)
    end
  end
  #--------------------------------------------------------------------------
  # * Get Maximum Elemental Adjustment Amount
  #     elements : An array of attribute IDs
  #    Returns the most effective adjustment of all elemental alignments.
  #--------------------------------------------------------------------------
  def elements_max_rate(elements)
    elements.inject([0.0]) {|r, i| r.push(element_rate(i)) }.max
  end
  #--------------------------------------------------------------------------
  # * Apply Critical
  #--------------------------------------------------------------------------
  def apply_critical(damage)
    damage * 3
  end
  #--------------------------------------------------------------------------
  # * Applying Variance
  #--------------------------------------------------------------------------
  def apply_variance(damage, variance)
    amp = [damage.abs * variance / 100, 0].max.to_i
    var = rand(amp + 1) + rand(amp + 1) - amp
    damage >= 0 ? damage + var : damage - var
  end
  #--------------------------------------------------------------------------
  # * Applying Guard Adjustment
  #--------------------------------------------------------------------------
  def apply_guard(damage)
    damage / (damage > 0 && guard? ? 2 * grd : 1)
  end
  #--------------------------------------------------------------------------
  # * Damage Processing
  #    @result.hp_damage @result.mp_damage @result.hp_drain
  #    @result.mp_drain must be set before call.
  #--------------------------------------------------------------------------
  def execute_damage(user)
    on_damage(@result.hp_damage) if @result.hp_damage > 0
    self.hp -= @result.hp_damage
    self.mp -= @result.mp_damage
    user.hp += @result.hp_drain
    user.mp += @result.mp_drain
  end
  #--------------------------------------------------------------------------
  # * Use Skill/Item
  #    Called for the acting side and applies the effect to other than the user.
  #--------------------------------------------------------------------------
  def use_item(item)
    pay_skill_cost(item) if item.is_a?(RPG::Skill)
    consume_item(item)   if item.is_a?(RPG::Item)
    item.effects.each {|effect| item_global_effect_apply(effect) }
  end
  #--------------------------------------------------------------------------
  # * Consume Items
  #--------------------------------------------------------------------------
  def consume_item(item)
    $game_party.consume_item(item)
  end
  #--------------------------------------------------------------------------
  # * Apply Effect of Use to Other Than User
  #--------------------------------------------------------------------------
  def item_global_effect_apply(effect)
    if effect.code == EFFECT_COMMON_EVENT
      $game_temp.reserve_common_event(effect.data_id)
    end
  end
  #--------------------------------------------------------------------------
  # * Test Skill/Item Application
  #    Used to determine, for example, if a character is already fully healed
  #   and so cannot recover anymore.
  #--------------------------------------------------------------------------
  def item_test(user, item)
    return false if item.for_dead_friend? != dead?
    return true if $game_party.in_battle
    return true if item.for_opponent?
    return true if item.damage.recover? && item.damage.to_hp? && hp < mhp
    return true if item.damage.recover? && item.damage.to_mp? && mp < mmp
    return true if item_has_any_valid_effects?(user, item)
    return false
  end
  #--------------------------------------------------------------------------
  # * Determine if Skill/Item Has Any Valid Effects
  #--------------------------------------------------------------------------
  def item_has_any_valid_effects?(user, item)
    item.effects.any? {|effect| item_effect_test(user, item, effect) }
  end
  #--------------------------------------------------------------------------
  # * Calculate Counterattack Rate for Skill/Item
  #--------------------------------------------------------------------------
  def item_cnt(user, item)
    return 0 unless item.physical?          # Hit type is not physical
    return 0 unless opposite?(user)         # No counterattack on allies
    return cnt                              # Return counterattack rate
  end
  #--------------------------------------------------------------------------
  # * Calculate Reflection Rate of Skill/Item
  #--------------------------------------------------------------------------
  def item_mrf(user, item)
    return mrf if item.magical?     # Return magic reflection if magic attack
    return 0
  end
  #--------------------------------------------------------------------------
  # * Calculate Hit Rate of Skill/Item
  #--------------------------------------------------------------------------
  def item_hit(user, item)
    rate = item.success_rate * 0.01     # Get success rate
    rate *= user.hit if item.physical?  # Physical attack: Multiply hit rate
    return rate                         # Return calculated hit rate
  end
  #--------------------------------------------------------------------------
  # * Calculate Evasion Rate for Skill/Item
  #--------------------------------------------------------------------------
  def item_eva(user, item)
    return eva if item.physical?    # Return evasion if physical attack
    return mev if item.magical?     # Return magic evasion if magic attack
    return 0
  end
  #--------------------------------------------------------------------------
  # * Calculate Critical Rate of Skill/Item
  #--------------------------------------------------------------------------
  def item_cri(user, item)
    item.damage.critical ? user.cri * (1 - cev) : 0
  end
  #--------------------------------------------------------------------------
  # * Apply Normal Attack Effects
  #--------------------------------------------------------------------------
  def attack_apply(attacker)
    item_apply(attacker, $data_skills[attacker.attack_skill_id])
  end
  #--------------------------------------------------------------------------
  # * Apply Effect of Skill/Item
  #--------------------------------------------------------------------------
  def item_apply(user, item)
    @result.clear
    @result.used = item_test(user, item)
    @result.missed = (@result.used && rand >= item_hit(user, item))
    @result.evaded = (!@result.missed && rand < item_eva(user, item))
    if @result.hit?
      unless item.damage.none?
        @result.critical = (rand < item_cri(user, item))
        make_damage_value(user, item)
        execute_damage(user)
      end
      item.effects.each {|effect| item_effect_apply(user, item, effect) }
      item_user_effect(user, item)
    end
  end
  #--------------------------------------------------------------------------
  # * Test Effect
  #--------------------------------------------------------------------------
  def item_effect_test(user, item, effect)
    case effect.code
    when EFFECT_RECOVER_HP
      hp < mhp || effect.value1 < 0 || effect.value2 < 0
    when EFFECT_RECOVER_MP
      mp < mmp || effect.value1 < 0 || effect.value2 < 0
    when EFFECT_ADD_STATE
      !state?(effect.data_id)
    when EFFECT_REMOVE_STATE
      state?(effect.data_id)
    when EFFECT_ADD_BUFF
      !buff_max?(effect.data_id)
    when EFFECT_ADD_DEBUFF
      !debuff_max?(effect.data_id)
    when EFFECT_REMOVE_BUFF
      buff?(effect.data_id)
    when EFFECT_REMOVE_DEBUFF
      debuff?(effect.data_id)
    when EFFECT_LEARN_SKILL
      actor? && !skills.include?($data_skills[effect.data_id])
    else
      true
    end
  end
  #--------------------------------------------------------------------------
  # * Apply Effect
  #--------------------------------------------------------------------------
  def item_effect_apply(user, item, effect)
    method_table = {
      EFFECT_RECOVER_HP    => :item_effect_recover_hp,
      EFFECT_RECOVER_MP    => :item_effect_recover_mp,
      EFFECT_GAIN_TP       => :item_effect_gain_tp,
      EFFECT_ADD_STATE     => :item_effect_add_state,
      EFFECT_REMOVE_STATE  => :item_effect_remove_state,
      EFFECT_ADD_BUFF      => :item_effect_add_buff,
      EFFECT_ADD_DEBUFF    => :item_effect_add_debuff,
      EFFECT_REMOVE_BUFF   => :item_effect_remove_buff,
      EFFECT_REMOVE_DEBUFF => :item_effect_remove_debuff,
      EFFECT_SPECIAL       => :item_effect_special,
      EFFECT_GROW          => :item_effect_grow,
      EFFECT_LEARN_SKILL   => :item_effect_learn_skill,
      EFFECT_COMMON_EVENT  => :item_effect_common_event,
    }
    method_name = method_table[effect.code]
    send(method_name, user, item, effect) if method_name
  end
  #--------------------------------------------------------------------------
  # * [HP Recovery] Effect
  #--------------------------------------------------------------------------
  def item_effect_recover_hp(user, item, effect)
    value = (mhp * effect.value1 + effect.value2) * rec
    value *= user.pha if item.is_a?(RPG::Item)
    value = value.to_i
    @result.hp_damage -= value
    @result.success = true
    self.hp += value
  end
  #--------------------------------------------------------------------------
  # * [MP Recovery] Effect
  #--------------------------------------------------------------------------
  def item_effect_recover_mp(user, item, effect)
    value = (mmp * effect.value1 + effect.value2) * rec
    value *= user.pha if item.is_a?(RPG::Item)
    value = value.to_i
    @result.mp_damage -= value
    @result.success = true if value != 0
    self.mp += value
  end
  #--------------------------------------------------------------------------
  # * [TP Gain] Effect
  #--------------------------------------------------------------------------
  def item_effect_gain_tp(user, item, effect)
    value = effect.value1.to_i
    @result.tp_damage -= value
    @result.success = true if value != 0
    self.tp += value
  end
  #--------------------------------------------------------------------------
  # * [Add State] Effect
  #--------------------------------------------------------------------------
  def item_effect_add_state(user, item, effect)
    if effect.data_id == 0
      item_effect_add_state_attack(user, item, effect)
    else
      item_effect_add_state_normal(user, item, effect)
    end
  end
  #--------------------------------------------------------------------------
  # * [Add State] Effect: Normal Attack
  #--------------------------------------------------------------------------
  def item_effect_add_state_attack(user, item, effect)
    user.atk_states.each do |state_id|
      chance = effect.value1
      chance *= state_rate(state_id)
      chance *= user.atk_states_rate(state_id)
      chance *= luk_effect_rate(user)
      if rand < chance
        add_state(state_id)
        @result.success = true
      end
    end
  end
  #--------------------------------------------------------------------------
  # * [Add State] Effect: Normal
  #--------------------------------------------------------------------------
  def item_effect_add_state_normal(user, item, effect)
    chance = effect.value1
    chance *= state_rate(effect.data_id) if opposite?(user)
    chance *= luk_effect_rate(user)      if opposite?(user)
    if rand < chance
      add_state(effect.data_id)
      @result.success = true
    end
  end
  #--------------------------------------------------------------------------
  # * [Remove State] Effect
  #--------------------------------------------------------------------------
  def item_effect_remove_state(user, item, effect)
    chance = effect.value1
    if rand < chance
      remove_state(effect.data_id)
      @result.success = true
    end
  end
  #--------------------------------------------------------------------------
  # * [Buff] Effect
  #--------------------------------------------------------------------------
  def item_effect_add_buff(user, item, effect)
    add_buff(effect.data_id, effect.value1)
    @result.success = true
  end
  #--------------------------------------------------------------------------
  # * [Debuff] Effect
  #--------------------------------------------------------------------------
  def item_effect_add_debuff(user, item, effect)
    chance = debuff_rate(effect.data_id) * luk_effect_rate(user)
    if rand < chance
      add_debuff(effect.data_id, effect.value1)
      @result.success = true
    end
  end
  #--------------------------------------------------------------------------
  # * [Remove Buff] Effect
  #--------------------------------------------------------------------------
  def item_effect_remove_buff(user, item, effect)
    remove_buff(effect.data_id) if @buffs[effect.data_id] > 0
    @result.success = true
  end
  #--------------------------------------------------------------------------
  # * [Remove Debuff] Effect
  #--------------------------------------------------------------------------
  def item_effect_remove_debuff(user, item, effect)
    remove_buff(effect.data_id) if @buffs[effect.data_id] < 0
    @result.success = true
  end
  #--------------------------------------------------------------------------
  # * [Special Effect] Effect
  #--------------------------------------------------------------------------
  def item_effect_special(user, item, effect)
    case effect.data_id
    when SPECIAL_EFFECT_ESCAPE
      escape
    end
    @result.success = true
  end
  #--------------------------------------------------------------------------
  # * [Raise Parameter] Effect
  #--------------------------------------------------------------------------
  def item_effect_grow(user, item, effect)
    add_param(effect.data_id, effect.value1.to_i)
    @result.success = true
  end
  #--------------------------------------------------------------------------
  # * [Learn Skill] Effect
  #--------------------------------------------------------------------------
  def item_effect_learn_skill(user, item, effect)
    learn_skill(effect.data_id) if actor?
    @result.success = true
  end
  #--------------------------------------------------------------------------
  # * [Common Event] Effect
  #--------------------------------------------------------------------------
  def item_effect_common_event(user, item, effect)
  end
  #--------------------------------------------------------------------------
  # * Effect of Skill/Item on Using Side
  #--------------------------------------------------------------------------
  def item_user_effect(user, item)
    user.tp += item.tp_gain * user.tcr
  end
  #--------------------------------------------------------------------------
  # * Get Effect Change Rate by Luck
  #--------------------------------------------------------------------------
  def luk_effect_rate(user)
    [1.0 + (user.luk - luk) * 0.001, 0.0].max
  end
  #--------------------------------------------------------------------------
  # * Determine if Hostile Relation
  #--------------------------------------------------------------------------
  def opposite?(battler)
    actor? != battler.actor? || battler.magic_reflection
  end
  #--------------------------------------------------------------------------
  # * Effect When Taking Damage on Map
  #--------------------------------------------------------------------------
  def perform_map_damage_effect
  end
  #--------------------------------------------------------------------------
  # * Initialize TP
  #--------------------------------------------------------------------------
  def init_tp
    self.tp = rand * 25
  end
  #--------------------------------------------------------------------------
  # * Clear TP
  #--------------------------------------------------------------------------
  def clear_tp
    self.tp = 0
  end
  #--------------------------------------------------------------------------
  # * Charge TP by Damage Suffered
  #--------------------------------------------------------------------------
  def charge_tp_by_damage(damage_rate)
    self.tp += 50 * damage_rate * tcr
  end
  #--------------------------------------------------------------------------
  # * Regenerate HP
  #--------------------------------------------------------------------------
  def regenerate_hp
    damage = -(mhp * hrg).to_i
    perform_map_damage_effect if $game_party.in_battle && damage > 0
    @result.hp_damage = [damage, max_slip_damage].min
    self.hp -= @result.hp_damage
  end
  #--------------------------------------------------------------------------
  # * Get Maximum Value of Slip Damage
  #--------------------------------------------------------------------------
  def max_slip_damage
    $data_system.opt_slip_death ? hp : [hp - 1, 0].max
  end
  #--------------------------------------------------------------------------
  # * Regenerate MP
  #--------------------------------------------------------------------------
  def regenerate_mp
    @result.mp_damage = -(mmp * mrg).to_i
    self.mp -= @result.mp_damage
  end
  #--------------------------------------------------------------------------
  # * Regenerate TP
  #--------------------------------------------------------------------------
  def regenerate_tp
    self.tp += 100 * trg
  end
  #--------------------------------------------------------------------------
  # * Regenerate All
  #--------------------------------------------------------------------------
  def regenerate_all
    if alive?
      regenerate_hp
      regenerate_mp
      regenerate_tp
    end
  end
  #--------------------------------------------------------------------------
  # * Processing at Start of Battle
  #--------------------------------------------------------------------------
  def on_battle_start
    init_tp unless preserve_tp?
  end
  #--------------------------------------------------------------------------
  # * Processing at End of Action
  #--------------------------------------------------------------------------
  def on_action_end
    @result.clear
    remove_states_auto(1)
    remove_buffs_auto
  end
  #--------------------------------------------------------------------------
  # * Processing at End of Turn
  #--------------------------------------------------------------------------
  def on_turn_end
    @result.clear
    regenerate_all
    update_state_turns
    update_buff_turns
    remove_states_auto(2)
  end
  #--------------------------------------------------------------------------
  # * Processing at End of Battle
  #--------------------------------------------------------------------------
  def on_battle_end
    @result.clear
    remove_battle_states
    remove_all_buffs
    clear_actions
    clear_tp unless preserve_tp?
    appear
  end
  #--------------------------------------------------------------------------
  # * Processing When Suffering Damage
  #--------------------------------------------------------------------------
  def on_damage(value)
    remove_states_by_damage
    charge_tp_by_damage(value.to_f / mhp)
  end
end
#==============================================================================
# ** Game_Actor
#------------------------------------------------------------------------------
#  This class handles actors. It is used within the Game_Actors class
# ($game_actors) and is also referenced from the Game_Party class ($game_party).
#==============================================================================

class Game_Actor < Game_Battler
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :name                     # Name
  attr_accessor :nickname                 # Nickname
  attr_reader   :character_name           # character graphic filename
  attr_reader   :character_index          # character graphic index
  attr_reader   :face_name                # face graphic filename
  attr_reader   :face_index               # face graphic index
  attr_reader   :class_id                 # class ID
  attr_reader   :level                    # level
  attr_reader   :action_input_index       # action number being input
  attr_reader   :last_skill               # For cursor memorization:  Skill
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(actor_id)
    super()
    setup(actor_id)
    @last_skill = Game_BaseItem.new
  end
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(actor_id)
    @actor_id = actor_id
    @name = actor.name
    @nickname = actor.nickname
    init_graphics
    @class_id = actor.class_id
    @level = actor.initial_level
    @exp = {}
    @equips = []
    init_exp
    init_skills
    init_equips(actor.equips)
    clear_param_plus
    recover_all
  end
  #--------------------------------------------------------------------------
  # * Get Actor Object
  #--------------------------------------------------------------------------
  def actor
    $data_actors[@actor_id]
  end
  #--------------------------------------------------------------------------
  # * Initialize Graphics
  #--------------------------------------------------------------------------
  def init_graphics
    @character_name = actor.character_name
    @character_index = actor.character_index
    @face_name = actor.face_name
    @face_index = actor.face_index
  end
  #--------------------------------------------------------------------------
  # * Get Total EXP Required for Rising to Specified Level
  #--------------------------------------------------------------------------
  def exp_for_level(level)
    self.class.exp_for_level(level)
  end
  #--------------------------------------------------------------------------
  # * Initialize EXP
  #--------------------------------------------------------------------------
  def init_exp
    @exp[@class_id] = current_level_exp
  end
  #--------------------------------------------------------------------------
  # * Get Experience
  #--------------------------------------------------------------------------
  def exp
    @exp[@class_id]
  end
  #--------------------------------------------------------------------------
  # * Get Minimum EXP for Current Level
  #--------------------------------------------------------------------------
  def current_level_exp
    exp_for_level(@level)
  end
  #--------------------------------------------------------------------------
  # * Get EXP for Next Level
  #--------------------------------------------------------------------------
  def next_level_exp
    exp_for_level(@level + 1)
  end
  #--------------------------------------------------------------------------
  # * Maximum Level
  #--------------------------------------------------------------------------
  def max_level
    actor.max_level
  end
  #--------------------------------------------------------------------------
  # * Determine Maximum Level
  #--------------------------------------------------------------------------
  def max_level?
    @level >= max_level
  end
  #--------------------------------------------------------------------------
  # * Initialize Skills
  #--------------------------------------------------------------------------
  def init_skills
    @skills = []
    self.class.learnings.each do |learning|
      learn_skill(learning.skill_id) if learning.level <= @level
    end
  end
  #--------------------------------------------------------------------------
  # * Initialize Equipment
  #     equips:  An array of initial equipment
  #--------------------------------------------------------------------------
  def init_equips(equips)
    @equips = Array.new(equip_slots.size) { Game_BaseItem.new }
    equips.each_with_index do |item_id, i|
      etype_id = index_to_etype_id(i)
      slot_id = empty_slot(etype_id)
      @equips[slot_id].set_equip(etype_id == 0, item_id) if slot_id
    end
    refresh
  end
  #--------------------------------------------------------------------------
  # * Convert Index Set by Editor to Equipment Type ID
  #--------------------------------------------------------------------------
  def index_to_etype_id(index)
    index == 1 && dual_wield? ? 0 : index
  end
  #--------------------------------------------------------------------------
  # * Convert from Equipment Type to List of Slot IDs
  #--------------------------------------------------------------------------
  def slot_list(etype_id)
    result = []
    equip_slots.each_with_index {|e, i| result.push(i) if e == etype_id }
    result
  end
  #--------------------------------------------------------------------------
  # * Convert from Equipment Type to Slot ID (Empty Take Precedence)
  #--------------------------------------------------------------------------
  def empty_slot(etype_id)
    list = slot_list(etype_id)
    list.find {|i| @equips[i].is_nil? } || list[0]
  end
  #--------------------------------------------------------------------------
  # * Get Equipment Slot Array
  #--------------------------------------------------------------------------
  def equip_slots
    return [0,0,2,3,4] if dual_wield?       # Dual wield
    return [0,1,2,3,4]                      # Normal
  end
  #--------------------------------------------------------------------------
  # * Get Weapon Object Array
  #--------------------------------------------------------------------------
  def weapons
    @equips.select {|item| item.is_weapon? }.collect {|item| item.object }
  end
  #--------------------------------------------------------------------------
  # * Get Armor Object Array
  #--------------------------------------------------------------------------
  def armors
    @equips.select {|item| item.is_armor? }.collect {|item| item.object }
  end
  #--------------------------------------------------------------------------
  # * Get Equipped Item Object Array
  #--------------------------------------------------------------------------
  def equips
    @equips.collect {|item| item.object }
  end
  #--------------------------------------------------------------------------
  # * Determine if Equipment Change Possible
  #     slot_id:  Equipment slot ID
  #--------------------------------------------------------------------------
  def equip_change_ok?(slot_id)
    return false if equip_type_fixed?(equip_slots[slot_id])
    return false if equip_type_sealed?(equip_slots[slot_id])
    return true
  end
  #--------------------------------------------------------------------------
  # * Change Equipment
  #     slot_id:  Equipment slot ID
  #     item:    Weapon/armor (remove equipment if nil)
  #--------------------------------------------------------------------------
  def change_equip(slot_id, item)
    return unless trade_item_with_party(item, equips[slot_id])
    return if item && equip_slots[slot_id] != item.etype_id
    @equips[slot_id].object = item
    refresh
  end
  #--------------------------------------------------------------------------
  # * Forcibly Change Equipment
  #     slot_id:  Equipment slot ID
  #     item:     Weapon/armor (remove equipment if nil)
  #--------------------------------------------------------------------------
  def force_change_equip(slot_id, item)
    @equips[slot_id].object = item
    release_unequippable_items(false)
    refresh
  end
  #--------------------------------------------------------------------------
  # * Trade Item with Party
  #     new_item:  Item to get from party
  #     old_item:  Item to give to party
  #--------------------------------------------------------------------------
  def trade_item_with_party(new_item, old_item)
    return false if new_item && !$game_party.has_item?(new_item)
    $game_party.gain_item(old_item, 1)
    $game_party.lose_item(new_item, 1)
    return true
  end
  #--------------------------------------------------------------------------
  # * Change Equipment (Specify with ID)
  #     slot_id:  Equipment slot ID
  #     item_id:  Weapons/armor ID
  #--------------------------------------------------------------------------
  def change_equip_by_id(slot_id, item_id)
    if equip_slots[slot_id] == 0
      change_equip(slot_id, $data_weapons[item_id])
    else
      change_equip(slot_id, $data_armors[item_id])
    end
  end
  #--------------------------------------------------------------------------
  # * Discard Equipment
  #     item:  Weapon/armor to discard
  #--------------------------------------------------------------------------
  def discard_equip(item)
    slot_id = equips.index(item)
    @equips[slot_id].object = nil if slot_id
  end
  #--------------------------------------------------------------------------
  # * Remove Equipment that Cannot Be Equipped
  #     item_gain:  Return removed equipment to party.
  #--------------------------------------------------------------------------
  def release_unequippable_items(item_gain = true)
    loop do
      last_equips = equips.dup
      @equips.each_with_index do |item, i|
        if !equippable?(item.object) || item.object.etype_id != equip_slots[i]
          trade_item_with_party(nil, item.object) if item_gain
          item.object = nil
        end
      end
      return if equips == last_equips
    end
  end
  #--------------------------------------------------------------------------
  # * Remove All Equipment
  #--------------------------------------------------------------------------
  def clear_equipments
    equip_slots.size.times do |i|
      change_equip(i, nil) if equip_change_ok?(i)
    end
  end
  #--------------------------------------------------------------------------
  # * Ultimate Equipment
  #--------------------------------------------------------------------------
  def optimize_equipments
    clear_equipments
    equip_slots.size.times do |i|
      next if !equip_change_ok?(i)
      items = $game_party.equip_items.select do |item|
        item.etype_id == equip_slots[i] &&
          equippable?(item) && item.performance >= 0
      end
      change_equip(i, items.max_by {|item| item.performance })
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if Skill-Required Weapon Is Equipped
  #--------------------------------------------------------------------------
  def skill_wtype_ok?(skill)
    wtype_id1 = skill.required_wtype_id1
    wtype_id2 = skill.required_wtype_id2
    return true if wtype_id1 == 0 && wtype_id2 == 0
    return true if wtype_id1 > 0 && wtype_equipped?(wtype_id1)
    return true if wtype_id2 > 0 && wtype_equipped?(wtype_id2)
    return false
  end
  #--------------------------------------------------------------------------
  # * Determine if Specific Type of Weapon Is Equipped
  #--------------------------------------------------------------------------
  def wtype_equipped?(wtype_id)
    weapons.any? {|weapon| weapon.wtype_id == wtype_id }
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    release_unequippable_items
    super
  end
  #--------------------------------------------------------------------------
  # * Determine if Actor or Not
  #--------------------------------------------------------------------------
  def actor?
    return true
  end
  #--------------------------------------------------------------------------
  # * Get Allied Units
  #--------------------------------------------------------------------------
  def friends_unit
    $game_party
  end
  #--------------------------------------------------------------------------
  # * Get Enemy Units
  #--------------------------------------------------------------------------
  def opponents_unit
    $game_troop
  end
  #--------------------------------------------------------------------------
  # * Get Actor ID
  #--------------------------------------------------------------------------
  def id
    @actor_id
  end
  #--------------------------------------------------------------------------
  # * Get Index
  #--------------------------------------------------------------------------
  def index
    $game_party.members.index(self)
  end
  #--------------------------------------------------------------------------
  # * Determine Battle Members
  #--------------------------------------------------------------------------
  def battle_member?
    $game_party.battle_members.include?(self)
  end
  #--------------------------------------------------------------------------
  # * Get Class Object
  #--------------------------------------------------------------------------
  def class
    $data_classes[@class_id]
  end
  #--------------------------------------------------------------------------
  # * Get Skill Object Array
  #--------------------------------------------------------------------------
  def skills
    (@skills | added_skills).sort.collect {|id| $data_skills[id] }
  end
  #--------------------------------------------------------------------------
  # * Get Array of Currently Usable Skills
  #--------------------------------------------------------------------------
  def usable_skills
    skills.select {|skill| usable?(skill) }
  end
  #--------------------------------------------------------------------------
  # * Get Array of All Objects Retaining Features
  #--------------------------------------------------------------------------
  def feature_objects
    super + [actor] + [self.class] + equips.compact
  end
  #--------------------------------------------------------------------------
  # * Get Attack Element
  #--------------------------------------------------------------------------
  def atk_elements
    set = super
    set |= [1] if weapons.compact.empty?  # Unarmed: Physical element
    return set
  end
  #--------------------------------------------------------------------------
  # * Get Maximum Value of Parameter
  #--------------------------------------------------------------------------
  def param_max(param_id)
    return 9999 if param_id == 0  # MHP
    return super
  end
  #--------------------------------------------------------------------------
  # * Get Base Value of Parameter
  #--------------------------------------------------------------------------
  def param_base(param_id)
    self.class.params[param_id, @level]
  end
  #--------------------------------------------------------------------------
  # * Get Added Value of Parameter
  #--------------------------------------------------------------------------
  def param_plus(param_id)
    equips.compact.inject(super) {|r, item| r += item.params[param_id] }
  end
  #--------------------------------------------------------------------------
  # * Get Normal Attack Animation ID
  #--------------------------------------------------------------------------
  def atk_animation_id1
    if dual_wield?
      return weapons[0].animation_id if weapons[0]
      return weapons[1] ? 0 : 1
    else
      return weapons[0] ? weapons[0].animation_id : 1
    end
  end
  #--------------------------------------------------------------------------
  # * Get Animation ID of Normal Attack (Dual Wield: Weapon 2)
  #--------------------------------------------------------------------------
  def atk_animation_id2
    if dual_wield?
      return weapons[1] ? weapons[1].animation_id : 0
    else
      return 0
    end
  end
  #--------------------------------------------------------------------------
  # * Change Experience
  #     show : Level up display flag
  #--------------------------------------------------------------------------
  def change_exp(exp, show)
    @exp[@class_id] = [exp, 0].max
    last_level = @level
    last_skills = skills
    level_up while !max_level? && self.exp >= next_level_exp
    level_down while self.exp < current_level_exp
    display_level_up(skills - last_skills) if show && @level > last_level
    refresh
  end
  #--------------------------------------------------------------------------
  # * Get Experience
  #--------------------------------------------------------------------------
  def exp
    @exp[@class_id]
  end
  #--------------------------------------------------------------------------
  # * Level Up
  #--------------------------------------------------------------------------
  def level_up
    @level += 1
    self.class.learnings.each do |learning|
      learn_skill(learning.skill_id) if learning.level == @level
    end
  end
  #--------------------------------------------------------------------------
  # * Level Down
  #--------------------------------------------------------------------------
  def level_down
    @level -= 1
  end
  #--------------------------------------------------------------------------
  # * Show Level Up Message
  #     new_skills : Array of newly learned skills
  #--------------------------------------------------------------------------
  def display_level_up(new_skills)
    $game_message.new_page
    $game_message.add(sprintf(Vocab::LevelUp, @name, Vocab::level, @level))
    new_skills.each do |skill|
      $game_message.add(sprintf(Vocab::ObtainSkill, skill.name))
    end
  end
  #--------------------------------------------------------------------------
  # * Get EXP (Account for Experience Rate)
  #--------------------------------------------------------------------------
  def gain_exp(exp)
    change_exp(self.exp + (exp * final_exp_rate).to_i, true)
  end
  #--------------------------------------------------------------------------
  # * Calculate Final EXP Rate
  #--------------------------------------------------------------------------
  def final_exp_rate
    exr * (battle_member? ? 1 : reserve_members_exp_rate)
  end
  #--------------------------------------------------------------------------
  # * Get EXP Rate for Reserve Members
  #--------------------------------------------------------------------------
  def reserve_members_exp_rate
    $data_system.opt_extra_exp ? 1 : 0
  end
  #--------------------------------------------------------------------------
  # * Change Level
  #     show : Level up display flag
  #--------------------------------------------------------------------------
  def change_level(level, show)
    level = [[level, max_level].min, 1].max
    change_exp(exp_for_level(level), show)
  end
  #--------------------------------------------------------------------------
  # * Learn Skill
  #--------------------------------------------------------------------------
  def learn_skill(skill_id)
    unless skill_learn?($data_skills[skill_id])
      @skills.push(skill_id)
      @skills.sort!
    end
  end
  #--------------------------------------------------------------------------
  # * Forget Skill
  #--------------------------------------------------------------------------
  def forget_skill(skill_id)
    @skills.delete(skill_id)
  end
  #--------------------------------------------------------------------------
  # * Determine if Skill Is Already Learned
  #--------------------------------------------------------------------------
  def skill_learn?(skill)
    skill.is_a?(RPG::Skill) && @skills.include?(skill.id)
  end
  #--------------------------------------------------------------------------
  # * Get Description
  #--------------------------------------------------------------------------
  def description
    actor.description
  end
  #--------------------------------------------------------------------------
  # * Change Class
  #     keep_exp:  Keep EXP
  #--------------------------------------------------------------------------
  def change_class(class_id, keep_exp = false)
    @exp[class_id] = exp if keep_exp
    @class_id = class_id
    change_exp(@exp[@class_id] || 0, false)
    refresh
  end
  #--------------------------------------------------------------------------
  # * Change Graphics
  #--------------------------------------------------------------------------
  def set_graphic(character_name, character_index, face_name, face_index)
    @character_name = character_name
    @character_index = character_index
    @face_name = face_name
    @face_index = face_index
  end
  #--------------------------------------------------------------------------
  # * Use Sprites?
  #--------------------------------------------------------------------------
  def use_sprite?
    return false
  end
  #--------------------------------------------------------------------------
  # * Execute Damage Effect
  #--------------------------------------------------------------------------
  def perform_damage_effect
    $game_troop.screen.start_shake(5, 5, 10)
    @sprite_effect_type = :blink
    Sound.play_actor_damage
  end
  #--------------------------------------------------------------------------
  # * Execute Collapse Effect
  #--------------------------------------------------------------------------
  def perform_collapse_effect
    if $game_party.in_battle
      @sprite_effect_type = :collapse
      Sound.play_actor_collapse
    end
  end
  #--------------------------------------------------------------------------
  # * Create Action Candidate List for Auto Battle
  #--------------------------------------------------------------------------
  def make_action_list
    list = []
    list.push(Game_Action.new(self).set_attack.evaluate)
    usable_skills.each do |skill|
      list.push(Game_Action.new(self).set_skill(skill.id).evaluate)
    end
    list
  end
  #--------------------------------------------------------------------------
  # * Create Action During Auto Battle
  #--------------------------------------------------------------------------
  def make_auto_battle_actions
    @actions.size.times do |i|
      @actions[i] = make_action_list.max_by {|action| action.value }
    end
  end
  #--------------------------------------------------------------------------
  # * Create Action During Confusion
  #--------------------------------------------------------------------------
  def make_confusion_actions
    @actions.size.times do |i|
      @actions[i].set_confusion
    end
  end
  #--------------------------------------------------------------------------
  # * Create Battle Action
  #--------------------------------------------------------------------------
  def make_actions
    super
    if auto_battle?
      make_auto_battle_actions
    elsif confusion?
      make_confusion_actions
    end
  end
  #--------------------------------------------------------------------------
  # * Processing Performed When Player Takes 1 Step
  #--------------------------------------------------------------------------
  def on_player_walk
    @result.clear
    check_floor_effect
    if $game_player.normal_walk?
      turn_end_on_map
      states.each {|state| update_state_steps(state) }
      show_added_states
      show_removed_states
    end
  end
  #--------------------------------------------------------------------------
  # * Update Step Count for State
  #--------------------------------------------------------------------------
  def update_state_steps(state)
    if state.remove_by_walking
      @state_steps[state.id] -= 1 if @state_steps[state.id] > 0
      remove_state(state.id) if @state_steps[state.id] == 0
    end
  end
  #--------------------------------------------------------------------------
  # * Show Added State
  #--------------------------------------------------------------------------
  def show_added_states
    @result.added_state_objects.each do |state|
      $game_message.add(name + state.message1) unless state.message1.empty?
    end
  end
  #--------------------------------------------------------------------------
  # * Show Removed State
  #--------------------------------------------------------------------------
  def show_removed_states
    @result.removed_state_objects.each do |state|
      $game_message.add(name + state.message4) unless state.message4.empty?
    end
  end
  #--------------------------------------------------------------------------
  # * Number of Steps Regarded as One Turn in Battle
  #--------------------------------------------------------------------------
  def steps_for_turn
    return 20
  end
  #--------------------------------------------------------------------------
  # * End of Turn Processing on Map Screen
  #--------------------------------------------------------------------------
  def turn_end_on_map
    if $game_party.steps % steps_for_turn == 0
      on_turn_end
      perform_map_damage_effect if @result.hp_damage > 0
    end
  end
  #--------------------------------------------------------------------------
  # * Determine Floor Effect
  #--------------------------------------------------------------------------
  def check_floor_effect
    execute_floor_damage if $game_player.on_damage_floor?
  end
  #--------------------------------------------------------------------------
  # * Floor Damage Processing
  #--------------------------------------------------------------------------
  def execute_floor_damage
    damage = (basic_floor_damage * fdr).to_i
    self.hp -= [damage, max_floor_damage].min
    perform_map_damage_effect if damage > 0
  end
  #--------------------------------------------------------------------------
  # * Get Base Value for Floor Damage
  #--------------------------------------------------------------------------
  def basic_floor_damage
    return 10
  end
  #--------------------------------------------------------------------------
  # * Get Maximum Value for Floor Damage
  #--------------------------------------------------------------------------
  def max_floor_damage
    $data_system.opt_floor_death ? hp : [hp - 1, 0].max
  end
  #--------------------------------------------------------------------------
  # * Execute Damage Effect on Map
  #--------------------------------------------------------------------------
  def perform_map_damage_effect
    $game_map.screen.start_flash_for_damage
  end
  #--------------------------------------------------------------------------
  # * Clear Actions
  #--------------------------------------------------------------------------
  def clear_actions
    super
    @action_input_index = 0
  end
  #--------------------------------------------------------------------------
  # * Get Action Being Input
  #--------------------------------------------------------------------------
  def input
    @actions[@action_input_index]
  end
  #--------------------------------------------------------------------------
  # * To Next Command Input
  #--------------------------------------------------------------------------
  def next_command
    return false if @action_input_index >= @actions.size - 1
    @action_input_index += 1
    return true
  end
  #--------------------------------------------------------------------------
  # * To Previous Command Input
  #--------------------------------------------------------------------------
  def prior_command
    return false if @action_input_index <= 0
    @action_input_index -= 1
    return true
  end
end
#==============================================================================
# ** Game_Enemy
#------------------------------------------------------------------------------
#  This class handles enemies. It used within the Game_Troop class
# ($game_troop).
#==============================================================================

class Game_Enemy < Game_Battler
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :index                    # index in troop
  attr_reader   :enemy_id                 # enemy ID
  attr_reader   :original_name            # original name
  attr_accessor :letter                   # letters to be attached to the name
  attr_accessor :plural                   # multiple appearance flag
  attr_accessor :screen_x                 # battle screen X coordinate
  attr_accessor :screen_y                 # battle screen Y coordinate
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(index, enemy_id)
    super()
    @index = index
    @enemy_id = enemy_id
    enemy = $data_enemies[@enemy_id]
    @original_name = enemy.name
    @letter = ""
    @plural = false
    @screen_x = 0
    @screen_y = 0
    @battler_name = enemy.battler_name
    @battler_hue = enemy.battler_hue
    @hp = mhp
    @mp = mmp
  end
  #--------------------------------------------------------------------------
  # * Determine if Enemy
  #--------------------------------------------------------------------------
  def enemy?
    return true
  end
  #--------------------------------------------------------------------------
  # * Get Allied Units
  #--------------------------------------------------------------------------
  def friends_unit
    $game_troop
  end
  #--------------------------------------------------------------------------
  # * Get Enemy Units
  #--------------------------------------------------------------------------
  def opponents_unit
    $game_party
  end
  #--------------------------------------------------------------------------
  # * Get Enemy Object
  #--------------------------------------------------------------------------
  def enemy
    $data_enemies[@enemy_id]
  end
  #--------------------------------------------------------------------------
  # * Get Array of All Objects Retaining Features
  #--------------------------------------------------------------------------
  def feature_objects
    super + [enemy]
  end
  #--------------------------------------------------------------------------
  # * Get Display Name
  #--------------------------------------------------------------------------
  def name
    @original_name + (@plural ? letter : "")
  end
  #--------------------------------------------------------------------------
  # * Get Base Value of Parameter
  #--------------------------------------------------------------------------
  def param_base(param_id)
    enemy.params[param_id]
  end
  #--------------------------------------------------------------------------
  # * Get Experience
  #--------------------------------------------------------------------------
  def exp
    enemy.exp
  end
  #--------------------------------------------------------------------------
  # * Get Gold
  #--------------------------------------------------------------------------
  def gold
    enemy.gold
  end
  #--------------------------------------------------------------------------
  # * Create Array of Dropped Items
  #--------------------------------------------------------------------------
  def make_drop_items
    enemy.drop_items.inject([]) do |r, di|
      if di.kind > 0 && rand * di.denominator < drop_item_rate
        r.push(item_object(di.kind, di.data_id))
      else
        r
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Get Multiplier for Dropped Item Acquisition Probability
  #--------------------------------------------------------------------------
  def drop_item_rate
    $game_party.drop_item_double? ? 2 : 1
  end
  #--------------------------------------------------------------------------
  # * Get Item Object
  #--------------------------------------------------------------------------
  def item_object(kind, data_id)
    return $data_items  [data_id] if kind == 1
    return $data_weapons[data_id] if kind == 2
    return $data_armors [data_id] if kind == 3
    return nil
  end
  #--------------------------------------------------------------------------
  # * Use Sprites?
  #--------------------------------------------------------------------------
  def use_sprite?
    return true
  end
  #--------------------------------------------------------------------------
  # * Get Battle Screen Z-Coordinate
  #--------------------------------------------------------------------------
  def screen_z
    return 100
  end
  #--------------------------------------------------------------------------
  # * Execute Damage Effect
  #--------------------------------------------------------------------------
  def perform_damage_effect
    @sprite_effect_type = :blink
    Sound.play_enemy_damage
  end
  #--------------------------------------------------------------------------
  # * Execute Collapse Effect
  #--------------------------------------------------------------------------
  def perform_collapse_effect
    case collapse_type
    when 0
      @sprite_effect_type = :collapse
      Sound.play_enemy_collapse
    when 1
      @sprite_effect_type = :boss_collapse
      Sound.play_boss_collapse1
    when 2
      @sprite_effect_type = :instant_collapse
    end
  end
  #--------------------------------------------------------------------------
  # * Transform
  #--------------------------------------------------------------------------
  def transform(enemy_id)
    @enemy_id = enemy_id
    if enemy.name != @original_name
      @original_name = enemy.name
      @letter = ""
      @plural = false
    end
    @battler_name = enemy.battler_name
    @battler_hue = enemy.battler_hue
    refresh
    make_actions unless @actions.empty?
  end
  #--------------------------------------------------------------------------
  # * Determine if Action Conditions Are Met
  #     action : RPG::Enemy::Action
  #--------------------------------------------------------------------------
  def conditions_met?(action)
    method_table = {
      1 => :conditions_met_turns?,
      2 => :conditions_met_hp?,
      3 => :conditions_met_mp?,
      4 => :conditions_met_state?,
      5 => :conditions_met_party_level?,
      6 => :conditions_met_switch?,
    }
    method_name = method_table[action.condition_type]
    if method_name
      send(method_name, action.condition_param1, action.condition_param2)
    else
      true
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if Action Conditions Are Met [Turns]
  #--------------------------------------------------------------------------
  def conditions_met_turns?(param1, param2)
    n = $game_troop.turn_count
    if param2 == 0
      n == param1
    else
      n > 0 && n >= param1 && n % param2 == param1 % param2
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if Action Conditions Are Met [HP]
  #--------------------------------------------------------------------------
  def conditions_met_hp?(param1, param2)
    hp_rate >= param1 && hp_rate <= param2
  end
  #--------------------------------------------------------------------------
  # * Determine if Action Conditions Are Met [MP]
  #--------------------------------------------------------------------------
  def conditions_met_mp?(param1, param2)
    mp_rate >= param1 && mp_rate <= param2
  end
  #--------------------------------------------------------------------------
  # * Determine if Action Conditions Are Met [State]
  #--------------------------------------------------------------------------
  def conditions_met_state?(param1, param2)
    state?(param1)
  end
  #--------------------------------------------------------------------------
  # * Determine if Action Conditions Are Met [Party Level]
  #--------------------------------------------------------------------------
  def conditions_met_party_level?(param1, param2)
    $game_party.highest_level >= param1
  end
  #--------------------------------------------------------------------------
  # * Determine if Action Conditions Are Met [Switch]
  #--------------------------------------------------------------------------
  def conditions_met_switch?(param1, param2)
    $game_switches[param1]
  end
  #--------------------------------------------------------------------------
  # * Determine if Action Is Valid in Current State
  #     action : RPG::Enemy::Action
  #--------------------------------------------------------------------------
  def action_valid?(action)
    conditions_met?(action) && usable?($data_skills[action.skill_id])
  end
  #--------------------------------------------------------------------------
  # * Randomly Select Action
  #     action_list:  RPG::Enemy::Action array
  #     rating_zero:  Rating value to consider as zero
  #--------------------------------------------------------------------------
  def select_enemy_action(action_list, rating_zero)
    sum = action_list.inject(0) {|r, a| r += a.rating - rating_zero }
    return nil if sum <= 0
    value = rand(sum)
    action_list.each do |action|
      return action if value < action.rating - rating_zero
      value -= action.rating - rating_zero
    end
  end
  #--------------------------------------------------------------------------
  # * Create Battle Action
  #--------------------------------------------------------------------------
  def make_actions
    super
    return if @actions.empty?
    action_list = enemy.actions.select {|a| action_valid?(a) }
    return if action_list.empty?
    rating_max = action_list.collect {|a| a.rating }.max
    rating_zero = rating_max - 3
    action_list.reject! {|a| a.rating <= rating_zero }
    @actions.each do |action|
      action.set_enemy_action(select_enemy_action(action_list, rating_zero))
    end
  end
end
#==============================================================================
# ** Game_Actors
#------------------------------------------------------------------------------
#  This is a wrapper for an actor array. Instances of this class are referenced
# by $game_actors.
#==============================================================================

class Game_Actors
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @data = []
  end
  #--------------------------------------------------------------------------
  # * Get Actor
  #--------------------------------------------------------------------------
  def [](actor_id)
    return nil unless $data_actors[actor_id]
    @data[actor_id] ||= Game_Actor.new(actor_id)
  end
end
#==============================================================================
# ** Game_Unit
#------------------------------------------------------------------------------
#  This class handles units. It's used as a superclass of the Game_Party and
# and Game_Troop classes.
#==============================================================================

class Game_Unit
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :in_battle                # in battle flag
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @in_battle = false
  end
  #--------------------------------------------------------------------------
  # * Get Members
  #--------------------------------------------------------------------------
  def members
    return []
  end
  #--------------------------------------------------------------------------
  # * Get Array of Living Members
  #--------------------------------------------------------------------------
  def alive_members
    members.select {|member| member.alive? }
  end
  #--------------------------------------------------------------------------
  # * Get Array of Incapacitated Members
  #--------------------------------------------------------------------------
  def dead_members
    members.select {|member| member.dead? }
  end
  #--------------------------------------------------------------------------
  # * Get Array of Movable Members
  #--------------------------------------------------------------------------
  def movable_members
    members.select {|member| member.movable? }
  end
  #--------------------------------------------------------------------------
  # * Clear all Members' Battle Actions
  #--------------------------------------------------------------------------
  def clear_actions
    members.each {|member| member.clear_actions }
  end
  #--------------------------------------------------------------------------
  # * Calculate Average Value of Agility
  #--------------------------------------------------------------------------
  def agi
    return 1 if members.size == 0
    members.inject(0) {|r, member| r += member.agi } / members.size
  end
  #--------------------------------------------------------------------------
  # * Calculate Total Target Rate
  #--------------------------------------------------------------------------
  def tgr_sum
    alive_members.inject(0) {|r, member| r + member.tgr }
  end
  #--------------------------------------------------------------------------
  # * Random Selection of Target
  #--------------------------------------------------------------------------
  def random_target
    tgr_rand = rand * tgr_sum
    alive_members.each do |member|
      tgr_rand -= member.tgr
      return member if tgr_rand < 0
    end
    alive_members[0]
  end
  #--------------------------------------------------------------------------
  # * Randomly Determine Target (K.O.)
  #--------------------------------------------------------------------------
  def random_dead_target
    dead_members.empty? ? nil : dead_members[rand(dead_members.size)]
  end
  #--------------------------------------------------------------------------
  # * Smooth Selection of Target
  #--------------------------------------------------------------------------
  def smooth_target(index)
    member = members[index]
    (member && member.alive?) ? member : alive_members[0]
  end
  #--------------------------------------------------------------------------
  # * Smooth Selection of Target (K.O.)
  #--------------------------------------------------------------------------
  def smooth_dead_target(index)
    member = members[index]
    (member && member.dead?) ? member : dead_members[0]
  end
  #--------------------------------------------------------------------------
  # * Clear Action Results
  #--------------------------------------------------------------------------
  def clear_results
    members.select {|member| member.result.clear }
  end
  #--------------------------------------------------------------------------
  # * Processing at Start of Battle
  #--------------------------------------------------------------------------
  def on_battle_start
    members.each {|member| member.on_battle_start }
    @in_battle = true
  end
  #--------------------------------------------------------------------------
  # * Processing at End of Battle
  #--------------------------------------------------------------------------
  def on_battle_end
    @in_battle = false
    members.each {|member| member.on_battle_end }
  end
  #--------------------------------------------------------------------------
  # * Create Battle Action
  #--------------------------------------------------------------------------
  def make_actions
    members.each {|member| member.make_actions }
  end
  #--------------------------------------------------------------------------
  # * Determine Everyone is Dead
  #--------------------------------------------------------------------------
  def all_dead?
    alive_members.empty?
  end
  #--------------------------------------------------------------------------
  # * Get Substitute Battler
  #--------------------------------------------------------------------------
  def substitute_battler
    members.find {|member| member.substitute? }
  end
end
#==============================================================================
# ** Game_Party
#------------------------------------------------------------------------------
#  This class handles parties. Information such as gold and items is included.
# Instances of this class are referenced by $game_party.
#==============================================================================

class Game_Party < Game_Unit
  #--------------------------------------------------------------------------
  # * Constants
  #--------------------------------------------------------------------------
  ABILITY_ENCOUNTER_HALF    = 0           # halve encounters
  ABILITY_ENCOUNTER_NONE    = 1           # disable encounters
  ABILITY_CANCEL_SURPRISE   = 2           # disable surprise
  ABILITY_RAISE_PREEMPTIVE  = 3           # increase preemptive strike rate
  ABILITY_GOLD_DOUBLE       = 4           # double money earned
  ABILITY_DROP_ITEM_DOUBLE  = 5           # double item acquisition rate
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :gold                     # party's gold
  attr_reader   :steps                    # number of steps
  attr_reader   :last_item                # for cursor memorization:  item
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super
    @gold = 0
    @steps = 0
    @last_item = Game_BaseItem.new
    @menu_actor_id = 0
    @target_actor_id = 0
    @actors = []
    init_all_items
  end
  #--------------------------------------------------------------------------
  # * Initialize All Item Lists
  #--------------------------------------------------------------------------
  def init_all_items
    @items = {}
    @weapons = {}
    @armors = {}
  end
  #--------------------------------------------------------------------------
  # * Determine Existence
  #--------------------------------------------------------------------------
  def exists
    !@actors.empty?
  end
  #--------------------------------------------------------------------------
  # * Get Members
  #--------------------------------------------------------------------------
  def members
    in_battle ? battle_members : all_members
  end
  #--------------------------------------------------------------------------
  # * Get All Members
  #--------------------------------------------------------------------------
  def all_members
    @actors.collect {|id| $game_actors[id] }
  end
  #--------------------------------------------------------------------------
  # * Get Battle Members
  #--------------------------------------------------------------------------
  def battle_members
    all_members[0, max_battle_members].select {|actor| actor.exist? }
  end
  #--------------------------------------------------------------------------
  # * Get Maximum Number of Battle Members
  #--------------------------------------------------------------------------
  def max_battle_members
    return 4
  end
  #--------------------------------------------------------------------------
  # * Get Leader
  #--------------------------------------------------------------------------
  def leader
    battle_members[0]
  end
  #--------------------------------------------------------------------------
  # * Get Item Object Array
  #--------------------------------------------------------------------------
  def items
    @items.keys.sort.collect {|id| $data_items[id] }
  end
  #--------------------------------------------------------------------------
  # * Get Weapon Object Array
  #--------------------------------------------------------------------------
  def weapons
    @weapons.keys.sort.collect {|id| $data_weapons[id] }
  end
  #--------------------------------------------------------------------------
  # * Get Armor Object Array
  #--------------------------------------------------------------------------
  def armors
    @armors.keys.sort.collect {|id| $data_armors[id] }
  end
  #--------------------------------------------------------------------------
  # * Get Array of All Equipment Objects
  #--------------------------------------------------------------------------
  def equip_items
    weapons + armors
  end
  #--------------------------------------------------------------------------
  # * Get Array of All Item Objects
  #--------------------------------------------------------------------------
  def all_items
    items + equip_items
  end
  #--------------------------------------------------------------------------
  # * Get Container Object Corresponding to Item Class
  #--------------------------------------------------------------------------
  def item_container(item_class)
    return @items   if item_class == RPG::Item
    return @weapons if item_class == RPG::Weapon
    return @armors  if item_class == RPG::Armor
    return nil
  end
  #--------------------------------------------------------------------------
  # * Initial Party Setup
  #--------------------------------------------------------------------------
  def setup_starting_members
    @actors = $data_system.party_members.clone
  end
  #--------------------------------------------------------------------------
  # * Get Party Name
  #    If there is only one, returns the actor's name.
  #    If there are more, returns "XX's Party".
  #--------------------------------------------------------------------------
  def name
    return ""           if battle_members.size == 0
    return leader.name  if battle_members.size == 1
    return sprintf(Vocab::PartyName, leader.name)
  end
  #--------------------------------------------------------------------------
  # * Set Up Battle Test
  #--------------------------------------------------------------------------
  def setup_battle_test
    setup_battle_test_members
    setup_battle_test_items
  end
  #--------------------------------------------------------------------------
  # * Battle Test Party Setup
  #--------------------------------------------------------------------------
  def setup_battle_test_members
    $data_system.test_battlers.each do |battler|
      actor = $game_actors[battler.actor_id]
      actor.change_level(battler.level, false)
      actor.init_equips(battler.equips)
      actor.recover_all
      add_actor(actor.id)
    end
  end
  #--------------------------------------------------------------------------
  # * Set Up Items for Battle Test
  #--------------------------------------------------------------------------
  def setup_battle_test_items
    $data_items.each do |item|
      gain_item(item, max_item_number(item)) if item && !item.name.empty?
    end
  end
  #--------------------------------------------------------------------------
  # * Get Highest Level of Party Members
  #--------------------------------------------------------------------------
  def highest_level
    lv = members.collect {|actor| actor.level }.max
  end
  #--------------------------------------------------------------------------
  # * Add an Actor
  #--------------------------------------------------------------------------
  def add_actor(actor_id)
    @actors.push(actor_id) unless @actors.include?(actor_id)
    $game_player.refresh
    $game_map.need_refresh = true
  end
  #--------------------------------------------------------------------------
  # * Remove Actor
  #--------------------------------------------------------------------------
  def remove_actor(actor_id)
    @actors.delete(actor_id)
    $game_player.refresh
    $game_map.need_refresh = true
  end
  #--------------------------------------------------------------------------
  # * Increase Gold
  #--------------------------------------------------------------------------
  def gain_gold(amount)
    @gold = [[@gold + amount, 0].max, max_gold].min
  end
  #--------------------------------------------------------------------------
  # * Decrease Gold
  #--------------------------------------------------------------------------
  def lose_gold(amount)
    gain_gold(-amount)
  end
  #--------------------------------------------------------------------------
  # * Get Maximum Value of Gold
  #--------------------------------------------------------------------------
  def max_gold
    return 99999999
  end
  #--------------------------------------------------------------------------
  # * Increase Steps
  #--------------------------------------------------------------------------
  def increase_steps
    @steps += 1
  end
  #--------------------------------------------------------------------------
  # * Get Number of Items Possessed
  #--------------------------------------------------------------------------
  def item_number(item)
    container = item_container(item.class)
    container ? container[item.id] || 0 : 0
  end
  #--------------------------------------------------------------------------
  # * Get Maximum Number of Items Possessed
  #--------------------------------------------------------------------------
  def max_item_number(item)
    return 99
  end
  #--------------------------------------------------------------------------
  # * Determine if Maximum Number of Items Are Possessed
  #--------------------------------------------------------------------------
  def item_max?(item)
    item_number(item) >= max_item_number(item)
  end
  #--------------------------------------------------------------------------
  # * Determine Item Possession Status
  #     include_equip : Include equipped items
  #--------------------------------------------------------------------------
  def has_item?(item, include_equip = false)
    return true if item_number(item) > 0
    return include_equip ? members_equip_include?(item) : false
  end
  #--------------------------------------------------------------------------
  # * Determine if Specified Item Is Included in Members' Equipment
  #--------------------------------------------------------------------------
  def members_equip_include?(item)
    members.any? {|actor| actor.equips.include?(item) }
  end
  #--------------------------------------------------------------------------
  # * Increase/Decrease Items
  #     include_equip : Include equipped items
  #--------------------------------------------------------------------------
  def gain_item(item, amount, include_equip = false)
    container = item_container(item.class)
    return unless container
    last_number = item_number(item)
    new_number = last_number + amount
    container[item.id] = [[new_number, 0].max, max_item_number(item)].min
    container.delete(item.id) if container[item.id] == 0
    if include_equip && new_number < 0
      discard_members_equip(item, -new_number)
    end
    $game_map.need_refresh = true
  end
  #--------------------------------------------------------------------------
  # * Discard Members' Equipment
  #--------------------------------------------------------------------------
  def discard_members_equip(item, amount)
    n = amount
    members.each do |actor|
      while n > 0 && actor.equips.include?(item)
        actor.discard_equip(item)
        n -= 1
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Lose Items
  #     include_equip : Include equipped items
  #--------------------------------------------------------------------------
  def lose_item(item, amount, include_equip = false)
    gain_item(item, -amount, include_equip)
  end
  #--------------------------------------------------------------------------
  # * Consume Items
  #    If the specified object is a consumable item, the number in investory
  #    will be reduced by 1.
  #--------------------------------------------------------------------------
  def consume_item(item)
    lose_item(item, 1) if item.is_a?(RPG::Item) && item.consumable
  end
  #--------------------------------------------------------------------------
  # * Determine Skill/Item Usability
  #--------------------------------------------------------------------------
  def usable?(item)
    members.any? {|actor| actor.usable?(item) }
  end
  #--------------------------------------------------------------------------
  # * Determine Command Inputability During Battle
  #--------------------------------------------------------------------------
  def inputable?
    members.any? {|actor| actor.inputable? }
  end
  #--------------------------------------------------------------------------
  # * Determine if Everyone is Dead
  #--------------------------------------------------------------------------
  def all_dead?
    super && ($game_party.in_battle || members.size > 0)
  end
  #--------------------------------------------------------------------------
  # * Processing Performed When Player Takes 1 Step
  #--------------------------------------------------------------------------
  def on_player_walk
    members.each {|actor| actor.on_player_walk }
  end
  #--------------------------------------------------------------------------
  # * Get Actor Selected on Menu Screen
  #--------------------------------------------------------------------------
  def menu_actor
    $game_actors[@menu_actor_id] || members[0]
  end
  #--------------------------------------------------------------------------
  # * Set Actor Selected on Menu Screen
  #--------------------------------------------------------------------------
  def menu_actor=(actor)
    @menu_actor_id = actor.id
  end
  #--------------------------------------------------------------------------
  # * Select Next Actor on Menu Screen
  #--------------------------------------------------------------------------
  def menu_actor_next
    index = members.index(menu_actor) || -1
    index = (index + 1) % members.size
    self.menu_actor = members[index]
  end
  #--------------------------------------------------------------------------
  # * Select Previous Actor on Menu Screen
  #--------------------------------------------------------------------------
  def menu_actor_prev
    index = members.index(menu_actor) || 1
    index = (index + members.size - 1) % members.size
    self.menu_actor = members[index]
  end
  #--------------------------------------------------------------------------
  # * Get Actor Targeted by Skill/Item Use
  #--------------------------------------------------------------------------
  def target_actor
    $game_actors[@target_actor_id] || members[0]
  end
  #--------------------------------------------------------------------------
  # * Set Actor Targeted by Skill/Item Use
  #--------------------------------------------------------------------------
  def target_actor=(actor)
    @target_actor_id = actor.id
  end
  #--------------------------------------------------------------------------
  # * Change Order
  #--------------------------------------------------------------------------
  def swap_order(index1, index2)
    @actors[index1], @actors[index2] = @actors[index2], @actors[index1]
    $game_player.refresh
  end
  #--------------------------------------------------------------------------
  # * Character Image Information for Save File Display
  #--------------------------------------------------------------------------
  def characters_for_savefile
    battle_members.collect do |actor|
      [actor.character_name, actor.character_index]
    end
  end
  #--------------------------------------------------------------------------
  # * Determine Party Ability
  #--------------------------------------------------------------------------
  def party_ability(ability_id)
    battle_members.any? {|actor| actor.party_ability(ability_id) }
  end
  #--------------------------------------------------------------------------
  # * Halve Encounters?
  #--------------------------------------------------------------------------
  def encounter_half?
    party_ability(ABILITY_ENCOUNTER_HALF)
  end
  #--------------------------------------------------------------------------
  # * Disable Encounters?
  #--------------------------------------------------------------------------
  def encounter_none?
    party_ability(ABILITY_ENCOUNTER_NONE)
  end
  #--------------------------------------------------------------------------
  # * Disable Surprise?
  #--------------------------------------------------------------------------
  def cancel_surprise?
    party_ability(ABILITY_CANCEL_SURPRISE)
  end
  #--------------------------------------------------------------------------
  # * Increase Preemptive Strike Rate?
  #--------------------------------------------------------------------------
  def raise_preemptive?
    party_ability(ABILITY_RAISE_PREEMPTIVE)
  end
  #--------------------------------------------------------------------------
  # * Double Money Earned?
  #--------------------------------------------------------------------------
  def gold_double?
    party_ability(ABILITY_GOLD_DOUBLE)
  end
  #--------------------------------------------------------------------------
  # * Double Item Acquisition Rate?
  #--------------------------------------------------------------------------
  def drop_item_double?
    party_ability(ABILITY_DROP_ITEM_DOUBLE)
  end
  #--------------------------------------------------------------------------
  # * Calculate Probability of Preemptive Attack
  #--------------------------------------------------------------------------
  def rate_preemptive(troop_agi)
    (agi >= troop_agi ? 0.05 : 0.03) * (raise_preemptive? ? 4 : 1)
  end
  #--------------------------------------------------------------------------
  # * Calculate Probability of Surprise
  #--------------------------------------------------------------------------
  def rate_surprise(troop_agi)
    cancel_surprise? ? 0 : (agi >= troop_agi ? 0.03 : 0.05)
  end
end
#==============================================================================
# ** Game_Troop
#------------------------------------------------------------------------------
#  This class handles enemy groups and battle-related data. Also performs
# battle events. The instance of this class is referenced by $game_troop.
#==============================================================================

class Game_Troop < Game_Unit
  #--------------------------------------------------------------------------
  # * Characters to be added to the end of enemy names
  #--------------------------------------------------------------------------
  LETTER_TABLE_HALF = [' A',' B',' C',' D',' E',' F',' G',' H',' I',' J',
                       ' K',' L',' M',' N',' O',' P',' Q',' R',' S',' T',
                       ' U',' V',' W',' X',' Y',' Z']
  LETTER_TABLE_FULL = ['Ａ','Ｂ','Ｃ','Ｄ','Ｅ','Ｆ','Ｇ','Ｈ','Ｉ','Ｊ',
                       'Ｋ','Ｌ','Ｍ','Ｎ','Ｏ','Ｐ','Ｑ','Ｒ','Ｓ','Ｔ',
                       'Ｕ','Ｖ','Ｗ','Ｘ','Ｙ','Ｚ']
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :screen                   # battle screen state
  attr_reader   :interpreter              # battle event interpreter
  attr_reader   :event_flags              # battle event executed flag
  attr_reader   :turn_count               # number of turns
  attr_reader   :name_counts              # hash for enemy name appearance
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super
    @screen = Game_Screen.new
    @interpreter = Game_Interpreter.new
    @event_flags = {}
    clear
  end
  #--------------------------------------------------------------------------
  # * Get Members
  #--------------------------------------------------------------------------
  def members
    @enemies
  end
  #--------------------------------------------------------------------------
  # * Clear
  #--------------------------------------------------------------------------
  def clear
    @screen.clear
    @interpreter.clear
    @event_flags.clear
    @enemies = []
    @turn_count = 0
    @names_count = {}
  end
  #--------------------------------------------------------------------------
  # * Get Troop Objects
  #--------------------------------------------------------------------------
  def troop
    $data_troops[@troop_id]
  end
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(troop_id)
    clear
    @troop_id = troop_id
    @enemies = []
    troop.members.each do |member|
      next unless $data_enemies[member.enemy_id]
      enemy = Game_Enemy.new(@enemies.size, member.enemy_id)
      enemy.hide if member.hidden
      enemy.screen_x = member.x
      enemy.screen_y = member.y
      @enemies.push(enemy)
    end
    init_screen_tone
    make_unique_names
  end
  #--------------------------------------------------------------------------
  # * Initialize Screen Tone
  #--------------------------------------------------------------------------
  def init_screen_tone
    @screen.start_tone_change($game_map.screen.tone, 0) if $game_map
  end
  #--------------------------------------------------------------------------
  # * Add letters (ABC, etc) to enemy characters with the same name
  #--------------------------------------------------------------------------
  def make_unique_names
    members.each do |enemy|
      next unless enemy.alive?
      next unless enemy.letter.empty?
      n = @names_count[enemy.original_name] || 0
      enemy.letter = letter_table[n % letter_table.size]
      @names_count[enemy.original_name] = n + 1
    end
    members.each do |enemy|
      n = @names_count[enemy.original_name] || 0
      enemy.plural = true if n >= 2
    end
  end
  #--------------------------------------------------------------------------
  # * Get Text Table to Place Behind Enemy Name
  #--------------------------------------------------------------------------
  def letter_table
    $game_system.japanese? ? LETTER_TABLE_FULL : LETTER_TABLE_HALF
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    @screen.update
  end
  #--------------------------------------------------------------------------
  # * Get Enemy Name Array
  #    For display at start of battle. Overlapping names are removed.
  #--------------------------------------------------------------------------
  def enemy_names
    names = []
    members.each do |enemy|
      next unless enemy.alive?
      next if names.include?(enemy.original_name)
      names.push(enemy.original_name)
    end
    names
  end
  #--------------------------------------------------------------------------
  # * Determine if Battle Event (Page) Conditions Are Met
  #--------------------------------------------------------------------------
  def conditions_met?(page)
    c = page.condition
    if !c.turn_ending && !c.turn_valid && !c.enemy_valid &&
        !c.actor_valid && !c.switch_valid
      return false      # Conditions not set: not executed
    end
    if @event_flags[page]
      return false      # Executed
    end
    if c.turn_ending    # At turn end
      return false unless BattleManager.turn_end?
    end
    if c.turn_valid     # Number of turns
      n = @turn_count
      a = c.turn_a
      b = c.turn_b
      return false if (b == 0 && n != a)
      return false if (b > 0 && (n < 1 || n < a || n % b != a % b))
    end
    if c.enemy_valid    # Enemy
      enemy = $game_troop.members[c.enemy_index]
      return false if enemy == nil
      return false if enemy.hp_rate * 100 > c.enemy_hp
    end
    if c.actor_valid    # Actor
      actor = $game_actors[c.actor_id]
      return false if actor == nil
      return false if actor.hp_rate * 100 > c.actor_hp
    end
    if c.switch_valid   # Switch
      return false if !$game_switches[c.switch_id]
    end
    return true         # Condition met
  end
  #--------------------------------------------------------------------------
  # * Battle Event Setup
  #--------------------------------------------------------------------------
  def setup_battle_event
    return if @interpreter.running?
    return if @interpreter.setup_reserved_common_event
    troop.pages.each do |page|
      next unless conditions_met?(page)
      @interpreter.setup(page.list)
      @event_flags[page] = true if page.span <= 1
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Increase Turns
  #--------------------------------------------------------------------------
  def increase_turn
    troop.pages.each {|page| @event_flags[page] = false if page.span == 1 }
    @turn_count += 1
  end
  #--------------------------------------------------------------------------
  # * Calculate Total Experience
  #--------------------------------------------------------------------------
  def exp_total
    dead_members.inject(0) {|r, enemy| r += enemy.exp }
  end
  #--------------------------------------------------------------------------
  # * Calculate Total Gold
  #--------------------------------------------------------------------------
  def gold_total
    dead_members.inject(0) {|r, enemy| r += enemy.gold } * gold_rate
  end
  #--------------------------------------------------------------------------
  # * Get Multiplier for Gold
  #--------------------------------------------------------------------------
  def gold_rate
    $game_party.gold_double? ? 2 : 1
  end
  #--------------------------------------------------------------------------
  # * Create Array of Dropped Items
  #--------------------------------------------------------------------------
  def make_drop_items
    dead_members.inject([]) {|r, enemy| r += enemy.make_drop_items }
  end
end
#==============================================================================
# ** Game_Map
#------------------------------------------------------------------------------
#  This class handles maps. It includes scrolling and passage determination
# functions. The instance of this class is referenced by $game_map.
#==============================================================================

class Game_Map
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :screen                   # map screen state
  attr_reader   :interpreter              # map event interpreter
  attr_reader   :events                   # events
  attr_reader   :display_x                # display X coordinate
  attr_reader   :display_y                # display Y coordinate
  attr_reader   :parallax_name            # parallax background filename
  attr_reader   :vehicles                 # vehicle
  attr_reader   :battleback1_name         # battle background (floor) filename
  attr_reader   :battleback2_name         # battle background (wall) filename
  attr_accessor :name_display             # map name display flag
  attr_accessor :need_refresh             # refresh request flag
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @screen = Game_Screen.new
    @interpreter = Game_Interpreter.new
    @map_id = 0
    @events = {}
    @display_x = 0
    @display_y = 0
    create_vehicles
    @name_display = true
  end
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(map_id)
    @map_id = map_id
    @map = load_data(sprintf("Data/Map%03d.rvdata2", @map_id))
    @tileset_id = @map.tileset_id
    @display_x = 0
    @display_y = 0
    referesh_vehicles
    setup_events
    setup_scroll
    setup_parallax
    setup_battleback
    @need_refresh = false
  end
  #--------------------------------------------------------------------------
  # * Create Vehicles
  #--------------------------------------------------------------------------
  def create_vehicles
    @vehicles = []
    @vehicles[0] = Game_Vehicle.new(:boat)
    @vehicles[1] = Game_Vehicle.new(:ship)
    @vehicles[2] = Game_Vehicle.new(:airship)
  end
  #--------------------------------------------------------------------------
  # * Refresh Vehicles
  #--------------------------------------------------------------------------
  def referesh_vehicles
    @vehicles.each {|vehicle| vehicle.refresh }
  end
  #--------------------------------------------------------------------------
  # * Get Vehicle
  #--------------------------------------------------------------------------
  def vehicle(type)
    return @vehicles[0] if type == :boat
    return @vehicles[1] if type == :ship
    return @vehicles[2] if type == :airship
    return nil
  end
  #--------------------------------------------------------------------------
  # * Get Boat
  #--------------------------------------------------------------------------
  def boat
    @vehicles[0]
  end
  #--------------------------------------------------------------------------
  # * Get Ship
  #--------------------------------------------------------------------------
  def ship
    @vehicles[1]
  end
  #--------------------------------------------------------------------------
  # * Get Airship
  #--------------------------------------------------------------------------
  def airship
    @vehicles[2]
  end
  #--------------------------------------------------------------------------
  # * Event Setup
  #--------------------------------------------------------------------------
  def setup_events
    @events = {}
    @map.events.each do |i, event|
      @events[i] = Game_Event.new(@map_id, event)
    end
    @common_events = parallel_common_events.collect do |common_event|
      Game_CommonEvent.new(common_event.id)
    end
    refresh_tile_events
  end
  #--------------------------------------------------------------------------
  # * Get Array of Parallel Common Events
  #--------------------------------------------------------------------------
  def parallel_common_events
    $data_common_events.select {|event| event && event.parallel? }
  end
  #--------------------------------------------------------------------------
  # * Scroll Setup
  #--------------------------------------------------------------------------
  def setup_scroll
    @scroll_direction = 2
    @scroll_rest = 0
    @scroll_speed = 4
  end
  #--------------------------------------------------------------------------
  # * Parallax Background Setup
  #--------------------------------------------------------------------------
  def setup_parallax
    @parallax_name = @map.parallax_name
    @parallax_loop_x = @map.parallax_loop_x
    @parallax_loop_y = @map.parallax_loop_y
    @parallax_sx = @map.parallax_sx
    @parallax_sy = @map.parallax_sy
    @parallax_x = 0
    @parallax_y = 0
  end
  #--------------------------------------------------------------------------
  # * Set Up Battle Background
  #--------------------------------------------------------------------------
  def setup_battleback
    if @map.specify_battleback
      @battleback1_name = @map.battleback1_name
      @battleback2_name = @map.battleback2_name
    else
      @battleback1_name = nil
      @battleback2_name = nil
    end
  end
  #--------------------------------------------------------------------------
  # * Set Display Position
  #--------------------------------------------------------------------------
  def set_display_pos(x, y)
    x = [0, [x, width - screen_tile_x].min].max unless loop_horizontal?
    y = [0, [y, height - screen_tile_y].min].max unless loop_vertical?
    @display_x = (x + width) % width
    @display_y = (y + height) % height
    @parallax_x = x
    @parallax_y = y
  end
  #--------------------------------------------------------------------------
  # * Calculate X Coordinate of Parallax Display Origin
  #--------------------------------------------------------------------------
  def parallax_ox(bitmap)
    if @parallax_loop_x
      @parallax_x * 16
    else
      w1 = [bitmap.width - Graphics.width, 0].max
      w2 = [width * 32 - Graphics.width, 1].max
      @parallax_x * 16 * w1 / w2
    end
  end
  #--------------------------------------------------------------------------
  # * Calculate Y Coordinate of Parallax Display Origin
  #--------------------------------------------------------------------------
  def parallax_oy(bitmap)
    if @parallax_loop_y
      @parallax_y * 16
    else
      h1 = [bitmap.height - Graphics.height, 0].max
      h2 = [height * 32 - Graphics.height, 1].max
      @parallax_y * 16 * h1 / h2
    end
  end
  #--------------------------------------------------------------------------
  # * Get Map ID
  #--------------------------------------------------------------------------
  def map_id
    @map_id
  end
  #--------------------------------------------------------------------------
  # * Get Tileset
  #--------------------------------------------------------------------------
  def tileset
    $data_tilesets[@tileset_id]
  end
  #--------------------------------------------------------------------------
  # * Get Display Name
  #--------------------------------------------------------------------------
  def display_name
    @map.display_name
  end
  #--------------------------------------------------------------------------
  # * Get Width
  #--------------------------------------------------------------------------
  def width
    @map.width
  end
  #--------------------------------------------------------------------------
  # * Get Height
  #--------------------------------------------------------------------------
  def height
    @map.height
  end
  #--------------------------------------------------------------------------
  # * Loop Horizontally?
  #--------------------------------------------------------------------------
  def loop_horizontal?
    @map.scroll_type == 2 || @map.scroll_type == 3
  end
  #--------------------------------------------------------------------------
  # * Loop Vertically?
  #--------------------------------------------------------------------------
  def loop_vertical?
    @map.scroll_type == 1 || @map.scroll_type == 3
  end
  #--------------------------------------------------------------------------
  # * Get Whether Dash is Disabled
  #--------------------------------------------------------------------------
  def disable_dash?
    @map.disable_dashing
  end
  #--------------------------------------------------------------------------
  # * Get Encounter List
  #--------------------------------------------------------------------------
  def encounter_list
    @map.encounter_list
  end
  #--------------------------------------------------------------------------
  # * Get Encounter Steps
  #--------------------------------------------------------------------------
  def encounter_step
    @map.encounter_step
  end
  #--------------------------------------------------------------------------
  # * Get Map Data
  #--------------------------------------------------------------------------
  def data
    @map.data
  end
  #--------------------------------------------------------------------------
  # * Determine if Field Type
  #--------------------------------------------------------------------------
  def overworld?
    tileset.mode == 0
  end
  #--------------------------------------------------------------------------
  # * Number of Horizontal Tiles on Screen
  #--------------------------------------------------------------------------
  def screen_tile_x
    Graphics.width / 32
  end
  #--------------------------------------------------------------------------
  # * Number of Vertical Tiles on Screen
  #--------------------------------------------------------------------------
  def screen_tile_y
    Graphics.height / 32
  end
  #--------------------------------------------------------------------------
  # * Calculate X Coordinate, Minus Display Coordinate
  #--------------------------------------------------------------------------
  def adjust_x(x)
    if loop_horizontal? && x < @display_x - (width - screen_tile_x) / 2
      x - @display_x + @map.width
    else
      x - @display_x
    end
  end
  #--------------------------------------------------------------------------
  # * Calculate Y Coordinate, Minus Display Coordinate
  #--------------------------------------------------------------------------
  def adjust_y(y)
    if loop_vertical? && y < @display_y - (height - screen_tile_y) / 2
      y - @display_y + @map.height
    else
      y - @display_y
    end
  end
  #--------------------------------------------------------------------------
  # * Calculate X Coordinate After Loop Adjustment
  #--------------------------------------------------------------------------
  def round_x(x)
    loop_horizontal? ? (x + width) % width : x
  end
  #--------------------------------------------------------------------------
  # * Calculate Y Coordinate After Loop Adjustment
  #--------------------------------------------------------------------------
  def round_y(y)
    loop_vertical? ? (y + height) % height : y
  end
  #--------------------------------------------------------------------------
  # * Calculate X Coordinate Shifted One Tile in Specific Direction
  #   (No Loop Adjustment)
  #--------------------------------------------------------------------------
  def x_with_direction(x, d)
    x + (d == 6 ? 1 : d == 4 ? -1 : 0)
  end
  #--------------------------------------------------------------------------
  # * Calculate Y Coordinate Shifted One Tile in Specific Direction
  #   (No Loop Adjustment)
  #--------------------------------------------------------------------------
  def y_with_direction(y, d)
    y + (d == 2 ? 1 : d == 8 ? -1 : 0)
  end
  #--------------------------------------------------------------------------
  # * Calculate X Coordinate Shifted One Tile in Specific Direction
  #   (With Loop Adjustment)
  #--------------------------------------------------------------------------
  def round_x_with_direction(x, d)
    round_x(x + (d == 6 ? 1 : d == 4 ? -1 : 0))
  end
  #--------------------------------------------------------------------------
  # * Calculate Y Coordinate Shifted One Tile in Specific Direction
  #   (With Loop Adjustment)
  #--------------------------------------------------------------------------
  def round_y_with_direction(y, d)
    round_y(y + (d == 2 ? 1 : d == 8 ? -1 : 0))
  end
  #--------------------------------------------------------------------------
  # * Automatically Switch BGM and BGS
  #--------------------------------------------------------------------------
  def autoplay
    @map.bgm.play if @map.autoplay_bgm
    @map.bgs.play if @map.autoplay_bgs
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    @events.each_value {|event| event.refresh }
    @common_events.each {|event| event.refresh }
    refresh_tile_events
    @need_refresh = false
  end
  #--------------------------------------------------------------------------
  # * Refresh Array of Tile-Handling Events
  #--------------------------------------------------------------------------
  def refresh_tile_events
    @tile_events = @events.values.select {|event| event.tile? }
  end
  #--------------------------------------------------------------------------
  # * Get Array of Events at Designated Coordinates
  #--------------------------------------------------------------------------
  def events_xy(x, y)
    @events.values.select {|event| event.pos?(x, y) }
  end
  #--------------------------------------------------------------------------
  # * Get Array of Events at Designated Coordinates (Except Pass-Through)
  #--------------------------------------------------------------------------
  def events_xy_nt(x, y)
    @events.values.select {|event| event.pos_nt?(x, y) }
  end
  #--------------------------------------------------------------------------
  # * Get Array of Tile-Handling Events at Designated Coordinates
  #   (Except Pass-Through)
  #--------------------------------------------------------------------------
  def tile_events_xy(x, y)
    @tile_events.select {|event| event.pos_nt?(x, y) }
  end
  #--------------------------------------------------------------------------
  # * Get ID of Events at Designated Coordinates (One Only)
  #--------------------------------------------------------------------------
  def event_id_xy(x, y)
    list = events_xy(x, y)
    list.empty? ? 0 : list[0].id
  end
  #--------------------------------------------------------------------------
  # * Scroll Down
  #--------------------------------------------------------------------------
  def scroll_down(distance)
    if loop_vertical?
      @display_y += distance
      @display_y %= @map.height
      @parallax_y += distance if @parallax_loop_y
    else
      last_y = @display_y
      @display_y = [@display_y + distance, height - screen_tile_y].min
      @parallax_y += @display_y - last_y
    end
  end
  #--------------------------------------------------------------------------
  # * Scroll Left
  #--------------------------------------------------------------------------
  def scroll_left(distance)
    if loop_horizontal?
      @display_x += @map.width - distance
      @display_x %= @map.width
      @parallax_x -= distance if @parallax_loop_x
    else
      last_x = @display_x
      @display_x = [@display_x - distance, 0].max
      @parallax_x += @display_x - last_x
    end
  end
  #--------------------------------------------------------------------------
  # * Scroll Right
  #--------------------------------------------------------------------------
  def scroll_right(distance)
    if loop_horizontal?
      @display_x += distance
      @display_x %= @map.width
      @parallax_x += distance if @parallax_loop_x
    else
      last_x = @display_x
      @display_x = [@display_x + distance, (width - screen_tile_x)].min
      @parallax_x += @display_x - last_x
    end
  end
  #--------------------------------------------------------------------------
  # * Scroll Up
  #--------------------------------------------------------------------------
  def scroll_up(distance)
    if loop_vertical?
      @display_y += @map.height - distance
      @display_y %= @map.height
      @parallax_y -= distance if @parallax_loop_y
    else
      last_y = @display_y
      @display_y = [@display_y - distance, 0].max
      @parallax_y += @display_y - last_y
    end
  end
  #--------------------------------------------------------------------------
  # * Determine Valid Coordinates
  #--------------------------------------------------------------------------
  def valid?(x, y)
    x >= 0 && x < width && y >= 0 && y < height
  end
  #--------------------------------------------------------------------------
  # * Check Passage
  #     bit:  Inhibit passage check bit
  #--------------------------------------------------------------------------
  def check_passage(x, y, bit)
    all_tiles(x, y).each do |tile_id|
      flag = tileset.flags[tile_id]
      next if flag & 0x10 != 0            # [☆]: No effect on passage
      return true  if flag & bit == 0     # [○] : Passable
      return false if flag & bit == bit   # [×] : Impassable
    end
    return false                          # Impassable
  end
  #--------------------------------------------------------------------------
  # * Get Tile ID at Specified Coordinates
  #--------------------------------------------------------------------------
  def tile_id(x, y, z)
    @map.data[x, y, z] || 0
  end
  #--------------------------------------------------------------------------
  # * Get Array of All Layer Tiles (Top to Bottom) at Specified Coordinates
  #--------------------------------------------------------------------------
  def layered_tiles(x, y)
    [2, 1, 0].collect {|z| tile_id(x, y, z) }
  end
  #--------------------------------------------------------------------------
  # * Get Array of All Tiles (Including Events) at Specified Coordinates
  #--------------------------------------------------------------------------
  def all_tiles(x, y)
    tile_events_xy(x, y).collect {|ev| ev.tile_id } + layered_tiles(x, y)
  end
  #--------------------------------------------------------------------------
  # * Get Type of Auto Tile at Specified Coordinates
  #--------------------------------------------------------------------------
  def autotile_type(x, y, z)
    tile_id(x, y, z) >= 2048 ? (tile_id(x, y, z) - 2048) / 48 : -1
  end
  #--------------------------------------------------------------------------
  # * Determine Passability of Normal Character
  #     d:  direction (2,4,6,8)
  #    Determines whether the tile at the specified coordinates is passable
  #    in the specified direction.
  #--------------------------------------------------------------------------
  def passable?(x, y, d)
    check_passage(x, y, (1 << (d / 2 - 1)) & 0x0f)
  end
  #--------------------------------------------------------------------------
  # * Determine if Passable by Boat
  #--------------------------------------------------------------------------
  def boat_passable?(x, y)
    check_passage(x, y, 0x0200)
  end
  #--------------------------------------------------------------------------
  # * Determine if Passable by Ship
  #--------------------------------------------------------------------------
  def ship_passable?(x, y)
    check_passage(x, y, 0x0400)
  end
  #--------------------------------------------------------------------------
  # * Determine if Airship can Land
  #--------------------------------------------------------------------------
  def airship_land_ok?(x, y)
    check_passage(x, y, 0x0800) && check_passage(x, y, 0x0f)
  end
  #--------------------------------------------------------------------------
  # * Determine Flag for All Layers at Specified Coordinates
  #--------------------------------------------------------------------------
  def layered_tiles_flag?(x, y, bit)
    layered_tiles(x, y).any? {|tile_id| tileset.flags[tile_id] & bit != 0 }
  end
  #--------------------------------------------------------------------------
  # * Determine if Ladder
  #--------------------------------------------------------------------------
  def ladder?(x, y)
    valid?(x, y) && layered_tiles_flag?(x, y, 0x20)
  end
  #--------------------------------------------------------------------------
  # * Determine if Bush
  #--------------------------------------------------------------------------
  def bush?(x, y)
    valid?(x, y) && layered_tiles_flag?(x, y, 0x40)
  end
  #--------------------------------------------------------------------------
  # * Determine if Counter
  #--------------------------------------------------------------------------
  def counter?(x, y)
    valid?(x, y) && layered_tiles_flag?(x, y, 0x80)
  end
  #--------------------------------------------------------------------------
  # * Determine if Damage Floor
  #--------------------------------------------------------------------------
  def damage_floor?(x, y)
    valid?(x, y) && layered_tiles_flag?(x, y, 0x100)
  end
  #--------------------------------------------------------------------------
  # * Get Terrain Tag
  #--------------------------------------------------------------------------
  def terrain_tag(x, y)
    return 0 unless valid?(x, y)
    layered_tiles(x, y).each do |tile_id|
      tag = tileset.flags[tile_id] >> 12
      return tag if tag > 0
    end
    return 0
  end
  #--------------------------------------------------------------------------
  # * Get Region ID
  #--------------------------------------------------------------------------
  def region_id(x, y)
    valid?(x, y) ? @map.data[x, y, 3] >> 8 : 0
  end
  #--------------------------------------------------------------------------
  # * Start Scroll
  #--------------------------------------------------------------------------
  def start_scroll(direction, distance, speed)
    @scroll_direction = direction
    @scroll_rest = distance
    @scroll_speed = speed
  end
  #--------------------------------------------------------------------------
  # * Determine if Scrolling
  #--------------------------------------------------------------------------
  def scrolling?
    @scroll_rest > 0
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #     main:  Interpreter update flag
  #--------------------------------------------------------------------------
  def update(main = false)
    refresh if @need_refresh
    update_interpreter if main
    update_scroll
    update_events
    update_vehicles
    update_parallax
    @screen.update
  end
  #--------------------------------------------------------------------------
  # * Update Scroll
  #--------------------------------------------------------------------------
  def update_scroll
    return unless scrolling?
    last_x = @display_x
    last_y = @display_y
    do_scroll(@scroll_direction, scroll_distance)
    if @display_x == last_x && @display_y == last_y
      @scroll_rest = 0
    else
      @scroll_rest -= scroll_distance
    end
  end
  #--------------------------------------------------------------------------
  # * Calculate Scroll Distance
  #--------------------------------------------------------------------------
  def scroll_distance
    2 ** @scroll_speed / 256.0
  end
  #--------------------------------------------------------------------------
  # * Execute Scroll
  #--------------------------------------------------------------------------
  def do_scroll(direction, distance)
    case direction
    when 2;  scroll_down (distance)
    when 4;  scroll_left (distance)
    when 6;  scroll_right(distance)
    when 8;  scroll_up   (distance)
    end
  end
  #--------------------------------------------------------------------------
  # * Update Events
  #--------------------------------------------------------------------------
  def update_events
    @events.each_value {|event| event.update }
    @common_events.each {|event| event.update }
  end
  #--------------------------------------------------------------------------
  # * Update Vehicles
  #--------------------------------------------------------------------------
  def update_vehicles
    @vehicles.each {|vehicle| vehicle.update }
  end
  #--------------------------------------------------------------------------
  # * Update Parallax
  #--------------------------------------------------------------------------
  def update_parallax
    @parallax_x += @parallax_sx / 64.0 if @parallax_loop_x
    @parallax_y += @parallax_sy / 64.0 if @parallax_loop_y
  end
  #--------------------------------------------------------------------------
  # * Change Tileset
  #--------------------------------------------------------------------------
  def change_tileset(tileset_id)
    @tileset_id = tileset_id
    refresh
  end
  #--------------------------------------------------------------------------
  # * Change Battle Background
  #--------------------------------------------------------------------------
  def change_battleback(battleback1_name, battleback2_name)
    @battleback1_name = battleback1_name
    @battleback2_name = battleback2_name
  end
  #--------------------------------------------------------------------------
  # * Change Parallax Background
  #--------------------------------------------------------------------------
  def change_parallax(name, loop_x, loop_y, sx, sy)
    @parallax_name = name
    @parallax_x = 0 if @parallax_loop_x && !loop_x
    @parallax_y = 0 if @parallax_loop_y && !loop_y
    @parallax_loop_x = loop_x
    @parallax_loop_y = loop_y
    @parallax_sx = sx
    @parallax_sy = sy
  end
  #--------------------------------------------------------------------------
  # * Update Interpreter
  #--------------------------------------------------------------------------
  def update_interpreter
    loop do
      @interpreter.update
      return if @interpreter.running?
      if @interpreter.event_id > 0
        unlock_event(@interpreter.event_id)
        @interpreter.clear
      end
      return unless setup_starting_event
    end
  end
  #--------------------------------------------------------------------------
  # * Unlock Event
  #--------------------------------------------------------------------------
  def unlock_event(event_id)
    @events[event_id].unlock if @events[event_id]
  end
  #--------------------------------------------------------------------------
  # * Starting Event Setup
  #--------------------------------------------------------------------------
  def setup_starting_event
    refresh if @need_refresh
    return true if @interpreter.setup_reserved_common_event
    return true if setup_starting_map_event
    return true if setup_autorun_common_event
    return false
  end
  #--------------------------------------------------------------------------
  # * Determine Existence of Starting Map Event
  #--------------------------------------------------------------------------
  def any_event_starting?
    @events.values.any? {|event| event.starting }
  end
  #--------------------------------------------------------------------------
  # * Detect/Set Up Starting Map Event
  #--------------------------------------------------------------------------
  def setup_starting_map_event
    event = @events.values.find {|event| event.starting }
    event.clear_starting_flag if event
    @interpreter.setup(event.list, event.id) if event
    event
  end
  #--------------------------------------------------------------------------
  # * Detect/Set Up Autorun Common Event
  #--------------------------------------------------------------------------
  def setup_autorun_common_event
    event = $data_common_events.find do |event|
      event && event.autorun? && $game_switches[event.switch_id]
    end
    @interpreter.setup(event.list) if event
    event
  end
end
#==============================================================================
# ** Game_CommonEvent
#------------------------------------------------------------------------------
#  This class handles common events. It includes functionality for execution of
# parallel process events. It's used within the Game_Map class ($game_map).
#==============================================================================

class Game_CommonEvent
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(common_event_id)
    @event = $data_common_events[common_event_id]
    refresh
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    if active?
      @interpreter ||= Game_Interpreter.new
    else
      @interpreter = nil
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if Active State
  #--------------------------------------------------------------------------
  def active?
    @event.parallel? && $game_switches[@event.switch_id]
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    if @interpreter
      @interpreter.setup(@event.list) unless @interpreter.running?
      @interpreter.update
    end
  end
end
#==============================================================================
# ** Game_CharacterBase
#------------------------------------------------------------------------------
#  This base class handles characters. It retains basic information, such as
# coordinates and graphics, shared by all characters.
#==============================================================================

class Game_CharacterBase
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :id                       # ID
  attr_reader   :x                        # map X coordinate (logical)
  attr_reader   :y                        # map Y coordinate (logical)
  attr_reader   :real_x                   # map X coordinate (real)
  attr_reader   :real_y                   # map Y coordinate (real)
  attr_reader   :tile_id                  # tile ID (invalid if 0)
  attr_reader   :character_name           # character graphic filename
  attr_reader   :character_index          # character graphic index
  attr_reader   :move_speed               # movement speed
  attr_reader   :move_frequency           # movement frequency
  attr_reader   :walk_anime               # walking animation
  attr_reader   :step_anime               # stepping animation
  attr_reader   :direction_fix            # direction fix
  attr_reader   :opacity                  # opacity level
  attr_reader   :blend_type               # blending method
  attr_reader   :direction                # direction
  attr_reader   :pattern                  # pattern
  attr_reader   :priority_type            # priority type
  attr_reader   :through                  # pass-through
  attr_reader   :bush_depth               # bush depth
  attr_accessor :animation_id             # animation ID
  attr_accessor :balloon_id               # balloon icon ID
  attr_accessor :transparent              # transparency flag
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    init_public_members
    init_private_members
  end
  #--------------------------------------------------------------------------
  # * Initialize Public Member Variables
  #--------------------------------------------------------------------------
  def init_public_members
    @id = 0
    @x = 0
    @y = 0
    @real_x = 0
    @real_y = 0
    @tile_id = 0
    @character_name = ""
    @character_index = 0
    @move_speed = 4
    @move_frequency = 6
    @walk_anime = true
    @step_anime = false
    @direction_fix = false
    @opacity = 255
    @blend_type = 0
    @direction = 2
    @pattern = 1
    @priority_type = 1
    @through = false
    @bush_depth = 0
    @animation_id = 0
    @balloon_id = 0
    @transparent = false
  end
  #--------------------------------------------------------------------------
  # * Initialize Private Member Variables
  #--------------------------------------------------------------------------
  def init_private_members
    @original_direction = 2               # Original direction
    @original_pattern = 1                 # Original pattern
    @anime_count = 0                      # Animation count
    @stop_count = 0                       # Stop count
    @jump_count = 0                       # Jump count
    @jump_peak = 0                        # Jump peak count
    @locked = false                       # Locked flag
    @prelock_direction = 0                # Direction before lock
    @move_succeed = true                  # Move success flag
  end
  #--------------------------------------------------------------------------
  # * Determine Coordinate Match
  #--------------------------------------------------------------------------
  def pos?(x, y)
    @x == x && @y == y
  end
  #--------------------------------------------------------------------------
  # * Determine if Coordinates Match and Pass-Through Is Off (nt = No Through)
  #--------------------------------------------------------------------------
  def pos_nt?(x, y)
    pos?(x, y) && !@through
  end
  #--------------------------------------------------------------------------
  # * Determine if [Same as Characters] Priority
  #--------------------------------------------------------------------------
  def normal_priority?
    @priority_type == 1
  end
  #--------------------------------------------------------------------------
  # * Determine if Moving
  #--------------------------------------------------------------------------
  def moving?
    @real_x != @x || @real_y != @y
  end
  #--------------------------------------------------------------------------
  # * Determine if Jumping
  #--------------------------------------------------------------------------
  def jumping?
    @jump_count > 0
  end
  #--------------------------------------------------------------------------
  # * Calculate Jump Height
  #--------------------------------------------------------------------------
  def jump_height
    (@jump_peak * @jump_peak - (@jump_count - @jump_peak).abs ** 2) / 2
  end
  #--------------------------------------------------------------------------
  # * Determine if Stopping
  #--------------------------------------------------------------------------
  def stopping?
    !moving? && !jumping?
  end
  #--------------------------------------------------------------------------
  # * Get Move Speed (Account for Dash)
  #--------------------------------------------------------------------------
  def real_move_speed
    @move_speed + (dash? ? 1 : 0)
  end
  #--------------------------------------------------------------------------
  # * Calculate Move Distance per Frame
  #--------------------------------------------------------------------------
  def distance_per_frame
    2 ** real_move_speed / 256.0
  end
  #--------------------------------------------------------------------------
  # * Determine if Dashing
  #--------------------------------------------------------------------------
  def dash?
    return false
  end
  #--------------------------------------------------------------------------
  # * Determine if Debug Pass-Through State
  #--------------------------------------------------------------------------
  def debug_through?
    return false
  end
  #--------------------------------------------------------------------------
  # * Straighten Position
  #--------------------------------------------------------------------------
  def straighten
    @pattern = 1 if @walk_anime || @step_anime
    @anime_count = 0
  end
  #--------------------------------------------------------------------------
  # * Get Opposite Direction
  #     d : Direction (2,4,6,8)
  #--------------------------------------------------------------------------
  def reverse_dir(d)
    return 10 - d
  end
  #--------------------------------------------------------------------------
  # * Determine if Passable
  #     d : Direction (2,4,6,8)
  #--------------------------------------------------------------------------
  def passable?(x, y, d)
    x2 = $game_map.round_x_with_direction(x, d)
    y2 = $game_map.round_y_with_direction(y, d)
    return false unless $game_map.valid?(x2, y2)
    return true if @through || debug_through?
    return false unless map_passable?(x, y, d)
    return false unless map_passable?(x2, y2, reverse_dir(d))
    return false if collide_with_characters?(x2, y2)
    return true
  end
  #--------------------------------------------------------------------------
  # * Determine Diagonal Passability
  #     horz : Horizontal (4 or 6)
  #     vert : Vertical (2 or 8)
  #--------------------------------------------------------------------------
  def diagonal_passable?(x, y, horz, vert)
    x2 = $game_map.round_x_with_direction(x, horz)
    y2 = $game_map.round_y_with_direction(y, vert)
    (passable?(x, y, vert) && passable?(x, y2, horz)) ||
      (passable?(x, y, horz) && passable?(x2, y, vert))
  end
  #--------------------------------------------------------------------------
  # * Determine if Map is Passable
  #     d : Direction (2,4,6,8)
  #--------------------------------------------------------------------------
  def map_passable?(x, y, d)
    $game_map.passable?(x, y, d)
  end
  #--------------------------------------------------------------------------
  # * Detect Collision with Character
  #--------------------------------------------------------------------------
  def collide_with_characters?(x, y)
    collide_with_events?(x, y) || collide_with_vehicles?(x, y)
  end
  #--------------------------------------------------------------------------
  # * Detect Collision with Event
  #--------------------------------------------------------------------------
  def collide_with_events?(x, y)
    $game_map.events_xy_nt(x, y).any? do |event|
      event.normal_priority? || self.is_a?(Game_Event)
    end
  end
  #--------------------------------------------------------------------------
  # * Detect Collision with Vehicle
  #--------------------------------------------------------------------------
  def collide_with_vehicles?(x, y)
    $game_map.boat.pos_nt?(x, y) || $game_map.ship.pos_nt?(x, y)
  end
  #--------------------------------------------------------------------------
  # * Move to Designated Position
  #--------------------------------------------------------------------------
  def moveto(x, y)
    @x = x % $game_map.width
    @y = y % $game_map.height
    @real_x = @x
    @real_y = @y
    @prelock_direction = 0
    straighten
    update_bush_depth
  end
  #--------------------------------------------------------------------------
  # * Change Direction to Designated Direction
  #     d : Direction (2,4,6,8)
  #--------------------------------------------------------------------------
  def set_direction(d)
    @direction = d if !@direction_fix && d != 0
    @stop_count = 0
  end
  #--------------------------------------------------------------------------
  # * Determine Tile
  #--------------------------------------------------------------------------
  def tile?
    @tile_id > 0 && @priority_type == 0
  end
  #--------------------------------------------------------------------------
  # * Determine Object Character
  #--------------------------------------------------------------------------
  def object_character?
    @tile_id > 0 || @character_name[0, 1] == '!'
  end
  #--------------------------------------------------------------------------
  # * Get Number of Pixels to Shift Up from Tile Position
  #--------------------------------------------------------------------------
  def shift_y
    object_character? ? 0 : 4
  end
  #--------------------------------------------------------------------------
  # * Get Screen X-Coordinates
  #--------------------------------------------------------------------------
  def screen_x
    $game_map.adjust_x(@real_x) * 32 + 16
  end
  #--------------------------------------------------------------------------
  # * Get Screen Y-Coordinates
  #--------------------------------------------------------------------------
  def screen_y
    $game_map.adjust_y(@real_y) * 32 + 32 - shift_y - jump_height
  end
  #--------------------------------------------------------------------------
  # * Get Screen Z-Coordinates
  #--------------------------------------------------------------------------
  def screen_z
    @priority_type * 100
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_animation
    return update_jump if jumping?
    return update_move if moving?
    return update_stop
  end
  #--------------------------------------------------------------------------
  # * Update While Jumping
  #--------------------------------------------------------------------------
  def update_jump
    @jump_count -= 1
    @real_x = (@real_x * @jump_count + @x) / (@jump_count + 1.0)
    @real_y = (@real_y * @jump_count + @y) / (@jump_count + 1.0)
    update_bush_depth
    if @jump_count == 0
      @real_x = @x = $game_map.round_x(@x)
      @real_y = @y = $game_map.round_y(@y)
    end
  end
  #--------------------------------------------------------------------------
  # * Update While Moving
  #--------------------------------------------------------------------------
  def update_move
    @real_x = [@real_x - distance_per_frame, @x].max if @x < @real_x
    @real_x = [@real_x + distance_per_frame, @x].min if @x > @real_x
    @real_y = [@real_y - distance_per_frame, @y].max if @y < @real_y
    @real_y = [@real_y + distance_per_frame, @y].min if @y > @real_y
    update_bush_depth unless moving?
  end
  #--------------------------------------------------------------------------
  # * Update While Stopped
  #--------------------------------------------------------------------------
  def update_stop
    @stop_count += 1 unless @locked
  end
  #--------------------------------------------------------------------------
  # * Update Walking/Stepping Animation
  #--------------------------------------------------------------------------
  def update_animation
    update_anime_count
    if @anime_count > 18 - real_move_speed * 2
      update_anime_pattern
      @anime_count = 0
    end
  end
  #--------------------------------------------------------------------------
  # * Update Animation Count
  #--------------------------------------------------------------------------
  def update_anime_count
    if moving? && @walk_anime
      @anime_count += 1.5
    elsif @step_anime || @pattern != @original_pattern
      @anime_count += 1
    end
  end
  #--------------------------------------------------------------------------
  # * Update Animation Pattern
  #--------------------------------------------------------------------------
  def update_anime_pattern
    if !@step_anime && @stop_count > 0
      @pattern = @original_pattern
    else
      @pattern = (@pattern + 1) % 4
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if Ladder
  #--------------------------------------------------------------------------
  def ladder?
    $game_map.ladder?(@x, @y)
  end
  #--------------------------------------------------------------------------
  # * Update Bush Depth
  #--------------------------------------------------------------------------
  def update_bush_depth
    if normal_priority? && !object_character? && bush? && !jumping?
      @bush_depth = 8 unless moving?
    else
      @bush_depth = 0
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if Bush
  #--------------------------------------------------------------------------
  def bush?
    $game_map.bush?(@x, @y)
  end
  #--------------------------------------------------------------------------
  # * Get Terrain Tag
  #--------------------------------------------------------------------------
  def terrain_tag
    $game_map.terrain_tag(@x, @y)
  end
  #--------------------------------------------------------------------------
  # * Get Region ID
  #--------------------------------------------------------------------------
  def region_id
    $game_map.region_id(@x, @y)
  end
  #--------------------------------------------------------------------------
  # * Increase Steps
  #--------------------------------------------------------------------------
  def increase_steps
    set_direction(8) if ladder?
    @stop_count = 0
    update_bush_depth
  end
  #--------------------------------------------------------------------------
  # * Change Graphics
  #     character_name  : new character graphic filename
  #     character_index : new character graphic index
  #--------------------------------------------------------------------------
  def set_graphic(character_name, character_index)
    @tile_id = 0
    @character_name = character_name
    @character_index = character_index
    @original_pattern = 1
  end
  #--------------------------------------------------------------------------
  # * Determine Triggering of Frontal Touch Event
  #--------------------------------------------------------------------------
  def check_event_trigger_touch_front
    x2 = $game_map.round_x_with_direction(@x, @direction)
    y2 = $game_map.round_y_with_direction(@y, @direction)
    check_event_trigger_touch(x2, y2)
  end
  #--------------------------------------------------------------------------
  # * Determine if Touch Event is Triggered
  #--------------------------------------------------------------------------
  def check_event_trigger_touch(x, y)
    return false
  end
  #--------------------------------------------------------------------------
  # * Move Straight
  #     d:        Direction (2,4,6,8)
  #     turn_ok : Allows change of direction on the spot
  #--------------------------------------------------------------------------
  def move_straight(d, turn_ok = true)
    @move_succeed = passable?(@x, @y, d)
    if @move_succeed
      set_direction(d)
      @x = $game_map.round_x_with_direction(@x, d)
      @y = $game_map.round_y_with_direction(@y, d)
      @real_x = $game_map.x_with_direction(@x, reverse_dir(d))
      @real_y = $game_map.y_with_direction(@y, reverse_dir(d))
      increase_steps
    elsif turn_ok
      set_direction(d)
      check_event_trigger_touch_front
    end
  end
  #--------------------------------------------------------------------------
  # * Move Diagonally
  #     horz:  Horizontal (4 or 6)
  #     vert:  Vertical (2 or 8)
  #--------------------------------------------------------------------------
  def move_diagonal(horz, vert)
    @move_succeed = diagonal_passable?(x, y, horz, vert)
    if @move_succeed
      @x = $game_map.round_x_with_direction(@x, horz)
      @y = $game_map.round_y_with_direction(@y, vert)
      @real_x = $game_map.x_with_direction(@x, reverse_dir(horz))
      @real_y = $game_map.y_with_direction(@y, reverse_dir(vert))
      increase_steps
    end
    set_direction(horz) if @direction == reverse_dir(horz)
    set_direction(vert) if @direction == reverse_dir(vert)
  end
end
#==============================================================================
# ** Game_Character
#------------------------------------------------------------------------------
#  A character class with mainly movement route and other such processing
# added. It is used as a super class of Game_Player, Game_Follower,
# GameVehicle, and Game_Event.
#==============================================================================

class Game_Character < Game_CharacterBase
  #--------------------------------------------------------------------------
  # * Constants
  #--------------------------------------------------------------------------
  ROUTE_END               = 0             # End of Move Route
  ROUTE_MOVE_DOWN         = 1             # Move Down
  ROUTE_MOVE_LEFT         = 2             # Move Left
  ROUTE_MOVE_RIGHT        = 3             # Move Right
  ROUTE_MOVE_UP           = 4             # Move Up
  ROUTE_MOVE_LOWER_L      = 5             # Move Lower Left
  ROUTE_MOVE_LOWER_R      = 6             # Move Lower Right
  ROUTE_MOVE_UPPER_L      = 7             # Move Upper Left
  ROUTE_MOVE_UPPER_R      = 8             # Move Upper Right
  ROUTE_MOVE_RANDOM       = 9             # Move at Random
  ROUTE_MOVE_TOWARD       = 10            # Move toward Player
  ROUTE_MOVE_AWAY         = 11            # Move away from Player
  ROUTE_MOVE_FORWARD      = 12            # 1 Step Forward
  ROUTE_MOVE_BACKWARD     = 13            # 1 Step Backward
  ROUTE_JUMP              = 14            # Jump
  ROUTE_WAIT              = 15            # Wait
  ROUTE_TURN_DOWN         = 16            # Turn Down
  ROUTE_TURN_LEFT         = 17            # Turn Left
  ROUTE_TURN_RIGHT        = 18            # Turn Right
  ROUTE_TURN_UP           = 19            # Turn Up
  ROUTE_TURN_90D_R        = 20            # Turn 90 Degrees Right
  ROUTE_TURN_90D_L        = 21            # Turn 90 Degrees Left
  ROUTE_TURN_180D         = 22            # Turn 180 Degrees
  ROUTE_TURN_90D_R_L      = 23            # Turn 90 Degrees Right/Left
  ROUTE_TURN_RANDOM       = 24            # Turn at Random
  ROUTE_TURN_TOWARD       = 25            # Turn toward player
  ROUTE_TURN_AWAY         = 26            # Turn away from Player
  ROUTE_SWITCH_ON         = 27            # Switch ON
  ROUTE_SWITCH_OFF        = 28            # Switch OFF
  ROUTE_CHANGE_SPEED      = 29            # Change Speed
  ROUTE_CHANGE_FREQ       = 30            # Change Frequency
  ROUTE_WALK_ANIME_ON     = 31            # Walking Animation ON
  ROUTE_WALK_ANIME_OFF    = 32            # Walking Animation OFF
  ROUTE_STEP_ANIME_ON     = 33            # Stepping Animation ON
  ROUTE_STEP_ANIME_OFF    = 34            # Stepping Animation OFF
  ROUTE_DIR_FIX_ON        = 35            # Direction Fix ON
  ROUTE_DIR_FIX_OFF       = 36            # Direction Fix OFF
  ROUTE_THROUGH_ON        = 37            # Pass-Through ON
  ROUTE_THROUGH_OFF       = 38            # Pass-Through OFF
  ROUTE_TRANSPARENT_ON    = 39            # Transparent ON
  ROUTE_TRANSPARENT_OFF   = 40            # Transparent OFF
  ROUTE_CHANGE_GRAPHIC    = 41            # Change Graphic
  ROUTE_CHANGE_OPACITY    = 42            # Change Opacity
  ROUTE_CHANGE_BLENDING   = 43            # Change Blending
  ROUTE_PLAY_SE           = 44            # Play SE
  ROUTE_SCRIPT            = 45            # Script
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :move_route_forcing       # forced move route flag
  #--------------------------------------------------------------------------
  # * Initialize Public Member Variables
  #--------------------------------------------------------------------------
  def init_public_members
    super
    @move_route_forcing = false
  end
  #--------------------------------------------------------------------------
  # * Initialize Private Member Variables
  #--------------------------------------------------------------------------
  def init_private_members
    super
    @move_route = nil                 # Move route
    @move_route_index = 0             # Move route execution position
    @original_move_route = nil        # Original move route
    @original_move_route_index = 0    # Original move route execution position
    @wait_count = 0                   # Wait count
  end
  #--------------------------------------------------------------------------
  # * Memorize Move Route
  #--------------------------------------------------------------------------
  def memorize_move_route
    @original_move_route        = @move_route
    @original_move_route_index  = @move_route_index
  end
  #--------------------------------------------------------------------------
  # * Restore Move Route
  #--------------------------------------------------------------------------
  def restore_move_route
    @move_route           = @original_move_route
    @move_route_index     = @original_move_route_index
    @original_move_route  = nil
  end
  #--------------------------------------------------------------------------
  # * Force Move Route
  #--------------------------------------------------------------------------
  def force_move_route(move_route)
    memorize_move_route unless @original_move_route
    @move_route = move_route
    @move_route_index = 0
    @move_route_forcing = true
    @prelock_direction = 0
    @wait_count = 0
  end
  #--------------------------------------------------------------------------
  # * Update While Stopped
  #--------------------------------------------------------------------------
  def update_stop
    super
    update_routine_move if @move_route_forcing
  end
  #--------------------------------------------------------------------------
  # * Update Move Along Route
  #--------------------------------------------------------------------------
  def update_routine_move
    if @wait_count > 0
      @wait_count -= 1
    else
      @move_succeed = true
      command = @move_route.list[@move_route_index]
      if command
        process_move_command(command)
        advance_move_route_index
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Process Move Command
  #--------------------------------------------------------------------------
  def process_move_command(command)
    params = command.parameters
    case command.code
    when ROUTE_END;               process_route_end
    when ROUTE_MOVE_DOWN;         move_straight(2)
    when ROUTE_MOVE_LEFT;         move_straight(4)
    when ROUTE_MOVE_RIGHT;        move_straight(6)
    when ROUTE_MOVE_UP;           move_straight(8)
    when ROUTE_MOVE_LOWER_L;      move_diagonal(4, 2)
    when ROUTE_MOVE_LOWER_R;      move_diagonal(6, 2)
    when ROUTE_MOVE_UPPER_L;      move_diagonal(4, 8)
    when ROUTE_MOVE_UPPER_R;      move_diagonal(6, 8)
    when ROUTE_MOVE_RANDOM;       move_random
    when ROUTE_MOVE_TOWARD;       move_toward_player
    when ROUTE_MOVE_AWAY;         move_away_from_player
    when ROUTE_MOVE_FORWARD;      move_forward
    when ROUTE_MOVE_BACKWARD;     move_backward
    when ROUTE_JUMP;              jump(params[0], params[1])
    when ROUTE_WAIT;              @wait_count = params[0] - 1
    when ROUTE_TURN_DOWN;         set_direction(2)
    when ROUTE_TURN_LEFT;         set_direction(4)
    when ROUTE_TURN_RIGHT;        set_direction(6)
    when ROUTE_TURN_UP;           set_direction(8)
    when ROUTE_TURN_90D_R;        turn_right_90
    when ROUTE_TURN_90D_L;        turn_left_90
    when ROUTE_TURN_180D;         turn_180
    when ROUTE_TURN_90D_R_L;      turn_right_or_left_90
    when ROUTE_TURN_RANDOM;       turn_random
    when ROUTE_TURN_TOWARD;       turn_toward_player
    when ROUTE_TURN_AWAY;         turn_away_from_player
    when ROUTE_SWITCH_ON;         $game_switches[params[0]] = true
    when ROUTE_SWITCH_OFF;        $game_switches[params[0]] = false
    when ROUTE_CHANGE_SPEED;      @move_speed = params[0]
    when ROUTE_CHANGE_FREQ;       @move_frequency = params[0]
    when ROUTE_WALK_ANIME_ON;     @walk_anime = true
    when ROUTE_WALK_ANIME_OFF;    @walk_anime = false
    when ROUTE_STEP_ANIME_ON;     @step_anime = true
    when ROUTE_STEP_ANIME_OFF;    @step_anime = false
    when ROUTE_DIR_FIX_ON;        @direction_fix = true
    when ROUTE_DIR_FIX_OFF;       @direction_fix = false
    when ROUTE_THROUGH_ON;        @through = true
    when ROUTE_THROUGH_OFF;       @through = false
    when ROUTE_TRANSPARENT_ON;    @transparent = true
    when ROUTE_TRANSPARENT_OFF;   @transparent = false
    when ROUTE_CHANGE_GRAPHIC;    set_graphic(params[0], params[1])
    when ROUTE_CHANGE_OPACITY;    @opacity = params[0]
    when ROUTE_CHANGE_BLENDING;   @blend_type = params[0]
    when ROUTE_PLAY_SE;           params[0].play
    when ROUTE_SCRIPT;            eval(params[0])
    end
  end
  #--------------------------------------------------------------------------
  # * Calculate Distance in X Axis Direction
  #--------------------------------------------------------------------------
  def distance_x_from(x)
    result = @x - x
    if $game_map.loop_horizontal? && result.abs > $game_map.width / 2
      if result < 0
        result += $game_map.width
      else
        result -= $game_map.width
      end
    end
    result
  end
  #--------------------------------------------------------------------------
  # * Calculate Distance in Y Axis Direction
  #--------------------------------------------------------------------------
  def distance_y_from(y)
    result = @y - y
    if $game_map.loop_vertical? && result.abs > $game_map.height / 2
      if result < 0
        result += $game_map.height
      else
        result -= $game_map.height
      end
    end
    result
  end
  #--------------------------------------------------------------------------
  # * Move at Random
  #--------------------------------------------------------------------------
  def move_random
    move_straight(2 + rand(4) * 2, false)
  end
  #--------------------------------------------------------------------------
  # * Move Toward Character
  #--------------------------------------------------------------------------
  def move_toward_character(character)
    sx = distance_x_from(character.x)
    sy = distance_y_from(character.y)
    if sx.abs > sy.abs
      move_straight(sx > 0 ? 4 : 6)
      move_straight(sy > 0 ? 8 : 2) if !@move_succeed && sy != 0
    elsif sy != 0
      move_straight(sy > 0 ? 8 : 2)
      move_straight(sx > 0 ? 4 : 6) if !@move_succeed && sx != 0
    end
  end
  #--------------------------------------------------------------------------
  # * Move Away from Character
  #--------------------------------------------------------------------------
  def move_away_from_character(character)
    sx = distance_x_from(character.x)
    sy = distance_y_from(character.y)
    if sx.abs > sy.abs
      move_straight(sx > 0 ? 6 : 4)
      move_straight(sy > 0 ? 2 : 8) if !@move_succeed && sy != 0
    elsif sy != 0
      move_straight(sy > 0 ? 2 : 8)
      move_straight(sx > 0 ? 6 : 4) if !@move_succeed && sx != 0
    end
  end
  #--------------------------------------------------------------------------
  # * Turn Toward Character
  #--------------------------------------------------------------------------
  def turn_toward_character(character)
    sx = distance_x_from(character.x)
    sy = distance_y_from(character.y)
    if sx.abs > sy.abs
      set_direction(sx > 0 ? 4 : 6)
    elsif sy != 0
      set_direction(sy > 0 ? 8 : 2)
    end
  end
  #--------------------------------------------------------------------------
  # * Turn Away from Character
  #--------------------------------------------------------------------------
  def turn_away_from_character(character)
    sx = distance_x_from(character.x)
    sy = distance_y_from(character.y)
    if sx.abs > sy.abs
      set_direction(sx > 0 ? 6 : 4)
    elsif sy != 0
      set_direction(sy > 0 ? 2 : 8)
    end
  end
  #--------------------------------------------------------------------------
  # * Turn toward Player
  #--------------------------------------------------------------------------
  def turn_toward_player
    turn_toward_character($game_player)
  end
  #--------------------------------------------------------------------------
  # * Turn away from Player
  #--------------------------------------------------------------------------
  def turn_away_from_player
    turn_away_from_character($game_player)
  end
  #--------------------------------------------------------------------------
  # * Move toward Player
  #--------------------------------------------------------------------------
  def move_toward_player
    move_toward_character($game_player)
  end
  #--------------------------------------------------------------------------
  # * Move away from Player
  #--------------------------------------------------------------------------
  def move_away_from_player
    move_away_from_character($game_player)
  end
  #--------------------------------------------------------------------------
  # * 1 Step Forward
  #--------------------------------------------------------------------------
  def move_forward
    move_straight(@direction)
  end
  #--------------------------------------------------------------------------
  # * 1 Step Backward
  #--------------------------------------------------------------------------
  def move_backward
    last_direction_fix = @direction_fix
    @direction_fix = true
    move_straight(reverse_dir(@direction), false)
    @direction_fix = last_direction_fix
  end
  #--------------------------------------------------------------------------
  # * Jump
  #     x_plus : x-coordinate plus value
  #     y_plus : y-coordinate plus value
  #--------------------------------------------------------------------------
  def jump(x_plus, y_plus)
    if x_plus.abs > y_plus.abs
      set_direction(x_plus < 0 ? 4 : 6) if x_plus != 0
    else
      set_direction(y_plus < 0 ? 8 : 2) if y_plus != 0
    end
    @x += x_plus
    @y += y_plus
    distance = Math.sqrt(x_plus * x_plus + y_plus * y_plus).round
    @jump_peak = 10 + distance - @move_speed
    @jump_count = @jump_peak * 2
    @stop_count = 0
    straighten
  end
  #--------------------------------------------------------------------------
  # * Process Move Route End
  #--------------------------------------------------------------------------
  def process_route_end
    if @move_route.repeat
      @move_route_index = -1
    elsif @move_route_forcing
      @move_route_forcing = false
      restore_move_route
    end
  end
  #--------------------------------------------------------------------------
  # * Advance Execution Position of Move Route
  #--------------------------------------------------------------------------
  def advance_move_route_index
    @move_route_index += 1 if @move_succeed || @move_route.skippable
  end
  #--------------------------------------------------------------------------
  # * Turn 90° Right
  #--------------------------------------------------------------------------
  def turn_right_90
    case @direction
    when 2;  set_direction(4)
    when 4;  set_direction(8)
    when 6;  set_direction(2)
    when 8;  set_direction(6)
    end
  end
  #--------------------------------------------------------------------------
  # * Turn 90° Left
  #--------------------------------------------------------------------------
  def turn_left_90
    case @direction
    when 2;  set_direction(6)
    when 4;  set_direction(2)
    when 6;  set_direction(8)
    when 8;  set_direction(4)
    end
  end
  #--------------------------------------------------------------------------
  # * Turn 180°
  #--------------------------------------------------------------------------
  def turn_180
    set_direction(reverse_dir(@direction))
  end
  #--------------------------------------------------------------------------
  # * Turn 90° Right or Left
  #--------------------------------------------------------------------------
  def turn_right_or_left_90
    case rand(2)
    when 0;  turn_right_90
    when 1;  turn_left_90
    end
  end
  #--------------------------------------------------------------------------
  # * Turn at Random
  #--------------------------------------------------------------------------
  def turn_random
    set_direction(2 + rand(4) * 2)
  end
  #--------------------------------------------------------------------------
  # * Swap Character Positions
  #--------------------------------------------------------------------------
  def swap(character)
    new_x = character.x
    new_y = character.y
    character.moveto(x, y)
    moveto(new_x, new_y)
  end
end
#==============================================================================
# ** Game_Player
#------------------------------------------------------------------------------
#  This class handles the player. It includes event starting determinants and
# map scrolling functions. The instance of this class is referenced by
# $game_player.
#==============================================================================

class Game_Player < Game_Character
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :followers                # Followers (party members)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super
    @vehicle_type = :walk           # Type of vehicle currently being ridden
    @vehicle_getting_on = false     # Boarding vehicle flag
    @vehicle_getting_off = false    # Getting off vehicle flag
    @followers = Game_Followers.new(self)
    @transparent = $data_system.opt_transparent
    clear_transfer_info
  end
  #--------------------------------------------------------------------------
  # * Clear Transfer Player Information
  #--------------------------------------------------------------------------
  def clear_transfer_info
    @transferring = false           # Player transfer flag
    @new_map_id = 0                 # Destination map ID
    @new_x = 0                      # Destination X coordinate
    @new_y = 0                      # Destination Y coordinate
    @new_direction = 0              # Post-movement direction
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    @character_name = actor ? actor.character_name : ""
    @character_index = actor ? actor.character_index : 0
    @followers.refresh
  end
  #--------------------------------------------------------------------------
  # * Get Corresponding Actor
  #--------------------------------------------------------------------------
  def actor
    $game_party.battle_members[0]
  end
  #--------------------------------------------------------------------------
  # * Determine if Stopping
  #--------------------------------------------------------------------------
  def stopping?
    return false if @vehicle_getting_on || @vehicle_getting_off
    return super
  end
  #--------------------------------------------------------------------------
  # * Player Transfer Reservation
  #     d:  Post move direction (2,4,6,8)
  #--------------------------------------------------------------------------
  def reserve_transfer(map_id, x, y, d = 2)
    @transferring = true
    @new_map_id = map_id
    @new_x = x
    @new_y = y
    @new_direction = d
  end
  #--------------------------------------------------------------------------
  # * Determine if Player Transfer is Reserved
  #--------------------------------------------------------------------------
  def transfer?
    @transferring
  end
  #--------------------------------------------------------------------------
  # * Execute Player Transfer
  #--------------------------------------------------------------------------
  def perform_transfer
    if transfer?
      set_direction(@new_direction)
      if @new_map_id != $game_map.map_id
        $game_map.setup(@new_map_id)
        $game_map.autoplay
      end
      moveto(@new_x, @new_y)
      clear_transfer_info
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if Map is Passable
  #     d:  Direction (2,4,6,8)
  #--------------------------------------------------------------------------
  def map_passable?(x, y, d)
    case @vehicle_type
    when :boat
      $game_map.boat_passable?(x, y)
    when :ship
      $game_map.ship_passable?(x, y)
    when :airship
      true
    else
      super
    end
  end
  #--------------------------------------------------------------------------
  # * Get Vehicle Currently Being Ridden
  #--------------------------------------------------------------------------
  def vehicle
    $game_map.vehicle(@vehicle_type)
  end
  #--------------------------------------------------------------------------
  # * Determine if on Boat
  #--------------------------------------------------------------------------
  def in_boat?
    @vehicle_type == :boat
  end
  #--------------------------------------------------------------------------
  # * Determine if on Ship
  #--------------------------------------------------------------------------
  def in_ship?
    @vehicle_type == :ship
  end
  #--------------------------------------------------------------------------
  # * Determine if Riding in Airship
  #--------------------------------------------------------------------------
  def in_airship?
    @vehicle_type == :airship
  end
  #--------------------------------------------------------------------------
  # * Determine if Walking Normally
  #--------------------------------------------------------------------------
  def normal_walk?
    @vehicle_type == :walk && !@move_route_forcing
  end
  #--------------------------------------------------------------------------
  # * Determine if Dashing
  #--------------------------------------------------------------------------
  def dash?
    return false if @move_route_forcing
    return false if $game_map.disable_dash?
    return false if vehicle
    return Input.press?(:A)
  end
  #--------------------------------------------------------------------------
  # * Determine if Debug Pass-through State
  #--------------------------------------------------------------------------
  def debug_through?
    $TEST && Input.press?(:CTRL)
  end
  #--------------------------------------------------------------------------
  # * Detect Collision (Including Followers)
  #--------------------------------------------------------------------------
  def collide?(x, y)
    !@through && (pos?(x, y) || followers.collide?(x, y))
  end
  #--------------------------------------------------------------------------
  # * X Coordinate of Screen Center
  #--------------------------------------------------------------------------
  def center_x
    (Graphics.width / 32 - 1) / 2.0
  end
  #--------------------------------------------------------------------------
  # * Y Coordinate of Screen Center
  #--------------------------------------------------------------------------
  def center_y
    (Graphics.height / 32 - 1) / 2.0
  end
  #--------------------------------------------------------------------------
  # * Set Map Display Position to Center of Screen
  #--------------------------------------------------------------------------
  def center(x, y)
    $game_map.set_display_pos(x - center_x, y - center_y)
  end
  #--------------------------------------------------------------------------
  # * Move to Designated Position
  #--------------------------------------------------------------------------
  def moveto(x, y)
    super
    center(x, y)
    make_encounter_count
    vehicle.refresh if vehicle
    @followers.synchronize(x, y, direction)
  end
  #--------------------------------------------------------------------------
  # * Increase Steps
  #--------------------------------------------------------------------------
  def increase_steps
    super
    $game_party.increase_steps if normal_walk?
  end
  #--------------------------------------------------------------------------
  # * Create Encounter Count
  #--------------------------------------------------------------------------
  def make_encounter_count
    n = $game_map.encounter_step
    @encounter_count = rand(n) + rand(n) + 1
  end
  #--------------------------------------------------------------------------
  # * Create Group ID for Troop Encountered
  #--------------------------------------------------------------------------
  def make_encounter_troop_id
    encounter_list = []
    weight_sum = 0
    $game_map.encounter_list.each do |encounter|
      next unless encounter_ok?(encounter)
      encounter_list.push(encounter)
      weight_sum += encounter.weight
    end
    if weight_sum > 0
      value = rand(weight_sum)
      encounter_list.each do |encounter|
        value -= encounter.weight
        return encounter.troop_id if value < 0
      end
    end
    return 0
  end
  #--------------------------------------------------------------------------
  # * Determine Usability of Encounter Item
  #--------------------------------------------------------------------------
  def encounter_ok?(encounter)
    return true if encounter.region_set.empty?
    return true if encounter.region_set.include?(region_id)
    return false
  end
  #--------------------------------------------------------------------------
  # * Execute Encounter Processing
  #--------------------------------------------------------------------------
  def encounter
    return false if $game_map.interpreter.running?
    return false if $game_system.encounter_disabled
    return false if @encounter_count > 0
    make_encounter_count
    troop_id = make_encounter_troop_id
    return false unless $data_troops[troop_id]
    BattleManager.setup(troop_id)
    BattleManager.on_encounter
    return true
  end
  #--------------------------------------------------------------------------
  # * Trigger Map Event
  #     triggers : Trigger array
  #     normal   : Is priority set to [Same as Characters] ?
  #--------------------------------------------------------------------------
  def start_map_event(x, y, triggers, normal)
    return if $game_map.interpreter.running?
    $game_map.events_xy(x, y).each do |event|
      if event.trigger_in?(triggers) && event.normal_priority? == normal
        event.start
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if Same Position Event is Triggered
  #--------------------------------------------------------------------------
  def check_event_trigger_here(triggers)
    start_map_event(@x, @y, triggers, false)
  end
  #--------------------------------------------------------------------------
  # * Determine if Front Event is Triggered
  #--------------------------------------------------------------------------
  def check_event_trigger_there(triggers)
    x2 = $game_map.round_x_with_direction(@x, @direction)
    y2 = $game_map.round_y_with_direction(@y, @direction)
    start_map_event(x2, y2, triggers, true)
    return if $game_map.any_event_starting?
    return unless $game_map.counter?(x2, y2)
    x3 = $game_map.round_x_with_direction(x2, @direction)
    y3 = $game_map.round_y_with_direction(y2, @direction)
    start_map_event(x3, y3, triggers, true)
  end
  #--------------------------------------------------------------------------
  # * Determine if Touch Event is Triggered
  #--------------------------------------------------------------------------
  def check_event_trigger_touch(x, y)
    start_map_event(x, y, [1,2], true)
  end
  #--------------------------------------------------------------------------
  # * Processing of Movement via Input from Directional Buttons
  #--------------------------------------------------------------------------
  def move_by_input
    return if !movable? || $game_map.interpreter.running?
    move_straight(Input.dir4) if Input.dir4 > 0
  end
  #--------------------------------------------------------------------------
  # * Determine if Movement is Possible
  #--------------------------------------------------------------------------
  def movable?
    return false if moving?
    return false if @move_route_forcing || @followers.gathering?
    return false if @vehicle_getting_on || @vehicle_getting_off
    return false if $game_message.busy? || $game_message.visible
    return false if vehicle && !vehicle.movable?
    return true
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    last_real_x = @real_x
    last_real_y = @real_y
    last_moving = moving?
    move_by_input
    super
    update_scroll(last_real_x, last_real_y)
    update_vehicle
    update_nonmoving(last_moving) unless moving?
    @followers.update
  end
  #--------------------------------------------------------------------------
  # * Scroll Processing
  #--------------------------------------------------------------------------
  def update_scroll(last_real_x, last_real_y)
    ax1 = $game_map.adjust_x(last_real_x)
    ay1 = $game_map.adjust_y(last_real_y)
    ax2 = $game_map.adjust_x(@real_x)
    ay2 = $game_map.adjust_y(@real_y)
    $game_map.scroll_down (ay2 - ay1) if ay2 > ay1 && ay2 > center_y
    $game_map.scroll_left (ax1 - ax2) if ax2 < ax1 && ax2 < center_x
    $game_map.scroll_right(ax2 - ax1) if ax2 > ax1 && ax2 > center_x
    $game_map.scroll_up   (ay1 - ay2) if ay2 < ay1 && ay2 < center_y
  end
  #--------------------------------------------------------------------------
  # * Vehicle Processing
  #--------------------------------------------------------------------------
  def update_vehicle
    return if @followers.gathering?
    return unless vehicle
    if @vehicle_getting_on
      update_vehicle_get_on
    elsif @vehicle_getting_off
      update_vehicle_get_off
    else
      vehicle.sync_with_player
    end
  end
  #--------------------------------------------------------------------------
  # * Update Boarding onto Vehicle
  #--------------------------------------------------------------------------
  def update_vehicle_get_on
    if !@followers.gathering? && !moving?
      @direction = vehicle.direction
      @move_speed = vehicle.speed
      @vehicle_getting_on = false
      @transparent = true
      @through = true if in_airship?
      vehicle.get_on
    end
  end
  #--------------------------------------------------------------------------
  # * Update Disembarking from Vehicle
  #--------------------------------------------------------------------------
  def update_vehicle_get_off
    if !@followers.gathering? && vehicle.altitude == 0
      @vehicle_getting_off = false
      @vehicle_type = :walk
      @transparent = false
    end
  end
  #--------------------------------------------------------------------------
  # * Processing When Not Moving
  #     last_moving : Was it moving previously?
  #--------------------------------------------------------------------------
  def update_nonmoving(last_moving)
    return if $game_map.interpreter.running?
    if last_moving
      $game_party.on_player_walk
      return if check_touch_event
    end
    if movable? && Input.trigger?(:C)
      return if get_on_off_vehicle
      return if check_action_event
    end
    update_encounter if last_moving
  end
  #--------------------------------------------------------------------------
  # * Update Encounter
  #--------------------------------------------------------------------------
  def update_encounter
    return if $TEST && Input.press?(:CTRL)
    return if $game_party.encounter_none?
    return if in_airship?
    return if @move_route_forcing
    @encounter_count -= encounter_progress_value
  end
  #--------------------------------------------------------------------------
  # * Get Encounter Progress Value
  #--------------------------------------------------------------------------
  def encounter_progress_value
    value = $game_map.bush?(@x, @y) ? 2 : 1
    value *= 0.5 if $game_party.encounter_half?
    value *= 0.5 if in_ship?
    value
  end
  #--------------------------------------------------------------------------
  # * Determine if Event Start Caused by Touch (Overlap)
  #--------------------------------------------------------------------------
  def check_touch_event
    return false if in_airship?
    check_event_trigger_here([1,2])
    $game_map.setup_starting_event
  end
  #--------------------------------------------------------------------------
  # * Determine if Event Start Caused by [OK] Button
  #--------------------------------------------------------------------------
  def check_action_event
    return false if in_airship?
    check_event_trigger_here([0])
    return true if $game_map.setup_starting_event
    check_event_trigger_there([0,1,2])
    $game_map.setup_starting_event
  end
  #--------------------------------------------------------------------------
  # * Getting On and Off Vehicles
  #--------------------------------------------------------------------------
  def get_on_off_vehicle
    if vehicle
      get_off_vehicle
    else
      get_on_vehicle
    end
  end
  #--------------------------------------------------------------------------
  # * Board Vehicle
  #    Assumes that the player is not currently in a vehicle.
  #--------------------------------------------------------------------------
  def get_on_vehicle
    front_x = $game_map.round_x_with_direction(@x, @direction)
    front_y = $game_map.round_y_with_direction(@y, @direction)
    @vehicle_type = :boat    if $game_map.boat.pos?(front_x, front_y)
    @vehicle_type = :ship    if $game_map.ship.pos?(front_x, front_y)
    @vehicle_type = :airship if $game_map.airship.pos?(@x, @y)
    if vehicle
      @vehicle_getting_on = true
      force_move_forward unless in_airship?
      @followers.gather
    end
    @vehicle_getting_on
  end
  #--------------------------------------------------------------------------
  # * Get Off Vehicle
  #    Assumes that the player is currently riding in a vehicle.
  #--------------------------------------------------------------------------
  def get_off_vehicle
    if vehicle.land_ok?(@x, @y, @direction)
      set_direction(2) if in_airship?
      @followers.synchronize(@x, @y, @direction)
      vehicle.get_off
      unless in_airship?
        force_move_forward
        @transparent = false
      end
      @vehicle_getting_off = true
      @move_speed = 4
      @through = false
      make_encounter_count
      @followers.gather
    end
    @vehicle_getting_off
  end
  #--------------------------------------------------------------------------
  # * Force One Step Forward
  #--------------------------------------------------------------------------
  def force_move_forward
    @through = true
    move_forward
    @through = false
  end
  #--------------------------------------------------------------------------
  # * Determine if Damage Floor
  #--------------------------------------------------------------------------
  def on_damage_floor?
    $game_map.damage_floor?(@x, @y) && !in_airship?
  end
  #--------------------------------------------------------------------------
  # * Move Straight
  #--------------------------------------------------------------------------
  def move_straight(d, turn_ok = true)
    @followers.move if passable?(@x, @y, d)
    super
  end
  #--------------------------------------------------------------------------
  # * Move Diagonally
  #--------------------------------------------------------------------------
  def move_diagonal(horz, vert)
    @followers.move if diagonal_passable?(@x, @y, horz, vert)
    super
  end
end
#==============================================================================
# ** Game_Follower
#------------------------------------------------------------------------------
#  This class handles followers. A follower is an allied character, other than
# the front character, displayed in the party. It is referenced within the
# Game_Followers class.
#==============================================================================

class Game_Follower < Game_Character
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(member_index, preceding_character)
    super()
    @member_index = member_index
    @preceding_character = preceding_character
    @transparent = $data_system.opt_transparent
    @through = true
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    @character_name = visible? ? actor.character_name : ""
    @character_index = visible? ? actor.character_index : 0
  end
  #--------------------------------------------------------------------------
  # * Get Corresponding Actor
  #--------------------------------------------------------------------------
  def actor
    $game_party.battle_members[@member_index]
  end
  #--------------------------------------------------------------------------
  # * Determine Visibility
  #--------------------------------------------------------------------------
  def visible?
    actor && $game_player.followers.visible
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    @move_speed     = $game_player.real_move_speed
    @transparent    = $game_player.transparent
    @walk_anime     = $game_player.walk_anime
    @step_anime     = $game_player.step_anime
    @direction_fix  = $game_player.direction_fix
    @opacity        = $game_player.opacity
    @blend_type     = $game_player.blend_type
    super
  end
  #--------------------------------------------------------------------------
  # * Pursue Preceding Character
  #--------------------------------------------------------------------------
  def chase_preceding_character
    unless moving?
      sx = distance_x_from(@preceding_character.x)
      sy = distance_y_from(@preceding_character.y)
      if sx != 0 && sy != 0
        move_diagonal(sx > 0 ? 4 : 6, sy > 0 ? 8 : 2)
      elsif sx != 0
        move_straight(sx > 0 ? 4 : 6)
      elsif sy != 0
        move_straight(sy > 0 ? 8 : 2)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if at Same Position as Preceding Character
  #--------------------------------------------------------------------------
  def gather?
    !moving? && pos?(@preceding_character.x, @preceding_character.y)
  end
end
#==============================================================================
# ** Game_Followers
#------------------------------------------------------------------------------
#  This is a wrapper for a follower array. This class is used internally for
# the Game_Player class.
#==============================================================================

class Game_Followers
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :visible                  # Player Followers ON?
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     leader:  Lead character
  #--------------------------------------------------------------------------
  def initialize(leader)
    @visible = $data_system.opt_followers
    @gathering = false                    # Gathering processing underway flag
    @data = []
    @data.push(Game_Follower.new(1, leader))
    (2...$game_party.max_battle_members).each do |index|
      @data.push(Game_Follower.new(index, @data[-1]))
    end
  end
  #--------------------------------------------------------------------------
  # * Get Followers
  #--------------------------------------------------------------------------
  def [](index)
    @data[index]
  end
  #--------------------------------------------------------------------------
  # * Iterator
  #--------------------------------------------------------------------------
  def each
    @data.each {|follower| yield follower } if block_given?
  end
  #--------------------------------------------------------------------------
  # * Iterator (Reverse)
  #--------------------------------------------------------------------------
  def reverse_each
    @data.reverse.each {|follower| yield follower } if block_given?
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    each {|follower| follower.refresh }
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    if gathering?
      move unless moving? || moving?
      @gathering = false if gather?
    end
    each {|follower| follower.update }
  end
  #--------------------------------------------------------------------------
  # * Movement
  #--------------------------------------------------------------------------
  def move
    reverse_each {|follower| follower.chase_preceding_character }
  end
  #--------------------------------------------------------------------------
  # * Synchronize
  #--------------------------------------------------------------------------
  def synchronize(x, y, d)
    each do |follower|
      follower.moveto(x, y)
      follower.set_direction(d)
    end
  end
  #--------------------------------------------------------------------------
  # * Gather
  #--------------------------------------------------------------------------
  def gather
    @gathering = true
  end
  #--------------------------------------------------------------------------
  # * Determine if Gathering
  #--------------------------------------------------------------------------
  def gathering?
    @gathering
  end
  #--------------------------------------------------------------------------
  # * Get Array of Displayed Followers
  #    "folloers" is typo, but retained because of the compatibility.
  #--------------------------------------------------------------------------
  def visible_folloers
    @data.select {|follower| follower.visible? }
  end
  #--------------------------------------------------------------------------
  # * Determine if Moving
  #--------------------------------------------------------------------------
  def moving?
    visible_folloers.any? {|follower| follower.moving? }
  end
  #--------------------------------------------------------------------------
  # * Determine if Gathered
  #--------------------------------------------------------------------------
  def gather?
    visible_folloers.all? {|follower| follower.gather? }
  end
  #--------------------------------------------------------------------------
  # * Detect Collision
  #--------------------------------------------------------------------------
  def collide?(x, y)
    visible_folloers.any? {|follower| follower.pos?(x, y) }
  end
end
#==============================================================================
# ** Game_Vehicle
#------------------------------------------------------------------------------
#  This class handles vehicles. It's used within the Game_Map class. If there
# are no vehicles on the current map, the coordinates are set to (-1,-1).
#==============================================================================

class Game_Vehicle < Game_Character
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :altitude                 # altitude (for airships)
  attr_reader   :driving                  # driving flag
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     type:  vehicle type (:boat, :ship, :airship)
  #--------------------------------------------------------------------------
  def initialize(type)
    super()
    @type = type
    @altitude = 0
    @driving = false
    @direction = 4
    @walk_anime = false
    @step_anime = false
    @walking_bgm = nil
    init_move_speed
    load_system_settings
  end
  #--------------------------------------------------------------------------
  # * Initialize Move Speed
  #--------------------------------------------------------------------------
  def init_move_speed
    @move_speed = 4 if @type == :boat
    @move_speed = 5 if @type == :ship
    @move_speed = 6 if @type == :airship
  end
  #--------------------------------------------------------------------------
  # * Get System Settings
  #--------------------------------------------------------------------------
  def system_vehicle
    return $data_system.boat    if @type == :boat
    return $data_system.ship    if @type == :ship
    return $data_system.airship if @type == :airship
    return nil
  end
  #--------------------------------------------------------------------------
  # * Load System Settings
  #--------------------------------------------------------------------------
  def load_system_settings
    @map_id           = system_vehicle.start_map_id
    @x                = system_vehicle.start_x
    @y                = system_vehicle.start_y
    @character_name   = system_vehicle.character_name
    @character_index  = system_vehicle.character_index
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    if @driving
      @map_id = $game_map.map_id
      sync_with_player
    elsif @map_id == $game_map.map_id
      moveto(@x, @y)
    end
    if @type == :airship
      @priority_type = @driving ? 2 : 0
    else
      @priority_type = 1
    end
    @walk_anime = @step_anime = @driving
  end
  #--------------------------------------------------------------------------
  # * Change Position
  #--------------------------------------------------------------------------
  def set_location(map_id, x, y)
    @map_id = map_id
    @x = x
    @y = y
    refresh
  end
  #--------------------------------------------------------------------------
  # * Determine Coordinate Match
  #--------------------------------------------------------------------------
  def pos?(x, y)
    @map_id == $game_map.map_id && super(x, y)
  end
  #--------------------------------------------------------------------------
  # * Determine Transparency
  #--------------------------------------------------------------------------
  def transparent
    @map_id != $game_map.map_id || super
  end
  #--------------------------------------------------------------------------
  # * Board Vehicle
  #--------------------------------------------------------------------------
  def get_on
    @driving = true
    @walk_anime = true
    @step_anime = true
    @walking_bgm = RPG::BGM.last
    system_vehicle.bgm.play
  end
  #--------------------------------------------------------------------------
  # * Get Off Vehicle
  #--------------------------------------------------------------------------
  def get_off
    @driving = false
    @walk_anime = false
    @step_anime = false
    @direction = 4
    @walking_bgm.play
  end
  #--------------------------------------------------------------------------
  # * Synchronize With Player
  #--------------------------------------------------------------------------
  def sync_with_player
    @x = $game_player.x
    @y = $game_player.y
    @real_x = $game_player.real_x
    @real_y = $game_player.real_y
    @direction = $game_player.direction
    update_bush_depth
  end
  #--------------------------------------------------------------------------
  # * Get Move Speed
  #--------------------------------------------------------------------------
  def speed
    @move_speed
  end
  #--------------------------------------------------------------------------
  # * Get Screen Y-Coordinates
  #--------------------------------------------------------------------------
  def screen_y
    super - altitude
  end
  #--------------------------------------------------------------------------
  # * Determine if Movement is Possible
  #--------------------------------------------------------------------------
  def movable?
    !moving? && !(@type == :airship && @altitude < max_altitude)
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    update_airship_altitude if @type == :airship
  end
  #--------------------------------------------------------------------------
  # * Update Airship Altitude
  #--------------------------------------------------------------------------
  def update_airship_altitude
    if @driving
      @altitude += 1 if @altitude < max_altitude && takeoff_ok?
    elsif @altitude > 0
      @altitude -= 1
      @priority_type = 0 if @altitude == 0
    end
    @step_anime = (@altitude == max_altitude)
    @priority_type = 2 if @altitude > 0
  end
  #--------------------------------------------------------------------------
  # * Get Maximum Altitude of Airship
  #--------------------------------------------------------------------------
  def max_altitude
    return 32
  end
  #--------------------------------------------------------------------------
  # * Determine if Takeoff Is Possible
  #--------------------------------------------------------------------------
  def takeoff_ok?
    $game_player.followers.gather?
  end
  #--------------------------------------------------------------------------
  # * Determine if Docking/Landing Is Possible
  #     d:  Direction (2,4,6,8)
  #--------------------------------------------------------------------------
  def land_ok?(x, y, d)
    if @type == :airship
      return false unless $game_map.airship_land_ok?(x, y)
      return false unless $game_map.events_xy(x, y).empty?
    else
      x2 = $game_map.round_x_with_direction(x, d)
      y2 = $game_map.round_y_with_direction(y, d)
      return false unless $game_map.valid?(x2, y2)
      return false unless $game_map.passable?(x2, y2, reverse_dir(d))
      return false if collide_with_characters?(x2, y2)
    end
    return true
  end
end
#==============================================================================
# ** Game_Event
#------------------------------------------------------------------------------
#  This class handles events. Functions include event page switching via
# condition determinants and running parallel process events. Used within the
# Game_Map class.
#==============================================================================

class Game_Event < Game_Character
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :trigger                  # trigger
  attr_reader   :list                     # list of event commands
  attr_reader   :starting                 # starting flag
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     event:  RPG::Event
  #--------------------------------------------------------------------------
  def initialize(map_id, event)
    super()
    @map_id = map_id
    @event = event
    @id = @event.id
    moveto(@event.x, @event.y)
    refresh
  end
  #--------------------------------------------------------------------------
  # * Initialize Public Member Variables
  #--------------------------------------------------------------------------
  def init_public_members
    super
    @trigger = 0
    @list = nil
    @starting = false
  end
  #--------------------------------------------------------------------------
  # * Initialize Private Member Variables
  #--------------------------------------------------------------------------
  def init_private_members
    super
    @move_type = 0                        # Movement type
    @erased = false                       # Temporary erase flag
    @page = nil                           # Event page
  end
  #--------------------------------------------------------------------------
  # * Detect Collision with Character
  #--------------------------------------------------------------------------
  def collide_with_characters?(x, y)
    super || collide_with_player_characters?(x, y)
  end
  #--------------------------------------------------------------------------
  # * Detect Collision with Player (Including Followers)
  #--------------------------------------------------------------------------
  def collide_with_player_characters?(x, y)
    normal_priority? && $game_player.collide?(x, y)
  end
  #--------------------------------------------------------------------------
  # * Lock (Processing in Which Executing Events Stop)
  #--------------------------------------------------------------------------
  def lock
    unless @locked
      @prelock_direction = @direction
      turn_toward_player
      @locked = true
    end
  end
  #--------------------------------------------------------------------------
  # * Unlock
  #--------------------------------------------------------------------------
  def unlock
    if @locked
      @locked = false
      set_direction(@prelock_direction)
    end
  end
  #--------------------------------------------------------------------------
  # * Update While Stopped
  #--------------------------------------------------------------------------
  def update_stop
    super
    update_self_movement unless @move_route_forcing
  end
  #--------------------------------------------------------------------------
  # * Update During Autonomous Movement
  #--------------------------------------------------------------------------
  def update_self_movement
    if near_the_screen? && @stop_count > stop_count_threshold
      case @move_type
      when 1;  move_type_random
      when 2;  move_type_toward_player
      when 3;  move_type_custom
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if Near Visible Area of Screen
  #     dx:  A certain number of tiles left/right of screen's center
  #     dy:  A certain number of tiles above/below screen's center
  #--------------------------------------------------------------------------
  def near_the_screen?(dx = 12, dy = 8)
    ax = $game_map.adjust_x(@real_x) - Graphics.width / 2 / 32
    ay = $game_map.adjust_y(@real_y) - Graphics.height / 2 / 32
    ax >= -dx && ax <= dx && ay >= -dy && ay <= dy
  end
  #--------------------------------------------------------------------------
  # * Calculate Threshold of Counter for Stopping Autonomous Movement Startup
  #--------------------------------------------------------------------------
  def stop_count_threshold
    30 * (5 - @move_frequency)
  end
  #--------------------------------------------------------------------------
  # * Move Type : Random
  #--------------------------------------------------------------------------
  def move_type_random
    case rand(6)
    when 0..1;  move_random
    when 2..4;  move_forward
    when 5;     @stop_count = 0
    end
  end
  #--------------------------------------------------------------------------
  # * Move Type : Approach
  #--------------------------------------------------------------------------
  def move_type_toward_player
    if near_the_player?
      case rand(6)
      when 0..3;  move_toward_player
      when 4;     move_random
      when 5;     move_forward
      end
    else
      move_random
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if Near Player
  #--------------------------------------------------------------------------
  def near_the_player?
    sx = distance_x_from($game_player.x).abs
    sy = distance_y_from($game_player.y).abs
    sx + sy < 20
  end
  #--------------------------------------------------------------------------
  # * Move Type : Custom
  #--------------------------------------------------------------------------
  def move_type_custom
    update_routine_move
  end
  #--------------------------------------------------------------------------
  # * Clear Starting Flag
  #--------------------------------------------------------------------------
  def clear_starting_flag
    @starting = false
  end
  #--------------------------------------------------------------------------
  # * Determine if Contents Are Empty
  #--------------------------------------------------------------------------
  def empty?
    !@list || @list.size <= 1
  end
  #--------------------------------------------------------------------------
  # * Determine if One of Specified Triggers
  #     triggers : Trigger array
  #--------------------------------------------------------------------------
  def trigger_in?(triggers)
    triggers.include?(@trigger)
  end
  #--------------------------------------------------------------------------
  # * Start Event
  #--------------------------------------------------------------------------
  def start
    return if empty?
    @starting = true
    lock if trigger_in?([0,1,2])
  end
  #--------------------------------------------------------------------------
  # * Temporarily Erase
  #--------------------------------------------------------------------------
  def erase
    @erased = true
    refresh
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    new_page = @erased ? nil : find_proper_page
    setup_page(new_page) if !new_page || new_page != @page
  end
  #--------------------------------------------------------------------------
  # * Find Event Page Meeting Conditions
  #--------------------------------------------------------------------------
  def find_proper_page
    @event.pages.reverse.find {|page| conditions_met?(page) }
  end
  #--------------------------------------------------------------------------
  # * Determine if Event Page Conditions Are Met
  #--------------------------------------------------------------------------
  def conditions_met?(page)
    c = page.condition
    if c.switch1_valid
      return false unless $game_switches[c.switch1_id]
    end
    if c.switch2_valid
      return false unless $game_switches[c.switch2_id]
    end
    if c.variable_valid
      return false if $game_variables[c.variable_id] < c.variable_value
    end
    if c.self_switch_valid
      key = [@map_id, @event.id, c.self_switch_ch]
      return false if $game_self_switches[key] != true
    end
    if c.item_valid
      item = $data_items[c.item_id]
      return false unless $game_party.has_item?(item)
    end
    if c.actor_valid
      actor = $game_actors[c.actor_id]
      return false unless $game_party.members.include?(actor)
    end
    return true
  end
  #--------------------------------------------------------------------------
  # * Event Page Setup
  #--------------------------------------------------------------------------
  def setup_page(new_page)
    @page = new_page
    if @page
      setup_page_settings
    else
      clear_page_settings
    end
    update_bush_depth
    clear_starting_flag
    check_event_trigger_auto
  end
  #--------------------------------------------------------------------------
  # * Clear Event Page Settings
  #--------------------------------------------------------------------------
  def clear_page_settings
    @tile_id          = 0
    @character_name   = ""
    @character_index  = 0
    @move_type        = 0
    @through          = true
    @trigger          = nil
    @list             = nil
    @interpreter      = nil
  end
  #--------------------------------------------------------------------------
  # * Set Up Event Page Settings
  #--------------------------------------------------------------------------
  def setup_page_settings
    @tile_id          = @page.graphic.tile_id
    @character_name   = @page.graphic.character_name
    @character_index  = @page.graphic.character_index
    if @original_direction != @page.graphic.direction
      @direction          = @page.graphic.direction
      @original_direction = @direction
      @prelock_direction  = 0
    end
    if @original_pattern != @page.graphic.pattern
      @pattern            = @page.graphic.pattern
      @original_pattern   = @pattern
    end
    @move_type          = @page.move_type
    @move_speed         = @page.move_speed
    @move_frequency     = @page.move_frequency
    @move_route         = @page.move_route
    @move_route_index   = 0
    @move_route_forcing = false
    @walk_anime         = @page.walk_anime
    @step_anime         = @page.step_anime
    @direction_fix      = @page.direction_fix
    @through            = @page.through
    @priority_type      = @page.priority_type
    @trigger            = @page.trigger
    @list               = @page.list
    @interpreter = @trigger == 4 ? Game_Interpreter.new : nil
  end
  #--------------------------------------------------------------------------
  # * Determine if Touch Event is Triggered
  #--------------------------------------------------------------------------
  def check_event_trigger_touch(x, y)
    return if $game_map.interpreter.running?
    if @trigger == 2 && $game_player.pos?(x, y)
      start if !jumping? && normal_priority?
    end
  end
  #--------------------------------------------------------------------------
  # * Determine if Autorun Event is Triggered
  #--------------------------------------------------------------------------
  def check_event_trigger_auto
    start if @trigger == 3
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    check_event_trigger_auto
    return unless @interpreter
    @interpreter.setup(@list, @event.id) unless @interpreter.running?
    @interpreter.update
  end
end
#==============================================================================
# ** Game_Interpreter
#------------------------------------------------------------------------------
#  An interpreter for executing event commands. This class is used within the
# Game_Map, Game_Troop, and Game_Event classes.
#==============================================================================

class Game_Interpreter
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :map_id             # Map ID
  attr_reader   :event_id           # Event ID (normal events only)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     depth : nest depth
  #--------------------------------------------------------------------------
  def initialize(depth = 0)
    @depth = depth
    check_overflow
    clear
  end
  #--------------------------------------------------------------------------
  # * Check for Overflow
  #    Under normal usage, the depth will not exceed 100. Since recursive
  #    event calls are likely to result in an infinite loop, the depth is
  #    cut off at 100 and an error results.
  #--------------------------------------------------------------------------
  def check_overflow
    if @depth >= 100
      msgbox(Vocab::EventOverflow)
      exit
    end
  end
  #--------------------------------------------------------------------------
  # * Clear
  #--------------------------------------------------------------------------
  def clear
    @map_id = 0
    @event_id = 0
    @list = nil                       # Execution content
    @index = 0                        # Index
    @branch = {}                      # Branch data
    @fiber = nil                      # Fiber
  end
  #--------------------------------------------------------------------------
  # * Event Setup
  #--------------------------------------------------------------------------
  def setup(list, event_id = 0)
    clear
    @map_id = $game_map.map_id
    @event_id = event_id
    @list = list
    create_fiber
  end
  #--------------------------------------------------------------------------
  # * Create Fiber
  #--------------------------------------------------------------------------
  def create_fiber
    @fiber = Fiber.new { run } if @list
  end
  #--------------------------------------------------------------------------
  # * Dump Objects
  #    Define fibers in advance as they are not compatible with Marshal.
  #    Advance the event execution position by one and save.
  #--------------------------------------------------------------------------
  def marshal_dump
    [@depth, @map_id, @event_id, @list, @index + 1, @branch]
  end
  #--------------------------------------------------------------------------
  # * Load Objects
  #     obj:  An array of objects dumped by marshal_dump.
  #    Restore data through multiple assignment and if necessary create fiber.
  #--------------------------------------------------------------------------
  def marshal_load(obj)
    @depth, @map_id, @event_id, @list, @index, @branch = obj
    create_fiber
  end
  #--------------------------------------------------------------------------
  # * Determine if Same Map as at Event Start
  #--------------------------------------------------------------------------
  def same_map?
    @map_id == $game_map.map_id
  end
  #--------------------------------------------------------------------------
  # * Detect/Set Up Call-Reserved Common Events
  #--------------------------------------------------------------------------
  def setup_reserved_common_event
    if $game_temp.common_event_reserved?
      setup($game_temp.reserved_common_event.list)
      $game_temp.clear_common_event
      true
    else
      false
    end
  end
  #--------------------------------------------------------------------------
  # * Execute
  #--------------------------------------------------------------------------
  def run
    wait_for_message
    while @list[@index] do
        execute_command
        @index += 1
      end
      Fiber.yield
      @fiber = nil
    end
    #--------------------------------------------------------------------------
    # * Determine if Running
    #--------------------------------------------------------------------------
    def running?
      @fiber != nil
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      @fiber.resume if @fiber
    end
    #--------------------------------------------------------------------------
    # * Actor Iterator (ID)
    #     param : If 1 or more, ID. If 0, all
    #--------------------------------------------------------------------------
    def iterate_actor_id(param)
      if param == 0
        $game_party.members.each {|actor| yield actor }
      else
        actor = $game_actors[param]
        yield actor if actor
      end
    end
    #--------------------------------------------------------------------------
    # * Actor Iterator (Variable)
    #     param1:  Specify as fixed if 0 and variable if 1
    #     param2:  Actor or variable ID
    #--------------------------------------------------------------------------
    def iterate_actor_var(param1, param2)
      if param1 == 0
        iterate_actor_id(param2) {|actor| yield actor }
      else
        iterate_actor_id($game_variables[param2]) {|actor| yield actor }
      end
    end
    #--------------------------------------------------------------------------
    # * Actor Iterator (Index)
    #     param : If 0 or more, index. If -1, all.
    #--------------------------------------------------------------------------
    def iterate_actor_index(param)
      if param < 0
        $game_party.members.each {|actor| yield actor }
      else
        actor = $game_party.members[param]
        yield actor if actor
      end
    end
    #--------------------------------------------------------------------------
    # * Enemy Iterator (Index)
    #     param : If 0 or more, index. If -1, all.
    #--------------------------------------------------------------------------
    def iterate_enemy_index(param)
      if param < 0
        $game_troop.members.each {|enemy| yield enemy }
      else
        enemy = $game_troop.members[param]
        yield enemy if enemy
      end
    end
    #--------------------------------------------------------------------------
    # * Battler Iterator (Account for Entire Enemy Group or Entire Party)
    #     param1 : If 0, enemy. If 1, actor.
    #     param2:  Index if enemy and ID if actor.
    #--------------------------------------------------------------------------
    def iterate_battler(param1, param2)
      if $game_party.in_battle
        if param1 == 0
          iterate_enemy_index(param2) {|enemy| yield enemy }
        else
          iterate_actor_id(param2) {|actor| yield actor }
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Get Target of Screen Command
    #--------------------------------------------------------------------------
    def screen
      $game_party.in_battle ? $game_troop.screen : $game_map.screen
    end
    #--------------------------------------------------------------------------
    # * Event Command Execution
    #--------------------------------------------------------------------------
    def execute_command
      command = @list[@index]
      @params = command.parameters
      @indent = command.indent
      method_name = "command_#{command.code}"
      send(method_name) if respond_to?(method_name)
    end
    #--------------------------------------------------------------------------
    # * Command Skip
    #    Skip commands deeper than current index and advance index.
    #--------------------------------------------------------------------------
    def command_skip
      @index += 1 while @list[@index + 1].indent > @indent
    end
    #--------------------------------------------------------------------------
    # * Get Code of Next Event Command
    #--------------------------------------------------------------------------
    def next_event_code
      @list[@index + 1].code
    end
    #--------------------------------------------------------------------------
    # * Get Character
    #     param : If -1, player. If 0, this event. Otherwise, event ID.
    #--------------------------------------------------------------------------
    def get_character(param)
      if $game_party.in_battle
        nil
      elsif param < 0
        $game_player
      else
        events = same_map? ? $game_map.events : {}
        events[param > 0 ? param : @event_id]
      end
    end
    #--------------------------------------------------------------------------
    # * Calculate Operated Value
    #     operation    : Operation (0: Increase 1: Decrease)
    #     operand_type : Operand type (0: Constant 1: Variable)
    #     operand      : Operand (numeric value or variable ID)
    #--------------------------------------------------------------------------
    def operate_value(operation, operand_type, operand)
      value = operand_type == 0 ? operand : $game_variables[operand]
      operation == 0 ? value : -value
    end
    #--------------------------------------------------------------------------
    # * Wait
    #--------------------------------------------------------------------------
    def wait(duration)
      duration.times { Fiber.yield }
    end
    #--------------------------------------------------------------------------
    # * Wait While Message Display is Busy
    #--------------------------------------------------------------------------
    def wait_for_message
      Fiber.yield while $game_message.busy?
    end
    #--------------------------------------------------------------------------
    # * Show Text
    #--------------------------------------------------------------------------
    def command_101
      wait_for_message
      $game_message.face_name = @params[0]
      $game_message.face_index = @params[1]
      $game_message.background = @params[2]
      $game_message.position = @params[3]
      while next_event_code == 401       # Text data
        @index += 1
        $game_message.add(@list[@index].parameters[0])
      end
      case next_event_code
      when 102  # Show Choices
        @index += 1
        setup_choices(@list[@index].parameters)
      when 103  # Input Number
        @index += 1
        setup_num_input(@list[@index].parameters)
      when 104  # Select Item
        @index += 1
        setup_item_choice(@list[@index].parameters)
      end
      wait_for_message
    end
    #--------------------------------------------------------------------------
    # * Show Choices
    #--------------------------------------------------------------------------
    def command_102
      wait_for_message
      setup_choices(@params)
      Fiber.yield while $game_message.choice?
    end
    #--------------------------------------------------------------------------
    # * Setup Choices
    #--------------------------------------------------------------------------
    def setup_choices(params)
      params[0].each {|s| $game_message.choices.push(s) }
      $game_message.choice_cancel_type = params[1]
      $game_message.choice_proc = Proc.new {|n| @branch[@indent] = n }
    end
    #--------------------------------------------------------------------------
    # * When [**]
    #--------------------------------------------------------------------------
    def command_402
      command_skip if @branch[@indent] != @params[0]
    end
    #--------------------------------------------------------------------------
    # * When Cancel
    #--------------------------------------------------------------------------
    def command_403
      command_skip if @branch[@indent] != 4
    end
    #--------------------------------------------------------------------------
    # * Input Number
    #--------------------------------------------------------------------------
    def command_103
      wait_for_message
      setup_num_input(@params)
      Fiber.yield while $game_message.num_input?
    end
    #--------------------------------------------------------------------------
    # * Number Input Setup
    #--------------------------------------------------------------------------
    def setup_num_input(params)
      $game_message.num_input_variable_id = params[0]
      $game_message.num_input_digits_max = params[1]
    end
    #--------------------------------------------------------------------------
    # * Select Item
    #--------------------------------------------------------------------------
    def command_104
      wait_for_message
      setup_item_choice(@params)
      Fiber.yield while $game_message.item_choice?
    end
    #--------------------------------------------------------------------------
    # * Set Up Item Selection
    #--------------------------------------------------------------------------
    def setup_item_choice(params)
      $game_message.item_choice_variable_id = params[0]
    end
    #--------------------------------------------------------------------------
    # * Show Scrolling Text
    #--------------------------------------------------------------------------
    def command_105
      Fiber.yield while $game_message.visible
      $game_message.scroll_mode = true
      $game_message.scroll_speed = @params[0]
      $game_message.scroll_no_fast = @params[1]
      while next_event_code == 405
        @index += 1
        $game_message.add(@list[@index].parameters[0])
      end
      wait_for_message
    end
    #--------------------------------------------------------------------------
    # * Comment
    #--------------------------------------------------------------------------
    def command_108
      @comments = [@params[0]]
      while next_event_code == 408
        @index += 1
        @comments.push(@list[@index].parameters[0])
      end
    end
    #--------------------------------------------------------------------------
    # * Conditional Branch
    #--------------------------------------------------------------------------
    def command_111
      result = false
      case @params[0]
      when 0  # Switch
        result = ($game_switches[@params[1]] == (@params[2] == 0))
      when 1  # Variable
        value1 = $game_variables[@params[1]]
        if @params[2] == 0
          value2 = @params[3]
        else
          value2 = $game_variables[@params[3]]
        end
        case @params[4]
        when 0  # value1 is equal to value2
          result = (value1 == value2)
        when 1  # value1 is greater than or equal to value2
          result = (value1 >= value2)
        when 2  # value1 is less than or equal to value2
          result = (value1 <= value2)
        when 3  # value1 is greater than value2
          result = (value1 > value2)
        when 4  # value1 is less than value2
          result = (value1 < value2)
        when 5  # value1 is not equal to value2
          result = (value1 != value2)
        end
      when 2  # Self switch
        if @event_id > 0
          key = [@map_id, @event_id, @params[1]]
          result = ($game_self_switches[key] == (@params[2] == 0))
        end
      when 3  # Timer
        if $game_timer.working?
          if @params[2] == 0
            result = ($game_timer.sec >= @params[1])
          else
            result = ($game_timer.sec <= @params[1])
          end
        end
      when 4  # Actor
        actor = $game_actors[@params[1]]
        if actor
          case @params[2]
          when 0  # in party
            result = ($game_party.members.include?(actor))
          when 1  # name
            result = (actor.name == @params[3])
          when 2  # Class
            result = (actor.class_id == @params[3])
          when 3  # Skills
            result = (actor.skill_learn?($data_skills[@params[3]]))
          when 4  # Weapons
            result = (actor.weapons.include?($data_weapons[@params[3]]))
          when 5  # Armors
            result = (actor.armors.include?($data_armors[@params[3]]))
          when 6  # States
            result = (actor.state?(@params[3]))
          end
        end
      when 5  # Enemy
        enemy = $game_troop.members[@params[1]]
        if enemy
          case @params[2]
          when 0  # appear
            result = (enemy.alive?)
          when 1  # state
            result = (enemy.state?(@params[3]))
          end
        end
      when 6  # Character
        character = get_character(@params[1])
        if character
          result = (character.direction == @params[2])
        end
      when 7  # Gold
        case @params[2]
        when 0  # Greater than or equal to
          result = ($game_party.gold >= @params[1])
        when 1  # Less than or equal to
          result = ($game_party.gold <= @params[1])
        when 2  # Less than
          result = ($game_party.gold < @params[1])
        end
      when 8  # Item
        result = $game_party.has_item?($data_items[@params[1]])
      when 9  # Weapon
        result = $game_party.has_item?($data_weapons[@params[1]], @params[2])
      when 10  # Armor
        result = $game_party.has_item?($data_armors[@params[1]], @params[2])
      when 11  # Button
        result = Input.press?(@params[1])
      when 12  # Script
        result = eval(@params[1])
      when 13  # Vehicle
        result = ($game_player.vehicle == $game_map.vehicles[@params[1]])
      end
      @branch[@indent] = result
      command_skip if !@branch[@indent]
    end
    #--------------------------------------------------------------------------
    # * Else
    #--------------------------------------------------------------------------
    def command_411
      command_skip if @branch[@indent]
    end
    #--------------------------------------------------------------------------
    # * Loop
    #--------------------------------------------------------------------------
    def command_112
    end
    #--------------------------------------------------------------------------
    # * Repeat Above
    #--------------------------------------------------------------------------
    def command_413
      begin
        @index -= 1
      end until @list[@index].indent == @indent
    end
    #--------------------------------------------------------------------------
    # * Break Loop
    #--------------------------------------------------------------------------
    def command_113
      loop do
        @index += 1
        return if @index >= @list.size - 1
        return if @list[@index].code == 413 && @list[@index].indent < @indent
      end
    end
    #--------------------------------------------------------------------------
    # * Exit Event Processing
    #--------------------------------------------------------------------------
    def command_115
      @index = @list.size
    end
    #--------------------------------------------------------------------------
    # * Common Event
    #--------------------------------------------------------------------------
    def command_117
      common_event = $data_common_events[@params[0]]
      if common_event
        child = Game_Interpreter.new(@depth + 1)
        child.setup(common_event.list, same_map? ? @event_id : 0)
        child.run
      end
    end
    #--------------------------------------------------------------------------
    # * Label
    #--------------------------------------------------------------------------
    def command_118
    end
    #--------------------------------------------------------------------------
    # * Jump to Label
    #--------------------------------------------------------------------------
    def command_119
      label_name = @params[0]
      @list.size.times do |i|
        if @list[i].code == 118 && @list[i].parameters[0] == label_name
          @index = i
          return
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Control Switches
    #--------------------------------------------------------------------------
    def command_121
      (@params[0]..@params[1]).each do |i|
        $game_switches[i] = (@params[2] == 0)
      end
    end
    #--------------------------------------------------------------------------
    # * Control Variables
    #--------------------------------------------------------------------------
    def command_122
      value = 0
      case @params[3]  # Operand
      when 0  # Constant
        value = @params[4]
      when 1  # Variable
        value = $game_variables[@params[4]]
      when 2  # Random
        value = @params[4] + rand(@params[5] - @params[4] + 1)
      when 3  # Game Data
        value = game_data_operand(@params[4], @params[5], @params[6])
      when 4  # Script
        value = eval(@params[4])
      end
      (@params[0]..@params[1]).each do |i|
        operate_variable(i, @params[2], value)
      end
    end
    #--------------------------------------------------------------------------
    # * Get Game Data for Variable Operand
    #--------------------------------------------------------------------------
    def game_data_operand(type, param1, param2)
      case type
      when 0  # Items
        return $game_party.item_number($data_items[param1])
      when 1  # Weapons
        return $game_party.item_number($data_weapons[param1])
      when 2  # Armor
        return $game_party.item_number($data_armors[param1])
      when 3  # Actors
        actor = $game_actors[param1]
        if actor
          case param2
          when 0      # Level
            return actor.level
          when 1      # EXP
            return actor.exp
          when 2      # HP
            return actor.hp
          when 3      # MP
            return actor.mp
          when 4..11  # Parameter
            return actor.param(param2 - 4)
          end
        end
      when 4  # Enemies
        enemy = $game_troop.members[param1]
        if enemy
          case param2
          when 0      # HP
            return enemy.hp
          when 1      # MP
            return enemy.mp
          when 2..9   # Parameter
            return enemy.param(param2 - 2)
          end
        end
      when 5  # Character
        character = get_character(param1)
        if character
          case param2
          when 0  # x-coordinate
            return character.x
          when 1  # y-coordinate
            return character.y
          when 2  # direction
            return character.direction
          when 3  # screen x-coordinate
            return character.screen_x
          when 4  # screen y-coordinate
            return character.screen_y
          end
        end
      when 6  # Party
        actor = $game_party.members[param1]
        return actor ? actor.id : 0
      when 7  # Other
        case param1
        when 0  # map ID
          return $game_map.map_id
        when 1  # number of party members
          return $game_party.members.size
        when 2  # gold
          return $game_party.gold
        when 3  # steps
          return $game_party.steps
        when 4  # play time
          return Graphics.frame_count / Graphics.frame_rate
        when 5  # timer
          return $game_timer.sec
        when 6  # save count
          return $game_system.save_count
        when 7  # battle count
          return $game_system.battle_count
        end
      end
      return 0
    end
    #--------------------------------------------------------------------------
    # * Execute Variable Operation
    #--------------------------------------------------------------------------
    def operate_variable(variable_id, operation_type, value)
      begin
        case operation_type
        when 0  # Set
          $game_variables[variable_id] = value
        when 1  # Add
          $game_variables[variable_id] += value
        when 2  # Sub
          $game_variables[variable_id] -= value
        when 3  # Mul
          $game_variables[variable_id] *= value
        when 4  # Div
          $game_variables[variable_id] /= value
        when 5  # Mod
          $game_variables[variable_id] %= value
        end
      rescue
        $game_variables[variable_id] = 0
      end
    end
    #--------------------------------------------------------------------------
    # * Control Self Switch
    #--------------------------------------------------------------------------
    def command_123
      if @event_id > 0
        key = [@map_id, @event_id, @params[0]]
        $game_self_switches[key] = (@params[1] == 0)
      end
    end
    #--------------------------------------------------------------------------
    # * Control Timer
    #--------------------------------------------------------------------------
    def command_124
      if @params[0] == 0  # Start
        $game_timer.start(@params[1] * Graphics.frame_rate)
      else                # Stop
        $game_timer.stop
      end
    end
    #--------------------------------------------------------------------------
    # * Change Gold
    #--------------------------------------------------------------------------
    def command_125
      value = operate_value(@params[0], @params[1], @params[2])
      $game_party.gain_gold(value)
    end
    #--------------------------------------------------------------------------
    # * Change Items
    #--------------------------------------------------------------------------
    def command_126
      value = operate_value(@params[1], @params[2], @params[3])
      $game_party.gain_item($data_items[@params[0]], value)
    end
    #--------------------------------------------------------------------------
    # * Change Weapons
    #--------------------------------------------------------------------------
    def command_127
      value = operate_value(@params[1], @params[2], @params[3])
      $game_party.gain_item($data_weapons[@params[0]], value, @params[4])
    end
    #--------------------------------------------------------------------------
    # * Change Armor
    #--------------------------------------------------------------------------
    def command_128
      value = operate_value(@params[1], @params[2], @params[3])
      $game_party.gain_item($data_armors[@params[0]], value, @params[4])
    end
    #--------------------------------------------------------------------------
    # * Change Party Member
    #--------------------------------------------------------------------------
    def command_129
      actor = $game_actors[@params[0]]
      if actor
        if @params[1] == 0    # Add
          if @params[2] == 1  # Initialize
            $game_actors[@params[0]].setup(@params[0])
          end
          $game_party.add_actor(@params[0])
        else                  # Remove
          $game_party.remove_actor(@params[0])
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Change Battle BGM
    #--------------------------------------------------------------------------
    def command_132
      $game_system.battle_bgm = @params[0]
    end
    #--------------------------------------------------------------------------
    # * Change Battle End ME
    #--------------------------------------------------------------------------
    def command_133
      $game_system.battle_end_me = @params[0]
    end
    #--------------------------------------------------------------------------
    # * Change Save Access
    #--------------------------------------------------------------------------
    def command_134
      $game_system.save_disabled = (@params[0] == 0)
    end
    #--------------------------------------------------------------------------
    # * Change Menu Access
    #--------------------------------------------------------------------------
    def command_135
      $game_system.menu_disabled = (@params[0] == 0)
    end
    #--------------------------------------------------------------------------
    # * Change Encounter Disable
    #--------------------------------------------------------------------------
    def command_136
      $game_system.encounter_disabled = (@params[0] == 0)
      $game_player.make_encounter_count
    end
    #--------------------------------------------------------------------------
    # * Change Formation Access
    #--------------------------------------------------------------------------
    def command_137
      $game_system.formation_disabled = (@params[0] == 0)
    end
    #--------------------------------------------------------------------------
    # * Change Window Color
    #--------------------------------------------------------------------------
    def command_138
      $game_system.window_tone = @params[0]
    end
    #--------------------------------------------------------------------------
    # * Transfer Player
    #--------------------------------------------------------------------------
    def command_201
      return if $game_party.in_battle
      Fiber.yield while $game_player.transfer? || $game_message.visible
      if @params[0] == 0                      # Direct designation
        map_id = @params[1]
        x = @params[2]
        y = @params[3]
      else                                    # Designation with variables
        map_id = $game_variables[@params[1]]
        x = $game_variables[@params[2]]
        y = $game_variables[@params[3]]
      end
      $game_player.reserve_transfer(map_id, x, y, @params[4])
      $game_temp.fade_type = @params[5]
      Fiber.yield while $game_player.transfer?
    end
    #--------------------------------------------------------------------------
    # * Set Vehicle Location
    #--------------------------------------------------------------------------
    def command_202
      if @params[1] == 0                      # Direct designation
        map_id = @params[2]
        x = @params[3]
        y = @params[4]
      else                                    # Designation with variables
        map_id = $game_variables[@params[2]]
        x = $game_variables[@params[3]]
        y = $game_variables[@params[4]]
      end
      vehicle = $game_map.vehicles[@params[0]]
      vehicle.set_location(map_id, x, y) if vehicle
    end
    #--------------------------------------------------------------------------
    # * Set Event Location
    #--------------------------------------------------------------------------
    def command_203
      character = get_character(@params[0])
      if character
        if @params[1] == 0                      # Direct designation
          character.moveto(@params[2], @params[3])
        elsif @params[1] == 1                   # Designation with variables
          new_x = $game_variables[@params[2]]
          new_y = $game_variables[@params[3]]
          character.moveto(new_x, new_y)
        else                                    # Exchange with another event
          character2 = get_character(@params[2])
          character.swap(character2) if character2
        end
        character.set_direction(@params[4]) if @params[4] > 0
      end
    end
    #--------------------------------------------------------------------------
    # * Scroll Map
    #--------------------------------------------------------------------------
    def command_204
      return if $game_party.in_battle
      Fiber.yield while $game_map.scrolling?
      $game_map.start_scroll(@params[0], @params[1], @params[2])
    end
    #--------------------------------------------------------------------------
    # * Set Move Route
    #--------------------------------------------------------------------------
    def command_205
      $game_map.refresh if $game_map.need_refresh
      character = get_character(@params[0])
      if character
        character.force_move_route(@params[1])
        Fiber.yield while character.move_route_forcing if @params[1].wait
      end
    end
    #--------------------------------------------------------------------------
    # * Getting On and Off Vehicles
    #--------------------------------------------------------------------------
    def command_206
      $game_player.get_on_off_vehicle
    end
    #--------------------------------------------------------------------------
    # * Change Transparency
    #--------------------------------------------------------------------------
    def command_211
      $game_player.transparent = (@params[0] == 0)
    end
    #--------------------------------------------------------------------------
    # * Show Animation
    #--------------------------------------------------------------------------
    def command_212
      character = get_character(@params[0])
      if character
        character.animation_id = @params[1]
        Fiber.yield while character.animation_id > 0 if @params[2]
      end
    end
    #--------------------------------------------------------------------------
    # * Show Balloon Icon
    #--------------------------------------------------------------------------
    def command_213
      character = get_character(@params[0])
      if character
        character.balloon_id = @params[1]
        Fiber.yield while character.balloon_id > 0 if @params[2]
      end
    end
    #--------------------------------------------------------------------------
    # * Temporarily Erase Event
    #--------------------------------------------------------------------------
    def command_214
      $game_map.events[@event_id].erase if same_map? && @event_id > 0
    end
    #--------------------------------------------------------------------------
    # * Change Player Followers
    #--------------------------------------------------------------------------
    def command_216
      $game_player.followers.visible = (@params[0] == 0)
      $game_player.refresh
    end
    #--------------------------------------------------------------------------
    # * Gather Followers
    #--------------------------------------------------------------------------
    def command_217
      return if $game_party.in_battle
      $game_player.followers.gather
      Fiber.yield until $game_player.followers.gather?
    end
    #--------------------------------------------------------------------------
    # * Fadeout Screen
    #--------------------------------------------------------------------------
    def command_221
      Fiber.yield while $game_message.visible
      screen.start_fadeout(30)
      wait(30)
    end
    #--------------------------------------------------------------------------
    # * Fadein Screen
    #--------------------------------------------------------------------------
    def command_222
      Fiber.yield while $game_message.visible
      screen.start_fadein(30)
      wait(30)
    end
    #--------------------------------------------------------------------------
    # * Tint Screen
    #--------------------------------------------------------------------------
    def command_223
      screen.start_tone_change(@params[0], @params[1])
      wait(@params[1]) if @params[2]
    end
    #--------------------------------------------------------------------------
    # * Screen Flash
    #--------------------------------------------------------------------------
    def command_224
      screen.start_flash(@params[0], @params[1])
      wait(@params[1]) if @params[2]
    end
    #--------------------------------------------------------------------------
    # * Screen Shake
    #--------------------------------------------------------------------------
    def command_225
      screen.start_shake(@params[0], @params[1], @params[2])
      wait(@params[1]) if @params[2]
    end
    #--------------------------------------------------------------------------
    # * Wait
    #--------------------------------------------------------------------------
    def command_230
      wait(@params[0])
    end
    #--------------------------------------------------------------------------
    # * Show Picture
    #--------------------------------------------------------------------------
    def command_231
      if @params[3] == 0    # Direct designation
        x = @params[4]
        y = @params[5]
      else                  # Designation with variables
        x = $game_variables[@params[4]]
        y = $game_variables[@params[5]]
      end
      screen.pictures[@params[0]].show(@params[1], @params[2],
                                       x, y, @params[6], @params[7], @params[8], @params[9])
    end
    #--------------------------------------------------------------------------
    # * Move Picture
    #--------------------------------------------------------------------------
    def command_232
      if @params[3] == 0    # Direct designation
        x = @params[4]
        y = @params[5]
      else                  # Designation with variables
        x = $game_variables[@params[4]]
        y = $game_variables[@params[5]]
      end
      screen.pictures[@params[0]].move(@params[2], x, y, @params[6],
                                       @params[7], @params[8], @params[9], @params[10])
      wait(@params[10]) if @params[11]
    end
    #--------------------------------------------------------------------------
    # * Rotate Picture
    #--------------------------------------------------------------------------
    def command_233
      screen.pictures[@params[0]].rotate(@params[1])
    end
    #--------------------------------------------------------------------------
    # * Tint Picture
    #--------------------------------------------------------------------------
    def command_234
      screen.pictures[@params[0]].start_tone_change(@params[1], @params[2])
      wait(@params[2]) if @params[3]
    end
    #--------------------------------------------------------------------------
    # * Erase Picture
    #--------------------------------------------------------------------------
    def command_235
      screen.pictures[@params[0]].erase
    end
    #--------------------------------------------------------------------------
    # * Set Weather
    #--------------------------------------------------------------------------
    def command_236
      return if $game_party.in_battle
      screen.change_weather(@params[0], @params[1], @params[2])
      wait(@params[2]) if @params[3]
    end
    #--------------------------------------------------------------------------
    # * Play BGM
    #--------------------------------------------------------------------------
    def command_241
      @params[0].play
    end
    #--------------------------------------------------------------------------
    # * Fadeout BGM
    #--------------------------------------------------------------------------
    def command_242
      RPG::BGM.fade(@params[0] * 1000)
    end
    #--------------------------------------------------------------------------
    # * Save BGM
    #--------------------------------------------------------------------------
    def command_243
      $game_system.save_bgm
    end
    #--------------------------------------------------------------------------
    # * Resume BGM
    #--------------------------------------------------------------------------
    def command_244
      $game_system.replay_bgm
    end
    #--------------------------------------------------------------------------
    # * Play BGS
    #--------------------------------------------------------------------------
    def command_245
      @params[0].play
    end
    #--------------------------------------------------------------------------
    # * Fadeout BGS
    #--------------------------------------------------------------------------
    def command_246
      RPG::BGS.fade(@params[0] * 1000)
    end
    #--------------------------------------------------------------------------
    # * Play ME
    #--------------------------------------------------------------------------
    def command_249
      @params[0].play
    end
    #--------------------------------------------------------------------------
    # * Play SE
    #--------------------------------------------------------------------------
    def command_250
      @params[0].play
    end
    #--------------------------------------------------------------------------
    # * Stop SE
    #--------------------------------------------------------------------------
    def command_251
      RPG::SE.stop
    end
    #--------------------------------------------------------------------------
    # * Play Movie
    #--------------------------------------------------------------------------
    def command_261
      Fiber.yield while $game_message.visible
      Fiber.yield
      name = @params[0]
      Graphics.play_movie('Movies/' + name) unless name.empty?
    end
    #--------------------------------------------------------------------------
    # * Change Map Name Display
    #--------------------------------------------------------------------------
    def command_281
      $game_map.name_display = (@params[0] == 0)
    end
    #--------------------------------------------------------------------------
    # * Change Tileset
    #--------------------------------------------------------------------------
    def command_282
      $game_map.change_tileset(@params[0])
    end
    #--------------------------------------------------------------------------
    # * Change Battle Background
    #--------------------------------------------------------------------------
    def command_283
      $game_map.change_battleback(@params[0], @params[1])
    end
    #--------------------------------------------------------------------------
    # * Change Parallax Background
    #--------------------------------------------------------------------------
    def command_284
      $game_map.change_parallax(@params[0], @params[1], @params[2],
                                @params[3], @params[4])
    end
    #--------------------------------------------------------------------------
    # * Get Location Info
    #--------------------------------------------------------------------------
    def command_285
      if @params[2] == 0      # Direct designation
        x = @params[3]
        y = @params[4]
      else                    # Designation with variables
        x = $game_variables[@params[3]]
        y = $game_variables[@params[4]]
      end
      case @params[1]
      when 0      # Terrain Tag
        value = $game_map.terrain_tag(x, y)
      when 1      # Event ID
        value = $game_map.event_id_xy(x, y)
      when 2..4   # Tile ID
        value = $game_map.tile_id(x, y, @params[1] - 2)
      else        # Region ID
        value = $game_map.region_id(x, y)
      end
      $game_variables[@params[0]] = value
    end
    #--------------------------------------------------------------------------
    # * Battle Processing
    #--------------------------------------------------------------------------
    def command_301
      return if $game_party.in_battle
      if @params[0] == 0                      # Direct designation
        troop_id = @params[1]
      elsif @params[0] == 1                   # Designation with variables
        troop_id = $game_variables[@params[1]]
      else                                    # Map-designated troop
        troop_id = $game_player.make_encounter_troop_id
      end
      if $data_troops[troop_id]
        BattleManager.setup(troop_id, @params[2], @params[3])
        BattleManager.event_proc = Proc.new {|n| @branch[@indent] = n }
        $game_player.make_encounter_count
        SceneManager.call(Scene_Battle)
      end
      Fiber.yield
    end
    #--------------------------------------------------------------------------
    # * If Win
    #--------------------------------------------------------------------------
    def command_601
      command_skip if @branch[@indent] != 0
    end
    #--------------------------------------------------------------------------
    # * If Escape
    #--------------------------------------------------------------------------
    def command_602
      command_skip if @branch[@indent] != 1
    end
    #--------------------------------------------------------------------------
    # * If Lose
    #--------------------------------------------------------------------------
    def command_603
      command_skip if @branch[@indent] != 2
    end
    #--------------------------------------------------------------------------
    # * Shop Processing
    #--------------------------------------------------------------------------
    def command_302
      return if $game_party.in_battle
      goods = [@params]
      while next_event_code == 605
        @index += 1
        goods.push(@list[@index].parameters)
      end
      SceneManager.call(Scene_Shop)
      SceneManager.scene.prepare(goods, @params[4])
      Fiber.yield
    end
    #--------------------------------------------------------------------------
    # * Name Input Processing
    #--------------------------------------------------------------------------
    def command_303
      return if $game_party.in_battle
      if $data_actors[@params[0]]
        SceneManager.call(Scene_Name)
        SceneManager.scene.prepare(@params[0], @params[1])
        Fiber.yield
      end
    end
    #--------------------------------------------------------------------------
    # * Change HP
    #--------------------------------------------------------------------------
    def command_311
      value = operate_value(@params[2], @params[3], @params[4])
      iterate_actor_var(@params[0], @params[1]) do |actor|
        next if actor.dead?
        actor.change_hp(value, @params[5])
        actor.perform_collapse_effect if actor.dead?
      end
      SceneManager.goto(Scene_Gameover) if $game_party.all_dead?
    end
    #--------------------------------------------------------------------------
    # * Change MP
    #--------------------------------------------------------------------------
    def command_312
      value = operate_value(@params[2], @params[3], @params[4])
      iterate_actor_var(@params[0], @params[1]) do |actor|
        actor.mp += value
      end
    end
    #--------------------------------------------------------------------------
    # * Change State
    #--------------------------------------------------------------------------
    def command_313
      iterate_actor_var(@params[0], @params[1]) do |actor|
        already_dead = actor.dead?
        if @params[2] == 0
          actor.add_state(@params[3])
        else
          actor.remove_state(@params[3])
        end
        actor.perform_collapse_effect if actor.dead? && !already_dead
      end
      $game_party.clear_results
    end
    #--------------------------------------------------------------------------
    # * Recover All
    #--------------------------------------------------------------------------
    def command_314
      iterate_actor_var(@params[0], @params[1]) do |actor|
        actor.recover_all
      end
    end
    #--------------------------------------------------------------------------
    # * Change EXP
    #--------------------------------------------------------------------------
    def command_315
      value = operate_value(@params[2], @params[3], @params[4])
      iterate_actor_var(@params[0], @params[1]) do |actor|
        actor.change_exp(actor.exp + value, @params[5])
      end
    end
    #--------------------------------------------------------------------------
    # * Change Level
    #--------------------------------------------------------------------------
    def command_316
      value = operate_value(@params[2], @params[3], @params[4])
      iterate_actor_var(@params[0], @params[1]) do |actor|
        actor.change_level(actor.level + value, @params[5])
      end
    end
    #--------------------------------------------------------------------------
    # * Change Parameters
    #--------------------------------------------------------------------------
    def command_317
      value = operate_value(@params[3], @params[4], @params[5])
      iterate_actor_var(@params[0], @params[1]) do |actor|
        actor.add_param(@params[2], value)
      end
    end
    #--------------------------------------------------------------------------
    # * Change Skills
    #--------------------------------------------------------------------------
    def command_318
      iterate_actor_var(@params[0], @params[1]) do |actor|
        if @params[2] == 0
          actor.learn_skill(@params[3])
        else
          actor.forget_skill(@params[3])
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Change Equipment
    #--------------------------------------------------------------------------
    def command_319
      actor = $game_actors[@params[0]]
      actor.change_equip_by_id(@params[1], @params[2]) if actor
    end
    #--------------------------------------------------------------------------
    # * Change Name
    #--------------------------------------------------------------------------
    def command_320
      actor = $game_actors[@params[0]]
      actor.name = @params[1] if actor
    end
    #--------------------------------------------------------------------------
    # * Change Class
    #--------------------------------------------------------------------------
    def command_321
      actor = $game_actors[@params[0]]
      actor.change_class(@params[1]) if actor && $data_classes[@params[1]]
    end
    #--------------------------------------------------------------------------
    # * Change Actor Graphic
    #--------------------------------------------------------------------------
    def command_322
      actor = $game_actors[@params[0]]
      if actor
        actor.set_graphic(@params[1], @params[2], @params[3], @params[4])
      end
      $game_player.refresh
    end
    #--------------------------------------------------------------------------
    # * Change Vehicle Graphic
    #--------------------------------------------------------------------------
    def command_323
      vehicle = $game_map.vehicles[@params[0]]
      vehicle.set_graphic(@params[1], @params[2]) if vehicle
    end
    #--------------------------------------------------------------------------
    # * Change Nickname
    #--------------------------------------------------------------------------
    def command_324
      actor = $game_actors[@params[0]]
      actor.nickname = @params[1] if actor
    end
    #--------------------------------------------------------------------------
    # * Change Enemy HP
    #--------------------------------------------------------------------------
    def command_331
      value = operate_value(@params[1], @params[2], @params[3])
      iterate_enemy_index(@params[0]) do |enemy|
        return if enemy.dead?
        enemy.change_hp(value, @params[4])
        enemy.perform_collapse_effect if enemy.dead?
      end
    end
    #--------------------------------------------------------------------------
    # * Change Enemy MP
    #--------------------------------------------------------------------------
    def command_332
      value = operate_value(@params[1], @params[2], @params[3])
      iterate_enemy_index(@params[0]) do |enemy|
        enemy.mp += value
      end
    end
    #--------------------------------------------------------------------------
    # * Change Enemy State
    #--------------------------------------------------------------------------
    def command_333
      iterate_enemy_index(@params[0]) do |enemy|
        already_dead = enemy.dead?
        if @params[1] == 0
          enemy.add_state(@params[2])
        else
          enemy.remove_state(@params[2])
        end
        enemy.perform_collapse_effect if enemy.dead? && !already_dead
      end
    end
    #--------------------------------------------------------------------------
    # * Enemy Recover All
    #--------------------------------------------------------------------------
    def command_334
      iterate_enemy_index(@params[0]) do |enemy|
        enemy.recover_all
      end
    end
    #--------------------------------------------------------------------------
    # * Enemy Appear
    #--------------------------------------------------------------------------
    def command_335
      iterate_enemy_index(@params[0]) do |enemy|
        enemy.appear
        $game_troop.make_unique_names
      end
    end
    #--------------------------------------------------------------------------
    # * Enemy Transform
    #--------------------------------------------------------------------------
    def command_336
      iterate_enemy_index(@params[0]) do |enemy|
        enemy.transform(@params[1])
        $game_troop.make_unique_names
      end
    end
    #--------------------------------------------------------------------------
    # * Show Battle Animation
    #--------------------------------------------------------------------------
    def command_337
      iterate_enemy_index(@params[0]) do |enemy|
        enemy.animation_id = @params[1] if enemy.alive?
      end
    end
    #--------------------------------------------------------------------------
    # * Force Action
    #--------------------------------------------------------------------------
    def command_339
      iterate_battler(@params[0], @params[1]) do |battler|
        next if battler.death_state?
        battler.force_action(@params[2], @params[3])
        BattleManager.force_action(battler)
        Fiber.yield while BattleManager.action_forced?
      end
    end
    #--------------------------------------------------------------------------
    # * Abort Battle
    #--------------------------------------------------------------------------
    def command_340
      BattleManager.abort
      Fiber.yield
    end
    #--------------------------------------------------------------------------
    # * Open Menu Screen
    #--------------------------------------------------------------------------
    def command_351
      return if $game_party.in_battle
      SceneManager.call(Scene_Menu)
      Window_MenuCommand::init_command_position
      Fiber.yield
    end
    #--------------------------------------------------------------------------
    # * Open Save Screen
    #--------------------------------------------------------------------------
    def command_352
      return if $game_party.in_battle
      SceneManager.call(Scene_Save)
      Fiber.yield
    end
    #--------------------------------------------------------------------------
    # * Game Over
    #--------------------------------------------------------------------------
    def command_353
      SceneManager.goto(Scene_Gameover)
      Fiber.yield
    end
    #--------------------------------------------------------------------------
    # * Return to Title Screen
    #--------------------------------------------------------------------------
    def command_354
      SceneManager.goto(Scene_Title)
      Fiber.yield
    end
    #--------------------------------------------------------------------------
    # * Script
    #--------------------------------------------------------------------------
    def command_355
      script = @list[@index].parameters[0] + "\n"
      while next_event_code == 655
        @index += 1
        script += @list[@index].parameters[0] + "\n"
      end
      eval(script)
    end
  end
  #==============================================================================
  # ** Sprite_Base
  #------------------------------------------------------------------------------
  #  A sprite class with animation display processing added.
  #==============================================================================

  class Sprite_Base < Sprite
    #--------------------------------------------------------------------------
    # * Class Variable
    #--------------------------------------------------------------------------
    @@ani_checker = []
    @@ani_spr_checker = []
    @@_reference_count = {}
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(viewport = nil)
      super(viewport)
      @use_sprite = true        # Sprite use flag
      @ani_duration = 0         # Remaining time of animation
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      super
      dispose_animation
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      update_animation
      @@ani_checker.clear
      @@ani_spr_checker.clear
    end
    #--------------------------------------------------------------------------
    # * Determine if animation is being displayed
    #--------------------------------------------------------------------------
    def animation?
      @animation != nil
    end
    #--------------------------------------------------------------------------
    # * Start Animation
    #--------------------------------------------------------------------------
    def start_animation(animation, mirror = false)
      dispose_animation
      @animation = animation
      if @animation
        @ani_mirror = mirror
        set_animation_rate
        @ani_duration = @animation.frame_max * @ani_rate + 1
        load_animation_bitmap
        make_animation_sprites
        set_animation_origin
      end
    end
    #--------------------------------------------------------------------------
    # * Set Animation Speed
    #--------------------------------------------------------------------------
    def set_animation_rate
      @ani_rate = 4     # Fixed value by default
    end
    #--------------------------------------------------------------------------
    # * Read (Load) Animation Graphics
    #--------------------------------------------------------------------------
    def load_animation_bitmap
      animation1_name = @animation.animation1_name
      animation1_hue = @animation.animation1_hue
      animation2_name = @animation.animation2_name
      animation2_hue = @animation.animation2_hue
      @ani_bitmap1 = Cache.animation(animation1_name, animation1_hue)
      @ani_bitmap2 = Cache.animation(animation2_name, animation2_hue)
      if @@_reference_count.include?(@ani_bitmap1)
        @@_reference_count[@ani_bitmap1] += 1
      else
        @@_reference_count[@ani_bitmap1] = 1
      end
      if @@_reference_count.include?(@ani_bitmap2)
        @@_reference_count[@ani_bitmap2] += 1
      else
        @@_reference_count[@ani_bitmap2] = 1
      end
      Graphics.frame_reset
    end
    #--------------------------------------------------------------------------
    # * Create Animation Spirtes
    #--------------------------------------------------------------------------
    def make_animation_sprites
      @ani_sprites = []
      if @use_sprite && !@@ani_spr_checker.include?(@animation)
        16.times do
          sprite = ::Sprite.new(viewport)
          sprite.visible = false
          @ani_sprites.push(sprite)
        end
        if @animation.position == 3
          @@ani_spr_checker.push(@animation)
        end
      end
      @ani_duplicated = @@ani_checker.include?(@animation)
      if !@ani_duplicated && @animation.position == 3
        @@ani_checker.push(@animation)
      end
    end
    #--------------------------------------------------------------------------
    # * Set Animation Origin
    #--------------------------------------------------------------------------
    def set_animation_origin
      if @animation.position == 3
        if viewport == nil
          @ani_ox = Graphics.width / 2
          @ani_oy = Graphics.height / 2
        else
          @ani_ox = viewport.rect.width / 2
          @ani_oy = viewport.rect.height / 2
        end
      else
        @ani_ox = x - ox + width / 2
        @ani_oy = y - oy + height / 2
        if @animation.position == 0
          @ani_oy -= height / 2
        elsif @animation.position == 2
          @ani_oy += height / 2
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Free Animation
    #--------------------------------------------------------------------------
    def dispose_animation
      if @ani_bitmap1
        @@_reference_count[@ani_bitmap1] -= 1
        if @@_reference_count[@ani_bitmap1] == 0
          @ani_bitmap1.dispose
        end
      end
      if @ani_bitmap2
        @@_reference_count[@ani_bitmap2] -= 1
        if @@_reference_count[@ani_bitmap2] == 0
          @ani_bitmap2.dispose
        end
      end
      if @ani_sprites
        @ani_sprites.each {|sprite| sprite.dispose }
        @ani_sprites = nil
        @animation = nil
      end
      @ani_bitmap1 = nil
      @ani_bitmap2 = nil
    end
    #--------------------------------------------------------------------------
    # * Update Animation
    #--------------------------------------------------------------------------
    def update_animation
      return unless animation?
      @ani_duration -= 1
      if @ani_duration % @ani_rate == 0
        if @ani_duration > 0
          frame_index = @animation.frame_max
          frame_index -= (@ani_duration + @ani_rate - 1) / @ani_rate
          animation_set_sprites(@animation.frames[frame_index])
          @animation.timings.each do |timing|
            animation_process_timing(timing) if timing.frame == frame_index
          end
        else
          end_animation
        end
      end
    end
    #--------------------------------------------------------------------------
    # * End Animation
    #--------------------------------------------------------------------------
    def end_animation
      dispose_animation
    end
    #--------------------------------------------------------------------------
    # * Set Animation Sprite
    #     frame : Frame data (RPG::Animation::Frame)
    #--------------------------------------------------------------------------
    def animation_set_sprites(frame)
      cell_data = frame.cell_data
      @ani_sprites.each_with_index do |sprite, i|
        next unless sprite
        pattern = cell_data[i, 0]
        if !pattern || pattern < 0
          sprite.visible = false
          next
        end
        sprite.bitmap = pattern < 100 ? @ani_bitmap1 : @ani_bitmap2
        sprite.visible = true
        sprite.src_rect.set(pattern % 5 * 192,
                            pattern % 100 / 5 * 192, 192, 192)
        if @ani_mirror
          sprite.x = @ani_ox - cell_data[i, 1]
          sprite.y = @ani_oy + cell_data[i, 2]
          sprite.angle = (360 - cell_data[i, 4])
          sprite.mirror = (cell_data[i, 5] == 0)
        else
          sprite.x = @ani_ox + cell_data[i, 1]
          sprite.y = @ani_oy + cell_data[i, 2]
          sprite.angle = cell_data[i, 4]
          sprite.mirror = (cell_data[i, 5] == 1)
        end
        sprite.z = self.z + 300 + i
        sprite.ox = 96
        sprite.oy = 96
        sprite.zoom_x = cell_data[i, 3] / 100.0
        sprite.zoom_y = cell_data[i, 3] / 100.0
        sprite.opacity = cell_data[i, 6] * self.opacity / 255.0
        sprite.blend_type = cell_data[i, 7]
      end
    end
    #--------------------------------------------------------------------------
    # * SE and Flash Timing Processing
    #     timing : Timing data (RPG::Animation::Timing)
    #--------------------------------------------------------------------------
    def animation_process_timing(timing)
      timing.se.play unless @ani_duplicated
      case timing.flash_scope
      when 1
        self.flash(timing.flash_color, timing.flash_duration * @ani_rate)
      when 2
        if viewport && !@ani_duplicated
          viewport.flash(timing.flash_color, timing.flash_duration * @ani_rate)
        end
      when 3
        self.flash(nil, timing.flash_duration * @ani_rate)
      end
    end
  end
  #==============================================================================
  # ** Sprite_Character
  #------------------------------------------------------------------------------
  #  This sprite is used to display characters. It observes an instance of the
  # Game_Character class and automatically changes sprite state.
  #==============================================================================

  class Sprite_Character < Sprite_Base
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :character
    #--------------------------------------------------------------------------
    # * Object Initialization
    #     character : Game_Character
    #--------------------------------------------------------------------------
    def initialize(viewport, character = nil)
      super(viewport)
      @character = character
      @balloon_duration = 0
      update
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      end_animation
      end_balloon
      super
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      update_bitmap
      update_src_rect
      update_position
      update_other
      update_balloon
      setup_new_effect
    end
    #--------------------------------------------------------------------------
    # * Get Tileset Image That Includes the Designated Tile
    #--------------------------------------------------------------------------
    def tileset_bitmap(tile_id)
      Cache.tileset($game_map.tileset.tileset_names[5 + tile_id / 256])
    end
    #--------------------------------------------------------------------------
    # * Update Transfer Origin Bitmap
    #--------------------------------------------------------------------------
    def update_bitmap
      if graphic_changed?
        @tile_id = @character.tile_id
        @character_name = @character.character_name
        @character_index = @character.character_index
        if @tile_id > 0
          set_tile_bitmap
        else
          set_character_bitmap
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Determine if Graphic Changed
    #--------------------------------------------------------------------------
    def graphic_changed?
      @tile_id != @character.tile_id ||
        @character_name != @character.character_name ||
        @character_index != @character.character_index
    end
    #--------------------------------------------------------------------------
    # * Set Tile Bitmap
    #--------------------------------------------------------------------------
    def set_tile_bitmap
      sx = (@tile_id / 128 % 2 * 8 + @tile_id % 8) * 32;
      sy = @tile_id % 256 / 8 % 16 * 32;
      self.bitmap = tileset_bitmap(@tile_id)
      self.src_rect.set(sx, sy, 32, 32)
      self.ox = 16
      self.oy = 32
    end
    #--------------------------------------------------------------------------
    # * Set Character Bitmap
    #--------------------------------------------------------------------------
    def set_character_bitmap
      self.bitmap = Cache.character(@character_name)
      sign = @character_name[/^[\!\$]./]
      if sign && sign.include?('$')
        @cw = bitmap.width / 3
        @ch = bitmap.height / 4
      else
        @cw = bitmap.width / 12
        @ch = bitmap.height / 8
      end
      self.ox = @cw / 2
      self.oy = @ch
    end
    #--------------------------------------------------------------------------
    # * Update Transfer Origin Rectangle
    #--------------------------------------------------------------------------
    def update_src_rect
      if @tile_id == 0
        index = @character.character_index
        pattern = @character.pattern < 3 ? @character.pattern : 1
        sx = (index % 4 * 3 + pattern) * @cw
        sy = (index / 4 * 4 + (@character.direction - 2) / 2) * @ch
        self.src_rect.set(sx, sy, @cw, @ch)
      end
    end
    #--------------------------------------------------------------------------
    # * Update Position
    #--------------------------------------------------------------------------
    def update_position
      move_animation(@character.screen_x - x, @character.screen_y - y)
      self.x = @character.screen_x
      self.y = @character.screen_y
      self.z = @character.screen_z
    end
    #--------------------------------------------------------------------------
    # * Update Other
    #--------------------------------------------------------------------------
    def update_other
      self.opacity = @character.opacity
      self.blend_type = @character.blend_type
      self.bush_depth = @character.bush_depth
      self.visible = !@character.transparent
    end
    #--------------------------------------------------------------------------
    # * Set New Effect
    #--------------------------------------------------------------------------
    def setup_new_effect
      if !animation? && @character.animation_id > 0
        animation = $data_animations[@character.animation_id]
        start_animation(animation)
      end
      if !@balloon_sprite && @character.balloon_id > 0
        @balloon_id = @character.balloon_id
        start_balloon
      end
    end
    #--------------------------------------------------------------------------
    # * Move Animation
    #--------------------------------------------------------------------------
    def move_animation(dx, dy)
      if @animation && @animation.position != 3
        @ani_ox += dx
        @ani_oy += dy
        @ani_sprites.each do |sprite|
          sprite.x += dx
          sprite.y += dy
        end
      end
    end
    #--------------------------------------------------------------------------
    # * End Animation
    #--------------------------------------------------------------------------
    def end_animation
      super
      @character.animation_id = 0
    end
    #--------------------------------------------------------------------------
    # * Start Balloon Icon Display
    #--------------------------------------------------------------------------
    def start_balloon
      dispose_balloon
      @balloon_duration = 8 * balloon_speed + balloon_wait
      @balloon_sprite = ::Sprite.new(viewport)
      @balloon_sprite.bitmap = Cache.system("Balloon")
      @balloon_sprite.ox = 16
      @balloon_sprite.oy = 32
      update_balloon
    end
    #--------------------------------------------------------------------------
    # * Free Balloon Icon
    #--------------------------------------------------------------------------
    def dispose_balloon
      if @balloon_sprite
        @balloon_sprite.dispose
        @balloon_sprite = nil
      end
    end
    #--------------------------------------------------------------------------
    # * Update Balloon Icon
    #--------------------------------------------------------------------------
    def update_balloon
      if @balloon_duration > 0
        @balloon_duration -= 1
        if @balloon_duration > 0
          @balloon_sprite.x = x
          @balloon_sprite.y = y - height
          @balloon_sprite.z = z + 200
          sx = balloon_frame_index * 32
          sy = (@balloon_id - 1) * 32
          @balloon_sprite.src_rect.set(sx, sy, 32, 32)
        else
          end_balloon
        end
      end
    end
    #--------------------------------------------------------------------------
    # * End Balloon Icon
    #--------------------------------------------------------------------------
    def end_balloon
      dispose_balloon
      @character.balloon_id = 0
    end
    #--------------------------------------------------------------------------
    # * Balloon Icon Display Speed
    #--------------------------------------------------------------------------
    def balloon_speed
      return 8
    end
    #--------------------------------------------------------------------------
    # * Wait Time for Last Frame of Balloon
    #--------------------------------------------------------------------------
    def balloon_wait
      return 12
    end
    #--------------------------------------------------------------------------
    # * Frame Number of Balloon Icon
    #--------------------------------------------------------------------------
    def balloon_frame_index
      return 7 - [(@balloon_duration - balloon_wait) / balloon_speed, 0].max
    end
  end
  #==============================================================================
  # ** Sprite_Battler
  #------------------------------------------------------------------------------
  #  This sprite is used to display battlers. It observes an instance of the
  # Game_Battler class and automatically changes sprite states.
  #==============================================================================

  class Sprite_Battler < Sprite_Base
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :battler
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(viewport, battler = nil)
      super(viewport)
      @battler = battler
      @battler_visible = false
      @effect_type = nil
      @effect_duration = 0
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      bitmap.dispose if bitmap
      super
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      if @battler
        @use_sprite = @battler.use_sprite?
        if @use_sprite
          update_bitmap
          update_origin
          update_position
        end
        setup_new_effect
        setup_new_animation
        update_effect
      else
        self.bitmap = nil
        @effect_type = nil
      end
    end
    #--------------------------------------------------------------------------
    # * Update Transfer Origin Bitmap
    #--------------------------------------------------------------------------
    def update_bitmap
      new_bitmap = Cache.battler(@battler.battler_name, @battler.battler_hue)
      if bitmap != new_bitmap
        self.bitmap = new_bitmap
        init_visibility
      end
    end
    #--------------------------------------------------------------------------
    # * Initialize Visibility
    #--------------------------------------------------------------------------
    def init_visibility
      @battler_visible = @battler.alive?
      self.opacity = 0 unless @battler_visible
    end
    #--------------------------------------------------------------------------
    # * Update Origin
    #--------------------------------------------------------------------------
    def update_origin
      if bitmap
        self.ox = bitmap.width / 2
        self.oy = bitmap.height
      end
    end
    #--------------------------------------------------------------------------
    # * Update Position
    #--------------------------------------------------------------------------
    def update_position
      self.x = @battler.screen_x
      self.y = @battler.screen_y
      self.z = @battler.screen_z
    end
    #--------------------------------------------------------------------------
    # * Set New Effect
    #--------------------------------------------------------------------------
    def setup_new_effect
      if !@battler_visible && @battler.alive?
        start_effect(:appear)
      elsif @battler_visible && @battler.hidden?
        start_effect(:disappear)
      end
      if @battler_visible && @battler.sprite_effect_type
        start_effect(@battler.sprite_effect_type)
        @battler.sprite_effect_type = nil
      end
    end
    #--------------------------------------------------------------------------
    # * Start Effect
    #--------------------------------------------------------------------------
    def start_effect(effect_type)
      @effect_type = effect_type
      case @effect_type
      when :appear
        @effect_duration = 16
        @battler_visible = true
      when :disappear
        @effect_duration = 32
        @battler_visible = false
      when :whiten
        @effect_duration = 16
        @battler_visible = true
      when :blink
        @effect_duration = 20
        @battler_visible = true
      when :collapse
        @effect_duration = 48
        @battler_visible = false
      when :boss_collapse
        @effect_duration = bitmap.height
        @battler_visible = false
      when :instant_collapse
        @effect_duration = 16
        @battler_visible = false
      end
      revert_to_normal
    end
    #--------------------------------------------------------------------------
    # * Revert to Normal Settings
    #--------------------------------------------------------------------------
    def revert_to_normal
      self.blend_type = 0
      self.color.set(0, 0, 0, 0)
      self.opacity = 255
      self.ox = bitmap.width / 2 if bitmap
      self.src_rect.y = 0
    end
    #--------------------------------------------------------------------------
    # * Set New Animation
    #--------------------------------------------------------------------------
    def setup_new_animation
      if @battler.animation_id > 0
        animation = $data_animations[@battler.animation_id]
        mirror = @battler.animation_mirror
        start_animation(animation, mirror)
        @battler.animation_id = 0
      end
    end
    #--------------------------------------------------------------------------
    # * Determine if Effect Is Executing
    #--------------------------------------------------------------------------
    def effect?
      @effect_type != nil
    end
    #--------------------------------------------------------------------------
    # * Update Effect
    #--------------------------------------------------------------------------
    def update_effect
      if @effect_duration > 0
        @effect_duration -= 1
        case @effect_type
        when :whiten
          update_whiten
        when :blink
          update_blink
        when :appear
          update_appear
        when :disappear
          update_disappear
        when :collapse
          update_collapse
        when :boss_collapse
          update_boss_collapse
        when :instant_collapse
          update_instant_collapse
        end
        @effect_type = nil if @effect_duration == 0
      end
    end
    #--------------------------------------------------------------------------
    # * Update White Flash Effect
    #--------------------------------------------------------------------------
    def update_whiten
      self.color.set(255, 255, 255, 0)
      self.color.alpha = 128 - (16 - @effect_duration) * 10
    end
    #--------------------------------------------------------------------------
    # * Update Blink Effect
    #--------------------------------------------------------------------------
    def update_blink
      self.opacity = (@effect_duration % 10 < 5) ? 255 : 0
    end
    #--------------------------------------------------------------------------
    # * Update Appearance Effect
    #--------------------------------------------------------------------------
    def update_appear
      self.opacity = (16 - @effect_duration) * 16
    end
    #--------------------------------------------------------------------------
    # * Updated Disappear Effect
    #--------------------------------------------------------------------------
    def update_disappear
      self.opacity = 256 - (32 - @effect_duration) * 10
    end
    #--------------------------------------------------------------------------
    # * Update Collapse Effect
    #--------------------------------------------------------------------------
    def update_collapse
      self.blend_type = 1
      self.color.set(255, 128, 128, 128)
      self.opacity = 256 - (48 - @effect_duration) * 6
    end
    #--------------------------------------------------------------------------
    # * Update Boss Collapse Effect
    #--------------------------------------------------------------------------
    def update_boss_collapse
      alpha = @effect_duration * 120 / bitmap.height
      self.ox = bitmap.width / 2 + @effect_duration % 2 * 4 - 2
      self.blend_type = 1
      self.color.set(255, 255, 255, 255 - alpha)
      self.opacity = alpha
      self.src_rect.y -= 1
      Sound.play_boss_collapse2 if @effect_duration % 20 == 19
    end
    #--------------------------------------------------------------------------
    # * Update Instant Collapse Effect
    #--------------------------------------------------------------------------
    def update_instant_collapse
      self.opacity = 0
    end
  end
  #==============================================================================
  # ** Sprite_Picture
  #------------------------------------------------------------------------------
  #  This sprite is used to display pictures. It observes an instance of the
  # Game_Picture class and automatically changes sprite states.
  #==============================================================================

  class Sprite_Picture < Sprite
    #--------------------------------------------------------------------------
    # * Object Initialization
    #     picture : Game_Picture
    #--------------------------------------------------------------------------
    def initialize(viewport, picture)
      super(viewport)
      @picture = picture
      update
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      bitmap.dispose if bitmap
      super
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      update_bitmap
      update_origin
      update_position
      update_zoom
      update_other
    end
    #--------------------------------------------------------------------------
    # * Update Transfer Origin Bitmap
    #--------------------------------------------------------------------------
    def update_bitmap
      if @picture.name.empty?
        self.bitmap = nil
      else
        self.bitmap = Cache.picture(@picture.name)
      end
    end
    #--------------------------------------------------------------------------
    # * Update Origin
    #--------------------------------------------------------------------------
    def update_origin
      if @picture.origin == 0
        self.ox = 0
        self.oy = 0
      else
        self.ox = bitmap.width / 2
        self.oy = bitmap.height / 2
      end
    end
    #--------------------------------------------------------------------------
    # * Update Position
    #--------------------------------------------------------------------------
    def update_position
      self.x = @picture.x
      self.y = @picture.y
      self.z = @picture.number
    end
    #--------------------------------------------------------------------------
    # * Update Zoom Factor
    #--------------------------------------------------------------------------
    def update_zoom
      self.zoom_x = @picture.zoom_x / 100.0
      self.zoom_y = @picture.zoom_y / 100.0
    end
    #--------------------------------------------------------------------------
    # * Update Other
    #--------------------------------------------------------------------------
    def update_other
      self.opacity = @picture.opacity
      self.blend_type = @picture.blend_type
      self.angle = @picture.angle
      self.tone.set(@picture.tone)
    end
  end
  #==============================================================================
  # ** Sprite_Timer
  #------------------------------------------------------------------------------
  #  This sprite is for timer displays. It monitors $game_timer and automatically
  # changes sprite states.
  #==============================================================================

  class Sprite_Timer < Sprite
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(viewport)
      super(viewport)
      create_bitmap
      update
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      self.bitmap.dispose
      super
    end
    #--------------------------------------------------------------------------
    # * Create Bitmap
    #--------------------------------------------------------------------------
    def create_bitmap
      self.bitmap = Bitmap.new(96, 48)
      self.bitmap.font.size = 32
      self.bitmap.font.color.set(255, 255, 255)
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      update_bitmap
      update_position
      update_visibility
    end
    #--------------------------------------------------------------------------
    # * Update Transfer Origin Bitmap
    #--------------------------------------------------------------------------
    def update_bitmap
      if $game_timer.sec != @total_sec
        @total_sec = $game_timer.sec
        redraw
      end
    end
    #--------------------------------------------------------------------------
    # * Redraw
    #--------------------------------------------------------------------------
    def redraw
      self.bitmap.clear
      self.bitmap.draw_text(self.bitmap.rect, timer_text, 1)
    end
    #--------------------------------------------------------------------------
    # * Create Text
    #--------------------------------------------------------------------------
    def timer_text
      sprintf("%02d:%02d", @total_sec / 60, @total_sec % 60)
    end
    #--------------------------------------------------------------------------
    # * Update Position
    #--------------------------------------------------------------------------
    def update_position
      self.x = Graphics.width - self.bitmap.width
      self.y = 0
      self.z = 200
    end
    #--------------------------------------------------------------------------
    # * Update Visibility
    #--------------------------------------------------------------------------
    def update_visibility
      self.visible = $game_timer.working?
    end
  end
  #==============================================================================
  # ** Spriteset_Weather
  #------------------------------------------------------------------------------
  #  A class for weather effects (rain, storm, and snow). It is used within the
  # Spriteset_Map class.
  #==============================================================================

  class Spriteset_Weather
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :type                     # Weather type
    attr_accessor :ox                       # X coordinate of origin
    attr_accessor :oy                       # Y coordinate of orgin
    attr_reader   :power                    # Intensity
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(viewport = nil)
      @viewport = viewport
      init_members
      create_rain_bitmap
      create_storm_bitmap
      create_snow_bitmap
    end
    #--------------------------------------------------------------------------
    # * Initialize Member Variables
    #--------------------------------------------------------------------------
    def init_members
      @type = :none
      @ox = 0
      @oy = 0
      @power = 0
      @sprites = []
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      @sprites.each {|sprite| sprite.dispose }
      @rain_bitmap.dispose
      @storm_bitmap.dispose
      @snow_bitmap.dispose
    end
    #--------------------------------------------------------------------------
    # * Particle Color 1
    #--------------------------------------------------------------------------
    def particle_color1
      Color.new(255, 255, 255, 192)
    end
    #--------------------------------------------------------------------------
    # * Particle Color 2
    #--------------------------------------------------------------------------
    def particle_color2
      Color.new(255, 255, 255, 96)
    end
    #--------------------------------------------------------------------------
    # * Create [Rain] Weather Bitmap
    #--------------------------------------------------------------------------
    def create_rain_bitmap
      @rain_bitmap = Bitmap.new(7, 42)
      7.times {|i| @rain_bitmap.fill_rect(6-i, i*6, 1, 6, particle_color1) }
    end
    #--------------------------------------------------------------------------
    # * Create [Storm] Weather Bitmap
    #--------------------------------------------------------------------------
    def create_storm_bitmap
      @storm_bitmap = Bitmap.new(34, 64)
      32.times do |i|
        @storm_bitmap.fill_rect(33-i, i*2, 1, 2, particle_color2)
        @storm_bitmap.fill_rect(32-i, i*2, 1, 2, particle_color1)
        @storm_bitmap.fill_rect(31-i, i*2, 1, 2, particle_color2)
      end
    end
    #--------------------------------------------------------------------------
    # * Create [Snow] Weather Bitmap
    #--------------------------------------------------------------------------
    def create_snow_bitmap
      @snow_bitmap = Bitmap.new(6, 6)
      @snow_bitmap.fill_rect(0, 1, 6, 4, particle_color2)
      @snow_bitmap.fill_rect(1, 0, 4, 6, particle_color2)
      @snow_bitmap.fill_rect(1, 2, 4, 2, particle_color1)
      @snow_bitmap.fill_rect(2, 1, 2, 4, particle_color1)
    end
    #--------------------------------------------------------------------------
    # * Set Weather Intensity
    #--------------------------------------------------------------------------
    def power=(power)
      @power = power
      (sprite_max - @sprites.size).times { add_sprite }
      (@sprites.size - sprite_max).times { remove_sprite }
    end
    #--------------------------------------------------------------------------
    # * Get Maximum Number of Sprites
    #--------------------------------------------------------------------------
    def sprite_max
      (@power * 10).to_i
    end
    #--------------------------------------------------------------------------
    # * Add Sprite
    #--------------------------------------------------------------------------
    def add_sprite
      sprite = Sprite.new(@viewport)
      sprite.opacity = 0
      @sprites.push(sprite)
    end
    #--------------------------------------------------------------------------
    # * Delete Sprite
    #--------------------------------------------------------------------------
    def remove_sprite
      sprite = @sprites.pop
      sprite.dispose if sprite
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      update_screen
      @sprites.each {|sprite| update_sprite(sprite) }
    end
    #--------------------------------------------------------------------------
    # * Update Screen
    #--------------------------------------------------------------------------
    def update_screen
      @viewport.tone.set(-dimness, -dimness, -dimness)
    end
    #--------------------------------------------------------------------------
    # * Get Dimness
    #--------------------------------------------------------------------------
    def dimness
      (@power * 6).to_i
    end
    #--------------------------------------------------------------------------
    # * Update Sprite
    #--------------------------------------------------------------------------
    def update_sprite(sprite)
      sprite.ox = @ox
      sprite.oy = @oy
      case @type
      when :rain
        update_sprite_rain(sprite)
      when :storm
        update_sprite_storm(sprite)
      when :snow
        update_sprite_snow(sprite)
      end
      create_new_particle(sprite) if sprite.opacity < 64
    end
    #--------------------------------------------------------------------------
    # * Update Sprite [Rain]
    #--------------------------------------------------------------------------
    def update_sprite_rain(sprite)
      sprite.bitmap = @rain_bitmap
      sprite.x -= 1
      sprite.y += 6
      sprite.opacity -= 12
    end
    #--------------------------------------------------------------------------
    # * Update Sprite [Storm]
    #--------------------------------------------------------------------------
    def update_sprite_storm(sprite)
      sprite.bitmap = @storm_bitmap
      sprite.x -= 3
      sprite.y += 6
      sprite.opacity -= 12
    end
    #--------------------------------------------------------------------------
    # * Update Sprite [Snow]
    #--------------------------------------------------------------------------
    def update_sprite_snow(sprite)
      sprite.bitmap = @snow_bitmap
      sprite.x -= 1
      sprite.y += 3
      sprite.opacity -= 12
    end
    #--------------------------------------------------------------------------
    # * Create New Particle
    #--------------------------------------------------------------------------
    def create_new_particle(sprite)
      sprite.x = rand(Graphics.width + 100) - 100 + @ox
      sprite.y = rand(Graphics.height + 200) - 200 + @oy
      sprite.opacity = 160 + rand(96)
    end
  end
  #==============================================================================
  # ** Spriteset_Map
  #------------------------------------------------------------------------------
  #  This class brings together map screen sprites, tilemaps, etc. It's used
  # within the Scene_Map class.
  #==============================================================================

  class Spriteset_Map
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      create_viewports
      create_tilemap
      create_parallax
      create_characters
      create_shadow
      create_weather
      create_pictures
      create_timer
      update
    end
    #--------------------------------------------------------------------------
    # * Create Viewport
    #--------------------------------------------------------------------------
    def create_viewports
      @viewport1 = Viewport.new
      @viewport2 = Viewport.new
      @viewport3 = Viewport.new
      @viewport2.z = 50
      @viewport3.z = 100
    end
    #--------------------------------------------------------------------------
    # * Create Tilemap
    #--------------------------------------------------------------------------
    def create_tilemap
      @tilemap = Tilemap.new(@viewport1)
      @tilemap.map_data = $game_map.data
      load_tileset
    end
    #--------------------------------------------------------------------------
    # * Load Tileset
    #--------------------------------------------------------------------------
    def load_tileset
      @tileset = $game_map.tileset
      @tileset.tileset_names.each_with_index do |name, i|
        @tilemap.bitmaps[i] = Cache.tileset(name)
      end
      @tilemap.flags = @tileset.flags
    end
    #--------------------------------------------------------------------------
    # * Create Parallax
    #--------------------------------------------------------------------------
    def create_parallax
      @parallax = Plane.new(@viewport1)
      @parallax.z = -100
    end
    #--------------------------------------------------------------------------
    # * Create Character Sprite
    #--------------------------------------------------------------------------
    def create_characters
      @character_sprites = []
      $game_map.events.values.each do |event|
        @character_sprites.push(Sprite_Character.new(@viewport1, event))
      end
      $game_map.vehicles.each do |vehicle|
        @character_sprites.push(Sprite_Character.new(@viewport1, vehicle))
      end
      $game_player.followers.reverse_each do |follower|
        @character_sprites.push(Sprite_Character.new(@viewport1, follower))
      end
      @character_sprites.push(Sprite_Character.new(@viewport1, $game_player))
      @map_id = $game_map.map_id
    end
    #--------------------------------------------------------------------------
    # * Create Airship Shadow Sprite
    #--------------------------------------------------------------------------
    def create_shadow
      @shadow_sprite = Sprite.new(@viewport1)
      @shadow_sprite.bitmap = Cache.system("Shadow")
      @shadow_sprite.ox = @shadow_sprite.bitmap.width / 2
      @shadow_sprite.oy = @shadow_sprite.bitmap.height
      @shadow_sprite.z = 180
    end
    #--------------------------------------------------------------------------
    # * Create Weather
    #--------------------------------------------------------------------------
    def create_weather
      @weather = Spriteset_Weather.new(@viewport2)
    end
    #--------------------------------------------------------------------------
    # * Create Picture Sprite
    #--------------------------------------------------------------------------
    def create_pictures
      @picture_sprites = []
    end
    #--------------------------------------------------------------------------
    # * Create Timer Sprite
    #--------------------------------------------------------------------------
    def create_timer
      @timer_sprite = Sprite_Timer.new(@viewport2)
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      dispose_tilemap
      dispose_parallax
      dispose_characters
      dispose_shadow
      dispose_weather
      dispose_pictures
      dispose_timer
      dispose_viewports
    end
    #--------------------------------------------------------------------------
    # * Free Tilemap
    #--------------------------------------------------------------------------
    def dispose_tilemap
      @tilemap.dispose
    end
    #--------------------------------------------------------------------------
    # * Free Parallax
    #--------------------------------------------------------------------------
    def dispose_parallax
      @parallax.bitmap.dispose if @parallax.bitmap
      @parallax.dispose
    end
    #--------------------------------------------------------------------------
    # * Free Character Sprite
    #--------------------------------------------------------------------------
    def dispose_characters
      @character_sprites.each {|sprite| sprite.dispose }
    end
    #--------------------------------------------------------------------------
    # * Free Airship Shadow Sprite
    #--------------------------------------------------------------------------
    def dispose_shadow
      @shadow_sprite.dispose
    end
    #--------------------------------------------------------------------------
    # * Free Weather
    #--------------------------------------------------------------------------
    def dispose_weather
      @weather.dispose
    end
    #--------------------------------------------------------------------------
    # * Free Picture Sprite
    #--------------------------------------------------------------------------
    def dispose_pictures
      @picture_sprites.compact.each {|sprite| sprite.dispose }
    end
    #--------------------------------------------------------------------------
    # * Free Timer Sprite
    #--------------------------------------------------------------------------
    def dispose_timer
      @timer_sprite.dispose
    end
    #--------------------------------------------------------------------------
    # * Free Viewport
    #--------------------------------------------------------------------------
    def dispose_viewports
      @viewport1.dispose
      @viewport2.dispose
      @viewport3.dispose
    end
    #--------------------------------------------------------------------------
    # * Refresh Characters
    #--------------------------------------------------------------------------
    def refresh_characters
      dispose_characters
      create_characters
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      update_tileset
      update_tilemap
      update_parallax
      update_characters
      update_shadow
      update_weather
      update_pictures
      update_timer
      update_viewports
    end
    #--------------------------------------------------------------------------
    # * Update Tileset
    #--------------------------------------------------------------------------
    def update_tileset
      if @tileset != $game_map.tileset
        load_tileset
        refresh_characters
      end
    end
    #--------------------------------------------------------------------------
    # * Update Tilemap
    #--------------------------------------------------------------------------
    def update_tilemap
      @tilemap.map_data = $game_map.data
      @tilemap.ox = $game_map.display_x * 32
      @tilemap.oy = $game_map.display_y * 32
      @tilemap.update
    end
    #--------------------------------------------------------------------------
    # * Update Parallax
    #--------------------------------------------------------------------------
    def update_parallax
      if @parallax_name != $game_map.parallax_name
        @parallax_name = $game_map.parallax_name
        @parallax.bitmap.dispose if @parallax.bitmap
        @parallax.bitmap = Cache.parallax(@parallax_name)
        Graphics.frame_reset
      end
      @parallax.ox = $game_map.parallax_ox(@parallax.bitmap)
      @parallax.oy = $game_map.parallax_oy(@parallax.bitmap)
    end
    #--------------------------------------------------------------------------
    # * Update Character Sprite
    #--------------------------------------------------------------------------
    def update_characters
      refresh_characters if @map_id != $game_map.map_id
      @character_sprites.each {|sprite| sprite.update }
    end
    #--------------------------------------------------------------------------
    # * Update Airship Shadow Sprite
    #--------------------------------------------------------------------------
    def update_shadow
      airship = $game_map.airship
      @shadow_sprite.x = airship.screen_x
      @shadow_sprite.y = airship.screen_y + airship.altitude
      @shadow_sprite.opacity = airship.altitude * 8
      @shadow_sprite.update
    end
    #--------------------------------------------------------------------------
    # * Update Weather
    #--------------------------------------------------------------------------
    def update_weather
      @weather.type = $game_map.screen.weather_type
      @weather.power = $game_map.screen.weather_power
      @weather.ox = $game_map.display_x * 32
      @weather.oy = $game_map.display_y * 32
      @weather.update
    end
    #--------------------------------------------------------------------------
    # *Update Picture Sprite
    #--------------------------------------------------------------------------
    def update_pictures
      $game_map.screen.pictures.each do |pic|
        @picture_sprites[pic.number] ||= Sprite_Picture.new(@viewport2, pic)
        @picture_sprites[pic.number].update
      end
    end
    #--------------------------------------------------------------------------
    # * Update Timer Sprite
    #--------------------------------------------------------------------------
    def update_timer
      @timer_sprite.update
    end
    #--------------------------------------------------------------------------
    # * Update Viewport
    #--------------------------------------------------------------------------
    def update_viewports
      @viewport1.tone.set($game_map.screen.tone)
      @viewport1.ox = $game_map.screen.shake
      @viewport2.color.set($game_map.screen.flash_color)
      @viewport3.color.set(0, 0, 0, 255 - $game_map.screen.brightness)
      @viewport1.update
      @viewport2.update
      @viewport3.update
    end
  end
  #==============================================================================
  # ** Spriteset_Battle
  #------------------------------------------------------------------------------
  #  This class brings together battle screen sprites. It's used within the
  # Scene_Battle class.
  #==============================================================================

  class Spriteset_Battle
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      create_viewports
      create_battleback1
      create_battleback2
      create_enemies
      create_actors
      create_pictures
      create_timer
      update
    end
    #--------------------------------------------------------------------------
    # * Create Viewport
    #--------------------------------------------------------------------------
    def create_viewports
      @viewport1 = Viewport.new
      @viewport2 = Viewport.new
      @viewport3 = Viewport.new
      @viewport2.z = 50
      @viewport3.z = 100
    end
    #--------------------------------------------------------------------------
    # * Create Battle Background (Floor) Sprite
    #--------------------------------------------------------------------------
    def create_battleback1
      @back1_sprite = Sprite.new(@viewport1)
      @back1_sprite.bitmap = battleback1_bitmap
      @back1_sprite.z = 0
      center_sprite(@back1_sprite)
    end
    #--------------------------------------------------------------------------
    # * Create Battle Background (Wall) Sprite
    #--------------------------------------------------------------------------
    def create_battleback2
      @back2_sprite = Sprite.new(@viewport1)
      @back2_sprite.bitmap = battleback2_bitmap
      @back2_sprite.z = 1
      center_sprite(@back2_sprite)
    end
    #--------------------------------------------------------------------------
    # * Get Battle Background (Floor) Bitmap
    #--------------------------------------------------------------------------
    def battleback1_bitmap
      if battleback1_name
        Cache.battleback1(battleback1_name)
      else
        create_blurry_background_bitmap
      end
    end
    #--------------------------------------------------------------------------
    # * Get Battle Background (Wall) Bitmap
    #--------------------------------------------------------------------------
    def battleback2_bitmap
      if battleback2_name
        Cache.battleback2(battleback2_name)
      else
        Bitmap.new(1, 1)
      end
    end
    #--------------------------------------------------------------------------
    # * Create Battle Background Bitmap from Processed Map Screen
    #--------------------------------------------------------------------------
    def create_blurry_background_bitmap
      source = SceneManager.background_bitmap
      bitmap = Bitmap.new(640, 480)
      bitmap.stretch_blt(bitmap.rect, source, source.rect)
      bitmap.radial_blur(120, 16)
      bitmap
    end
    #--------------------------------------------------------------------------
    # * Get Filename of Battle Background (Floor)
    #--------------------------------------------------------------------------
    def battleback1_name
      if $BTEST
        $data_system.battleback1_name
      elsif $game_map.battleback1_name
        $game_map.battleback1_name
      elsif $game_map.overworld?
        overworld_battleback1_name
      end
    end
    #--------------------------------------------------------------------------
    # * Get Filename of Battle Background (Wall)
    #--------------------------------------------------------------------------
    def battleback2_name
      if $BTEST
        $data_system.battleback2_name
      elsif $game_map.battleback2_name
        $game_map.battleback2_name
      elsif $game_map.overworld?
        overworld_battleback2_name
      end
    end
    #--------------------------------------------------------------------------
    # * Get Filename of Field Battle Background (Floor)
    #--------------------------------------------------------------------------
    def overworld_battleback1_name
      $game_player.vehicle ? ship_battleback1_name : normal_battleback1_name
    end
    #--------------------------------------------------------------------------
    # * Get Filename of Field Battle Background (Wall)
    #--------------------------------------------------------------------------
    def overworld_battleback2_name
      $game_player.vehicle ? ship_battleback2_name : normal_battleback2_name
    end
    #--------------------------------------------------------------------------
    # * Get Filename of Normal Battle Background (Floor)
    #--------------------------------------------------------------------------
    def normal_battleback1_name
      terrain_battleback1_name(autotile_type(1)) ||
        terrain_battleback1_name(autotile_type(0)) ||
        default_battleback1_name
    end
    #--------------------------------------------------------------------------
    # * Get Filename of Normal Battle Background (Wall)
    #--------------------------------------------------------------------------
    def normal_battleback2_name
      terrain_battleback2_name(autotile_type(1)) ||
        terrain_battleback2_name(autotile_type(0)) ||
        default_battleback2_name
    end
    #--------------------------------------------------------------------------
    # * Get Filename of Battle Background (Floor) Corresponding to Terrain
    #--------------------------------------------------------------------------
    def terrain_battleback1_name(type)
      case type
      when 24,25        # Wasteland
        "Wasteland"
      when 26,27        # Dirt field
        "DirtField"
      when 32,33        # Desert
        "Desert"
      when 34           # Rocks
        "Lava1"
      when 35           # Rocks (lava)
        "Lava2"
      when 40,41        # Snowfield
        "Snowfield"
      when 42           # Clouds
        "Clouds"
      when 4,5          # Poisonous swamp
        "PoisonSwamp"
      end
    end
    #--------------------------------------------------------------------------
    # * Get Filename of Battle Background (Wall) Corresponding to Terrain
    #--------------------------------------------------------------------------
    def terrain_battleback2_name(type)
      case type
      when 20,21        # Forest
        "Forest1"
      when 22,30,38     # Low hill
        "Cliff"
      when 24,25,26,27  # Wasteland, dirt field
        "Wasteland"
      when 32,33        # Desert
        "Desert"
      when 34,35        #  Rocks
        "Lava"
      when 40,41        # Snowfield
        "Snowfield"
      when 42           # Clouds
        "Clouds"
      when 4,5          # Poisonous swamp
        "PoisonSwamp"
      end
    end
    #--------------------------------------------------------------------------
    # * Get Filename of Default Battle Background (Floor)
    #--------------------------------------------------------------------------
    def default_battleback1_name
      "Grassland"
    end
    #--------------------------------------------------------------------------
    # * Get Filename of Default Battle Background (Wall)
    #--------------------------------------------------------------------------
    def default_battleback2_name
      "Grassland"
    end
    #--------------------------------------------------------------------------
    # * Get Filename of Battle Background (Floor) When on Ship
    #--------------------------------------------------------------------------
    def ship_battleback1_name
      "Ship"
    end
    #--------------------------------------------------------------------------
    # * Get Filename of Battle Background (Wall) When on Ship
    #--------------------------------------------------------------------------
    def ship_battleback2_name
      "Ship"
    end
    #--------------------------------------------------------------------------
    # * Get Type of Auto Tile at Player's Feet
    #--------------------------------------------------------------------------
    def autotile_type(z)
      $game_map.autotile_type($game_player.x, $game_player.y, z)
    end
    #--------------------------------------------------------------------------
    # * Move Sprite to Screen Center
    #--------------------------------------------------------------------------
    def center_sprite(sprite)
      sprite.ox = sprite.bitmap.width / 2
      sprite.oy = sprite.bitmap.height / 2
      sprite.x = Graphics.width / 2
      sprite.y = Graphics.height / 2
    end
    #--------------------------------------------------------------------------
    # * Create Enemy Sprite
    #--------------------------------------------------------------------------
    def create_enemies
      @enemy_sprites = $game_troop.members.reverse.collect do |enemy|
        Sprite_Battler.new(@viewport1, enemy)
      end
    end
    #--------------------------------------------------------------------------
    # * Create Actor Sprite
    #    By default, the actor image is not displayed, but for convenience
    #    a dummy sprite is created for treating enemies and allies the same.
    #--------------------------------------------------------------------------
    def create_actors
      @actor_sprites = Array.new(4) { Sprite_Battler.new(@viewport1) }
    end
    #--------------------------------------------------------------------------
    # * Create Picture Sprite
    #    Create an empty array in the initial state and then add to it as
    #    necessary.
    #--------------------------------------------------------------------------
    def create_pictures
      @picture_sprites = []
    end
    #--------------------------------------------------------------------------
    # * Create Timer Sprite
    #--------------------------------------------------------------------------
    def create_timer
      @timer_sprite = Sprite_Timer.new(@viewport2)
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      dispose_battleback1
      dispose_battleback2
      dispose_enemies
      dispose_actors
      dispose_pictures
      dispose_timer
      dispose_viewports
    end
    #--------------------------------------------------------------------------
    # * Free Battle Background (Floor) Sprite
    #--------------------------------------------------------------------------
    def dispose_battleback1
      @back1_sprite.bitmap.dispose
      @back1_sprite.dispose
    end
    #--------------------------------------------------------------------------
    # * Free Battle Background (Wall) Sprite
    #--------------------------------------------------------------------------
    def dispose_battleback2
      @back2_sprite.bitmap.dispose
      @back2_sprite.dispose
    end
    #--------------------------------------------------------------------------
    # * Free Enemy Sprite
    #--------------------------------------------------------------------------
    def dispose_enemies
      @enemy_sprites.each {|sprite| sprite.dispose }
    end
    #--------------------------------------------------------------------------
    # * Free Actor Sprite
    #--------------------------------------------------------------------------
    def dispose_actors
      @actor_sprites.each {|sprite| sprite.dispose }
    end
    #--------------------------------------------------------------------------
    # * Free Picture Sprite
    #--------------------------------------------------------------------------
    def dispose_pictures
      @picture_sprites.compact.each {|sprite| sprite.dispose }
    end
    #--------------------------------------------------------------------------
    # * Free Timer Sprite
    #--------------------------------------------------------------------------
    def dispose_timer
      @timer_sprite.dispose
    end
    #--------------------------------------------------------------------------
    # * Free Viewport
    #--------------------------------------------------------------------------
    def dispose_viewports
      @viewport1.dispose
      @viewport2.dispose
      @viewport3.dispose
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      update_battleback1
      update_battleback2
      update_enemies
      update_actors
      update_pictures
      update_timer
      update_viewports
    end
    #--------------------------------------------------------------------------
    # * Update Battle Background (Floor) Sprite
    #--------------------------------------------------------------------------
    def update_battleback1
      @back1_sprite.update
    end
    #--------------------------------------------------------------------------
    # * Update Battle Background (Wall) Sprite
    #--------------------------------------------------------------------------
    def update_battleback2
      @back2_sprite.update
    end
    #--------------------------------------------------------------------------
    # * Update Enemy Sprite
    #--------------------------------------------------------------------------
    def update_enemies
      @enemy_sprites.each {|sprite| sprite.update }
    end
    #--------------------------------------------------------------------------
    # * Update Actor Sprite
    #--------------------------------------------------------------------------
    def update_actors
      @actor_sprites.each_with_index do |sprite, i|
        sprite.battler = $game_party.members[i]
        sprite.update
      end
    end
    #--------------------------------------------------------------------------
    # *Update Picture Sprite
    #--------------------------------------------------------------------------
    def update_pictures
      $game_troop.screen.pictures.each do |pic|
        @picture_sprites[pic.number] ||= Sprite_Picture.new(@viewport2, pic)
        @picture_sprites[pic.number].update
      end
    end
    #--------------------------------------------------------------------------
    # * Update Timer Sprite
    #--------------------------------------------------------------------------
    def update_timer
      @timer_sprite.update
    end
    #--------------------------------------------------------------------------
    # * Update Viewport
    #--------------------------------------------------------------------------
    def update_viewports
      @viewport1.tone.set($game_troop.screen.tone)
      @viewport1.ox = $game_troop.screen.shake
      @viewport2.color.set($game_troop.screen.flash_color)
      @viewport3.color.set(0, 0, 0, 255 - $game_troop.screen.brightness)
      @viewport1.update
      @viewport2.update
      @viewport3.update
    end
    #--------------------------------------------------------------------------
    # * Get Enemy and Actor Sprites
    #--------------------------------------------------------------------------
    def battler_sprites
      @enemy_sprites + @actor_sprites
    end
    #--------------------------------------------------------------------------
    # * Determine if Animation is Being Displayed
    #--------------------------------------------------------------------------
    def animation?
      battler_sprites.any? {|sprite| sprite.animation? }
    end
    #--------------------------------------------------------------------------
    # * Determine if Effect Is Executing
    #--------------------------------------------------------------------------
    def effect?
      battler_sprites.any? {|sprite| sprite.effect? }
    end
  end
  #==============================================================================
  # ** Window_Base
  #------------------------------------------------------------------------------
  #  This is a super class of all windows within the game.
  #==============================================================================

  class Window_Base < Window
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y, width, height)
      super
      self.windowskin = Cache.system("Window")
      update_padding
      update_tone
      create_contents
      @opening = @closing = false
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      contents.dispose unless disposed?
      super
    end
    #--------------------------------------------------------------------------
    # * Get Line Height
    #--------------------------------------------------------------------------
    def line_height
      return 24
    end
    #--------------------------------------------------------------------------
    # * Get Standard Padding Size
    #--------------------------------------------------------------------------
    def standard_padding
      return 12
    end
    #--------------------------------------------------------------------------
    # * Update Padding
    #--------------------------------------------------------------------------
    def update_padding
      self.padding = standard_padding
    end
    #--------------------------------------------------------------------------
    # * Calculate Width of Window Contents
    #--------------------------------------------------------------------------
    def contents_width
      width - standard_padding * 2
    end
    #--------------------------------------------------------------------------
    # * Calculate Height of Window Contents
    #--------------------------------------------------------------------------
    def contents_height
      height - standard_padding * 2
    end
    #--------------------------------------------------------------------------
    # * Calculate Height of Window Suited to Specified Number of Lines
    #--------------------------------------------------------------------------
    def fitting_height(line_number)
      line_number * line_height + standard_padding * 2
    end
    #--------------------------------------------------------------------------
    # * Update Tone
    #--------------------------------------------------------------------------
    def update_tone
      self.tone.set($game_system.window_tone)
    end
    #--------------------------------------------------------------------------
    # * Create Window Contents
    #--------------------------------------------------------------------------
    def create_contents
      contents.dispose
      if contents_width > 0 && contents_height > 0
        self.contents = Bitmap.new(contents_width, contents_height)
      else
        self.contents = Bitmap.new(1, 1)
      end
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      update_tone
      update_open if @opening
      update_close if @closing
    end
    #--------------------------------------------------------------------------
    # * Update Open Processing
    #--------------------------------------------------------------------------
    def update_open
      self.openness += 48
      @opening = false if open?
    end
    #--------------------------------------------------------------------------
    # * Update Close Processing
    #--------------------------------------------------------------------------
    def update_close
      self.openness -= 48
      @closing = false if close?
    end
    #--------------------------------------------------------------------------
    # * Open Window
    #--------------------------------------------------------------------------
    def open
      @opening = true unless open?
      @closing = false
      self
    end
    #--------------------------------------------------------------------------
    # * Close Window
    #--------------------------------------------------------------------------
    def close
      @closing = true unless close?
      @opening = false
      self
    end
    #--------------------------------------------------------------------------
    # * Show Window
    #--------------------------------------------------------------------------
    def show
      self.visible = true
      self
    end
    #--------------------------------------------------------------------------
    # * Hide Window
    #--------------------------------------------------------------------------
    def hide
      self.visible = false
      self
    end
    #--------------------------------------------------------------------------
    # * Activate Window
    #--------------------------------------------------------------------------
    def activate
      self.active = true
      self
    end
    #--------------------------------------------------------------------------
    # * Deactivate Window
    #--------------------------------------------------------------------------
    def deactivate
      self.active = false
      self
    end
    #--------------------------------------------------------------------------
    # * Get Text Color
    #     n : Text color number (0..31)
    #--------------------------------------------------------------------------
    def text_color(n)
      windowskin.get_pixel(64 + (n % 8) * 8, 96 + (n / 8) * 8)
    end
    #--------------------------------------------------------------------------
    # * Get Text Colors
    #--------------------------------------------------------------------------
    def normal_color;      text_color(0);   end;    # Normal
    def system_color;      text_color(16);  end;    # System
    def crisis_color;      text_color(17);  end;    # Crisis
    def knockout_color;    text_color(18);  end;    # Knock out
    def gauge_back_color;  text_color(19);  end;    # Gauge background
    def hp_gauge_color1;   text_color(20);  end;    # HP gauge 1
    def hp_gauge_color2;   text_color(21);  end;    # HP gauge 2
    def mp_gauge_color1;   text_color(22);  end;    # MP gauge 1
    def mp_gauge_color2;   text_color(23);  end;    # MP gauge 2
    def mp_cost_color;     text_color(23);  end;    # TP cost
    def power_up_color;    text_color(24);  end;    # Equipment power up
    def power_down_color;  text_color(25);  end;    # Equipment power down
    def tp_gauge_color1;   text_color(28);  end;    # TP gauge 1
    def tp_gauge_color2;   text_color(29);  end;    # TP gauge 2
    def tp_cost_color;     text_color(29);  end;    # TP cost
    #--------------------------------------------------------------------------
    # * Get Background Color of Pending Item
    #--------------------------------------------------------------------------
    def pending_color
      windowskin.get_pixel(80, 80)
    end
    #--------------------------------------------------------------------------
    # * Get Alpha Value of Translucent Drawing
    #--------------------------------------------------------------------------
    def translucent_alpha
      return 160
    end
    #--------------------------------------------------------------------------
    # * Change Text Drawing Color
    #     enabled : Enabled flag. When false, draw semi-transparently.
    #--------------------------------------------------------------------------
    def change_color(color, enabled = true)
      contents.font.color.set(color)
      contents.font.color.alpha = translucent_alpha unless enabled
    end
    #--------------------------------------------------------------------------
    # * Draw Text
    #     args : Same as Bitmap#draw_text.
    #--------------------------------------------------------------------------
    def draw_text(*args)
      contents.draw_text(*args)
    end
    #--------------------------------------------------------------------------
    # * Get Text Size
    #--------------------------------------------------------------------------
    def text_size(str)
      contents.text_size(str)
    end
    #--------------------------------------------------------------------------
    # * Draw Text with Control Characters
    #--------------------------------------------------------------------------
    def draw_text_ex(x, y, text)
      reset_font_settings
      text = convert_escape_characters(text)
      pos = {:x => x, :y => y, :new_x => x, :height => calc_line_height(text)}
      process_character(text.slice!(0, 1), text, pos) until text.empty?
    end
    #--------------------------------------------------------------------------
    # * Reset Font Settings
    #--------------------------------------------------------------------------
    def reset_font_settings
      change_color(normal_color)
      contents.font.size = Font.default_size
      contents.font.bold = Font.default_bold
      contents.font.italic = Font.default_italic
    end
    #--------------------------------------------------------------------------
    # * Preconvert Control Characters
    #    As a rule, replace only what will be changed into text strings before
    #    starting actual drawing. The character "\" is replaced with the escape
    #    character (\e).
    #--------------------------------------------------------------------------
    def convert_escape_characters(text)
      result = text.to_s.clone
      result.gsub!(/\\/)            { "\e" }
      result.gsub!(/\e\e/)          { "\\" }
      result.gsub!(/\eV\[(\d+)\]/i) { $game_variables[$1.to_i] }
      result.gsub!(/\eV\[(\d+)\]/i) { $game_variables[$1.to_i] }
      result.gsub!(/\eN\[(\d+)\]/i) { actor_name($1.to_i) }
      result.gsub!(/\eP\[(\d+)\]/i) { party_member_name($1.to_i) }
      result.gsub!(/\eG/i)          { Vocab::currency_unit }
      result
    end
    #--------------------------------------------------------------------------
    # * Get Name of Actor Number n
    #--------------------------------------------------------------------------
    def actor_name(n)
      actor = n >= 1 ? $game_actors[n] : nil
      actor ? actor.name : ""
    end
    #--------------------------------------------------------------------------
    # * Get Name of Party Member n
    #--------------------------------------------------------------------------
    def party_member_name(n)
      actor = n >= 1 ? $game_party.members[n - 1] : nil
      actor ? actor.name : ""
    end
    #--------------------------------------------------------------------------
    # * Character Processing
    #     c    : Characters
    #     text : A character string buffer in drawing processing (destructive)
    #     pos  : Draw position {:x, :y, :new_x, :height}
    #--------------------------------------------------------------------------
    def process_character(c, text, pos)
      case c
      when "\n"   # New line
        process_new_line(text, pos)
      when "\f"   # New page
        process_new_page(text, pos)
      when "\e"   # Control character
        process_escape_character(obtain_escape_code(text), text, pos)
      else        # Normal character
        process_normal_character(c, pos)
      end
    end
    #--------------------------------------------------------------------------
    # * Normal Character Processing
    #--------------------------------------------------------------------------
    def process_normal_character(c, pos)
      text_width = text_size(c).width
      draw_text(pos[:x], pos[:y], text_width * 2, pos[:height], c)
      pos[:x] += text_width
    end
    #--------------------------------------------------------------------------
    # * New Line Character Processing
    #--------------------------------------------------------------------------
    def process_new_line(text, pos)
      pos[:x] = pos[:new_x]
      pos[:y] += pos[:height]
      pos[:height] = calc_line_height(text)
    end
    #--------------------------------------------------------------------------
    # * New Page Character Processing
    #--------------------------------------------------------------------------
    def process_new_page(text, pos)
    end
    #--------------------------------------------------------------------------
    # * Destructively Get Control Code
    #--------------------------------------------------------------------------
    def obtain_escape_code(text)
      text.slice!(/^[\$\.\|\^!><\{\}\\]|^[A-Z]+/i)
    end
    #--------------------------------------------------------------------------
    # * Destructively Get Control Code Argument
    #--------------------------------------------------------------------------
    def obtain_escape_param(text)
      text.slice!(/^\[\d+\]/)[/\d+/].to_i rescue 0
    end
    #--------------------------------------------------------------------------
    # * Control Character Processing
    #     code : the core of the control character
    #            e.g. "C" in the case of the control character \C[1].
    #--------------------------------------------------------------------------
    def process_escape_character(code, text, pos)
      case code.upcase
      when 'C'
        change_color(text_color(obtain_escape_param(text)))
      when 'I'
        process_draw_icon(obtain_escape_param(text), pos)
      when '{'
        make_font_bigger
      when '}'
        make_font_smaller
      end
    end
    #--------------------------------------------------------------------------
    # * Icon Drawing Process by Control Characters
    #--------------------------------------------------------------------------
    def process_draw_icon(icon_index, pos)
      draw_icon(icon_index, pos[:x], pos[:y])
      pos[:x] += 24
    end
    #--------------------------------------------------------------------------
    # * Increase Font Size
    #--------------------------------------------------------------------------
    def make_font_bigger
      contents.font.size += 8 if contents.font.size <= 64
    end
    #--------------------------------------------------------------------------
    # * Decrease Font Size
    #--------------------------------------------------------------------------
    def make_font_smaller
      contents.font.size -= 8 if contents.font.size >= 16
    end
    #--------------------------------------------------------------------------
    # * Calculate Line Height
    #     restore_font_size : Return to original font size after calculating
    #--------------------------------------------------------------------------
    def calc_line_height(text, restore_font_size = true)
      result = [line_height, contents.font.size].max
      last_font_size = contents.font.size
      text.slice(/^.*$/).scan(/\e[\{\}]/).each do |esc|
        make_font_bigger  if esc == "\e{"
        make_font_smaller if esc == "\e}"
        result = [result, contents.font.size].max
      end
      contents.font.size = last_font_size if restore_font_size
      result
    end
    #--------------------------------------------------------------------------
    # * Draw Gauge
    #     rate   : Rate (full at 1.0)
    #     color1 : Left side gradation
    #     color2 : Right side gradation
    #--------------------------------------------------------------------------
    def draw_gauge(x, y, width, rate, color1, color2)
      fill_w = (width * rate).to_i
      gauge_y = y + line_height - 8
      contents.fill_rect(x, gauge_y, width, 6, gauge_back_color)
      contents.gradient_fill_rect(x, gauge_y, fill_w, 6, color1, color2)
    end
    #--------------------------------------------------------------------------
    # * Draw Icon
    #     enabled : Enabled flag. When false, draw semi-transparently.
    #--------------------------------------------------------------------------
    def draw_icon(icon_index, x, y, enabled = true)
      bitmap = Cache.system("Iconset")
      rect = Rect.new(icon_index % 16 * 24, icon_index / 16 * 24, 24, 24)
      contents.blt(x, y, bitmap, rect, enabled ? 255 : translucent_alpha)
    end
    #--------------------------------------------------------------------------
    # * Draw Face Graphic
    #     enabled : Enabled flag. When false, draw semi-transparently.
    #--------------------------------------------------------------------------
    def draw_face(face_name, face_index, x, y, enabled = true)
      bitmap = Cache.face(face_name)
      rect = Rect.new(face_index % 4 * 96, face_index / 4 * 96, 96, 96)
      contents.blt(x, y, bitmap, rect, enabled ? 255 : translucent_alpha)
      bitmap.dispose
    end
    #--------------------------------------------------------------------------
    # * Draw Character Graphic
    #--------------------------------------------------------------------------
    def draw_character(character_name, character_index, x, y)
      return unless character_name
      bitmap = Cache.character(character_name)
      sign = character_name[/^[\!\$]./]
      if sign && sign.include?('$')
        cw = bitmap.width / 3
        ch = bitmap.height / 4
      else
        cw = bitmap.width / 12
        ch = bitmap.height / 8
      end
      n = character_index
      src_rect = Rect.new((n%4*3+1)*cw, (n/4*4)*ch, cw, ch)
      contents.blt(x - cw / 2, y - ch, bitmap, src_rect)
    end
    #--------------------------------------------------------------------------
    # * Get HP Text Color
    #--------------------------------------------------------------------------
    def hp_color(actor)
      return knockout_color if actor.hp == 0
      return crisis_color if actor.hp < actor.mhp / 4
      return normal_color
    end
    #--------------------------------------------------------------------------
    # * Get MP Text Color
    #--------------------------------------------------------------------------
    def mp_color(actor)
      return crisis_color if actor.mp < actor.mmp / 4
      return normal_color
    end
    #--------------------------------------------------------------------------
    # * Get TP Text Color
    #--------------------------------------------------------------------------
    def tp_color(actor)
      return normal_color
    end
    #--------------------------------------------------------------------------
    # * Draw Actor Walking Graphic
    #--------------------------------------------------------------------------
    def draw_actor_graphic(actor, x, y)
      draw_character(actor.character_name, actor.character_index, x, y)
    end
    #--------------------------------------------------------------------------
    # * Draw Actor Face Graphic
    #--------------------------------------------------------------------------
    def draw_actor_face(actor, x, y, enabled = true)
      draw_face(actor.face_name, actor.face_index, x, y, enabled)
    end
    #--------------------------------------------------------------------------
    # * Draw Name
    #--------------------------------------------------------------------------
    def draw_actor_name(actor, x, y, width = 112)
      change_color(hp_color(actor))
      draw_text(x, y, width, line_height, actor.name)
    end
    #--------------------------------------------------------------------------
    # * Draw Class
    #--------------------------------------------------------------------------
    def draw_actor_class(actor, x, y, width = 112)
      change_color(normal_color)
      draw_text(x, y, width, line_height, actor.class.name)
    end
    #--------------------------------------------------------------------------
    # * Draw Nickname
    #--------------------------------------------------------------------------
    def draw_actor_nickname(actor, x, y, width = 180)
      change_color(normal_color)
      draw_text(x, y, width, line_height, actor.nickname)
    end
    #--------------------------------------------------------------------------
    # * Draw Level
    #--------------------------------------------------------------------------
    def draw_actor_level(actor, x, y)
      change_color(system_color)
      draw_text(x, y, 32, line_height, Vocab::level_a)
      change_color(normal_color)
      draw_text(x + 32, y, 24, line_height, actor.level, 2)
    end
    #--------------------------------------------------------------------------
    # * Draw State and Buff/Debuff Icons
    #--------------------------------------------------------------------------
    def draw_actor_icons(actor, x, y, width = 96)
      icons = (actor.state_icons + actor.buff_icons)[0, width / 24]
      icons.each_with_index {|n, i| draw_icon(n, x + 24 * i, y) }
    end
    #--------------------------------------------------------------------------
    # * Draw Current Value/Maximum Value in Fractional Format
    #     current : Current value
    #     max     : Maximum value
    #     color1  : Color of current value
    #     color2  : Color of maximum value
    #--------------------------------------------------------------------------
    def draw_current_and_max_values(x, y, width, current, max, color1, color2)
      change_color(color1)
      xr = x + width
      if width < 96
        draw_text(xr - 40, y, 42, line_height, current, 2)
      else
        draw_text(xr - 92, y, 42, line_height, current, 2)
        change_color(color2)
        draw_text(xr - 52, y, 12, line_height, "/", 2)
        draw_text(xr - 42, y, 42, line_height, max, 2)
      end
    end
    #--------------------------------------------------------------------------
    # * Draw HP
    #--------------------------------------------------------------------------
    def draw_actor_hp(actor, x, y, width = 124)
      draw_gauge(x, y, width, actor.hp_rate, hp_gauge_color1, hp_gauge_color2)
      change_color(system_color)
      draw_text(x, y, 30, line_height, Vocab::hp_a)
      draw_current_and_max_values(x, y, width, actor.hp, actor.mhp,
                                  hp_color(actor), normal_color)
    end
    #--------------------------------------------------------------------------
    # * Draw MP
    #--------------------------------------------------------------------------
    def draw_actor_mp(actor, x, y, width = 124)
      draw_gauge(x, y, width, actor.mp_rate, mp_gauge_color1, mp_gauge_color2)
      change_color(system_color)
      draw_text(x, y, 30, line_height, Vocab::mp_a)
      draw_current_and_max_values(x, y, width, actor.mp, actor.mmp,
                                  mp_color(actor), normal_color)
    end
    #--------------------------------------------------------------------------
    # * Draw TP
    #--------------------------------------------------------------------------
    def draw_actor_tp(actor, x, y, width = 124)
      draw_gauge(x, y, width, actor.tp_rate, tp_gauge_color1, tp_gauge_color2)
      change_color(system_color)
      draw_text(x, y, 30, line_height, Vocab::tp_a)
      change_color(tp_color(actor))
      draw_text(x + width - 42, y, 42, line_height, actor.tp.to_i, 2)
    end
    #--------------------------------------------------------------------------
    # * Draw Simple Status
    #--------------------------------------------------------------------------
    def draw_actor_simple_status(actor, x, y)
      draw_actor_name(actor, x, y)
      draw_actor_level(actor, x, y + line_height * 1)
      draw_actor_icons(actor, x, y + line_height * 2)
      draw_actor_class(actor, x + 120, y)
      draw_actor_hp(actor, x + 120, y + line_height * 1)
      draw_actor_mp(actor, x + 120, y + line_height * 2)
    end
    #--------------------------------------------------------------------------
    # * Draw Parameters
    #--------------------------------------------------------------------------
    def draw_actor_param(actor, x, y, param_id)
      change_color(system_color)
      draw_text(x, y, 120, line_height, Vocab::param(param_id))
      change_color(normal_color)
      draw_text(x + 120, y, 36, line_height, actor.param(param_id), 2)
    end
    #--------------------------------------------------------------------------
    # * Draw Item Name
    #     enabled : Enabled flag. When false, draw semi-transparently.
    #--------------------------------------------------------------------------
    def draw_item_name(item, x, y, enabled = true, width = 172)
      return unless item
      draw_icon(item.icon_index, x, y, enabled)
      change_color(normal_color, enabled)
      draw_text(x + 24, y, width, line_height, item.name)
    end
    #--------------------------------------------------------------------------
    # * Draw Number (Gold Etc.) with Currency Unit
    #--------------------------------------------------------------------------
    def draw_currency_value(value, unit, x, y, width)
      cx = text_size(unit).width
      change_color(normal_color)
      draw_text(x, y, width - cx - 2, line_height, value, 2)
      change_color(system_color)
      draw_text(x, y, width, line_height, unit, 2)
    end
    #--------------------------------------------------------------------------
    # * Get Parameter Change Color
    #--------------------------------------------------------------------------
    def param_change_color(change)
      return power_up_color   if change > 0
      return power_down_color if change < 0
      return normal_color
    end
  end
  #==============================================================================
  # ** Window_Selectable
  #------------------------------------------------------------------------------
  #  This window class contains cursor movement and scroll functions.
  #==============================================================================

  class Window_Selectable < Window_Base
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :index                    # cursor position
    attr_reader   :help_window              # help window
    attr_accessor :cursor_fix               # fix cursor flag
    attr_accessor :cursor_all               # select all cursors flag
    #--------------------------------------------------------------------------
    # * Object Initialization
    #-------------------------------------------------------------------------
    def initialize(x, y, width, height)
      super
      @index = -1
      @handler = {}
      @cursor_fix = false
      @cursor_all = false
      update_padding
      deactivate
    end
    #--------------------------------------------------------------------------
    # * Get Digit Count
    #--------------------------------------------------------------------------
    def col_max
      return 1
    end
    #--------------------------------------------------------------------------
    # * Get Spacing for Items Arranged Side by Side
    #--------------------------------------------------------------------------
    def spacing
      return 32
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items
    #--------------------------------------------------------------------------
    def item_max
      return 0
    end
    #--------------------------------------------------------------------------
    # * Get Item Width
    #--------------------------------------------------------------------------
    def item_width
      (width - standard_padding * 2 + spacing) / col_max - spacing
    end
    #--------------------------------------------------------------------------
    # * Get Item Height
    #--------------------------------------------------------------------------
    def item_height
      line_height
    end
    #--------------------------------------------------------------------------
    # * Get Row Count
    #--------------------------------------------------------------------------
    def row_max
      [(item_max + col_max - 1) / col_max, 1].max
    end
    #--------------------------------------------------------------------------
    # * Calculate Height of Window Contents
    #--------------------------------------------------------------------------
    def contents_height
      [super - super % item_height, row_max * item_height].max
    end
    #--------------------------------------------------------------------------
    # * Update Padding
    #--------------------------------------------------------------------------
    def update_padding
      super
      update_padding_bottom
    end
    #--------------------------------------------------------------------------
    # * Update Bottom Padding
    #--------------------------------------------------------------------------
    def update_padding_bottom
      surplus = (height - standard_padding * 2) % item_height
      self.padding_bottom = padding + surplus
    end
    #--------------------------------------------------------------------------
    # * Set Height
    #--------------------------------------------------------------------------
    def height=(height)
      super
      update_padding
    end
    #--------------------------------------------------------------------------
    # * Change Active State
    #--------------------------------------------------------------------------
    def active=(active)
      super
      update_cursor
      call_update_help
    end
    #--------------------------------------------------------------------------
    # * Set Cursor Position
    #--------------------------------------------------------------------------
    def index=(index)
      @index = index
      update_cursor
      call_update_help
    end
    #--------------------------------------------------------------------------
    # * Select Item
    #--------------------------------------------------------------------------
    def select(index)
      self.index = index if index
    end
    #--------------------------------------------------------------------------
    # * Deselect Item
    #--------------------------------------------------------------------------
    def unselect
      self.index = -1
    end
    #--------------------------------------------------------------------------
    # * Get Current Line
    #--------------------------------------------------------------------------
    def row
      index / col_max
    end
    #--------------------------------------------------------------------------
    # * Get Top Row
    #--------------------------------------------------------------------------
    def top_row
      oy / item_height
    end
    #--------------------------------------------------------------------------
    # * Set Top Row
    #--------------------------------------------------------------------------
    def top_row=(row)
      row = 0 if row < 0
      row = row_max - 1 if row > row_max - 1
      self.oy = row * item_height
    end
    #--------------------------------------------------------------------------
    # * Get Number of Rows Displayable on 1 Page
    #--------------------------------------------------------------------------
    def page_row_max
      (height - padding - padding_bottom) / item_height
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items Displayable on 1 Page
    #--------------------------------------------------------------------------
    def page_item_max
      page_row_max * col_max
    end
    #--------------------------------------------------------------------------
    # * Determine Horizontal Selection
    #--------------------------------------------------------------------------
    def horizontal?
      page_row_max == 1
    end
    #--------------------------------------------------------------------------
    # * Get Bottom Row
    #--------------------------------------------------------------------------
    def bottom_row
      top_row + page_row_max - 1
    end
    #--------------------------------------------------------------------------
    # * Set Bottom Row
    #--------------------------------------------------------------------------
    def bottom_row=(row)
      self.top_row = row - (page_row_max - 1)
    end
    #--------------------------------------------------------------------------
    # * Get Rectangle for Drawing Items
    #--------------------------------------------------------------------------
    def item_rect(index)
      rect = Rect.new
      rect.width = item_width
      rect.height = item_height
      rect.x = index % col_max * (item_width + spacing)
      rect.y = index / col_max * item_height
      rect
    end
    #--------------------------------------------------------------------------
    # * Get Rectangle for Drawing Items (for Text)
    #--------------------------------------------------------------------------
    def item_rect_for_text(index)
      rect = item_rect(index)
      rect.x += 4
      rect.width -= 8
      rect
    end
    #--------------------------------------------------------------------------
    # * Set Help Window
    #--------------------------------------------------------------------------
    def help_window=(help_window)
      @help_window = help_window
      call_update_help
    end
    #--------------------------------------------------------------------------
    # * Set Handler Corresponding to Operation
    #     method : Method set as a handler (Method object)
    #--------------------------------------------------------------------------
    def set_handler(symbol, method)
      @handler[symbol] = method
    end
    #--------------------------------------------------------------------------
    # * Check for Handler Existence
    #--------------------------------------------------------------------------
    def handle?(symbol)
      @handler.include?(symbol)
    end
    #--------------------------------------------------------------------------
    # * Call Handler
    #--------------------------------------------------------------------------
    def call_handler(symbol)
      @handler[symbol].call if handle?(symbol)
    end
    #--------------------------------------------------------------------------
    # * Determine if Cursor is Moveable
    #--------------------------------------------------------------------------
    def cursor_movable?
      active && open? && !@cursor_fix && !@cursor_all && item_max > 0
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Down
    #--------------------------------------------------------------------------
    def cursor_down(wrap = false)
      if index < item_max - col_max || (wrap && col_max == 1)
        select((index + col_max) % item_max)
      end
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Up
    #--------------------------------------------------------------------------
    def cursor_up(wrap = false)
      if index >= col_max || (wrap && col_max == 1)
        select((index - col_max + item_max) % item_max)
      end
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Right
    #--------------------------------------------------------------------------
    def cursor_right(wrap = false)
      if col_max >= 2 && (index < item_max - 1 || (wrap && horizontal?))
        select((index + 1) % item_max)
      end
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Left
    #--------------------------------------------------------------------------
    def cursor_left(wrap = false)
      if col_max >= 2 && (index > 0 || (wrap && horizontal?))
        select((index - 1 + item_max) % item_max)
      end
    end
    #--------------------------------------------------------------------------
    # * Move Cursor One Page Down
    #--------------------------------------------------------------------------
    def cursor_pagedown
      if top_row + page_row_max < row_max
        self.top_row += page_row_max
        select([@index + page_item_max, item_max - 1].min)
      end
    end
    #--------------------------------------------------------------------------
    # * Move Cursor One Page Up
    #--------------------------------------------------------------------------
    def cursor_pageup
      if top_row > 0
        self.top_row -= page_row_max
        select([@index - page_item_max, 0].max)
      end
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      process_cursor_move
      process_handling
    end
    #--------------------------------------------------------------------------
    # * Cursor Movement Processing
    #--------------------------------------------------------------------------
    def process_cursor_move
      return unless cursor_movable?
      last_index = @index
      cursor_down (Input.trigger?(:DOWN))  if Input.repeat?(:DOWN)
      cursor_up   (Input.trigger?(:UP))    if Input.repeat?(:UP)
      cursor_right(Input.trigger?(:RIGHT)) if Input.repeat?(:RIGHT)
      cursor_left (Input.trigger?(:LEFT))  if Input.repeat?(:LEFT)
      cursor_pagedown   if !handle?(:pagedown) && Input.trigger?(:R)
      cursor_pageup     if !handle?(:pageup)   && Input.trigger?(:L)
      Sound.play_cursor if @index != last_index
    end
    #--------------------------------------------------------------------------
    # * Handling Processing for OK and Cancel Etc.
    #--------------------------------------------------------------------------
    def process_handling
      return unless open? && active
      return process_ok       if ok_enabled?        && Input.trigger?(:C)
      return process_cancel   if cancel_enabled?    && Input.trigger?(:B)
      return process_pagedown if handle?(:pagedown) && Input.trigger?(:R)
      return process_pageup   if handle?(:pageup)   && Input.trigger?(:L)
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of OK Processing
    #--------------------------------------------------------------------------
    def ok_enabled?
      handle?(:ok)
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Cancel Processing
    #--------------------------------------------------------------------------
    def cancel_enabled?
      handle?(:cancel)
    end
    #--------------------------------------------------------------------------
    # * Processing When OK Button Is Pressed
    #--------------------------------------------------------------------------
    def process_ok
      if current_item_enabled?
        Sound.play_ok
        Input.update
        deactivate
        call_ok_handler
      else
        Sound.play_buzzer
      end
    end
    #--------------------------------------------------------------------------
    # * Call OK Handler
    #--------------------------------------------------------------------------
    def call_ok_handler
      call_handler(:ok)
    end
    #--------------------------------------------------------------------------
    # * Processing When Cancel Button Is Pressed
    #--------------------------------------------------------------------------
    def process_cancel
      Sound.play_cancel
      Input.update
      deactivate
      call_cancel_handler
    end
    #--------------------------------------------------------------------------
    # * Call Cancel Handler
    #--------------------------------------------------------------------------
    def call_cancel_handler
      call_handler(:cancel)
    end
    #--------------------------------------------------------------------------
    # * Processing When L Button (Page Up) Is Pressed
    #--------------------------------------------------------------------------
    def process_pageup
      Sound.play_cursor
      Input.update
      deactivate
      call_handler(:pageup)
    end
    #--------------------------------------------------------------------------
    # * Processing When R Button (Page Down) Is Pressed
    #--------------------------------------------------------------------------
    def process_pagedown
      Sound.play_cursor
      Input.update
      deactivate
      call_handler(:pagedown)
    end
    #--------------------------------------------------------------------------
    # * Update Cursor
    #--------------------------------------------------------------------------
    def update_cursor
      if @cursor_all
        cursor_rect.set(0, 0, contents.width, row_max * item_height)
        self.top_row = 0
      elsif @index < 0
        cursor_rect.empty
      else
        ensure_cursor_visible
        cursor_rect.set(item_rect(@index))
      end
    end
    #--------------------------------------------------------------------------
    # * Scroll Cursor to Position Within Screen
    #--------------------------------------------------------------------------
    def ensure_cursor_visible
      self.top_row = row if row < top_row
      self.bottom_row = row if row > bottom_row
    end
    #--------------------------------------------------------------------------
    # * Call Help Window Update Method
    #--------------------------------------------------------------------------
    def call_update_help
      update_help if active && @help_window
    end
    #--------------------------------------------------------------------------
    # * Update Help Window
    #--------------------------------------------------------------------------
    def update_help
      @help_window.clear
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Selection Item
    #--------------------------------------------------------------------------
    def current_item_enabled?
      return true
    end
    #--------------------------------------------------------------------------
    # * Draw All Items
    #--------------------------------------------------------------------------
    def draw_all_items
      item_max.times {|i| draw_item(i) }
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(index)
    end
    #--------------------------------------------------------------------------
    # * Erase Item
    #--------------------------------------------------------------------------
    def clear_item(index)
      contents.clear_rect(item_rect(index))
    end
    #--------------------------------------------------------------------------
    # * Redraw Item
    #--------------------------------------------------------------------------
    def redraw_item(index)
      clear_item(index) if index >= 0
      draw_item(index)  if index >= 0
    end
    #--------------------------------------------------------------------------
    # * Redraw Selection Item
    #--------------------------------------------------------------------------
    def redraw_current_item
      redraw_item(@index)
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      draw_all_items
    end
  end
  #==============================================================================
  # ** Window_Command
  #------------------------------------------------------------------------------
  #  This window deals with general command choices.
  #==============================================================================

  class Window_Command < Window_Selectable
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y)
      clear_command_list
      make_command_list
      super(x, y, window_width, window_height)
      refresh
      select(0)
      activate
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 160
    end
    #--------------------------------------------------------------------------
    # * Get Window Height
    #--------------------------------------------------------------------------
    def window_height
      fitting_height(visible_line_number)
    end
    #--------------------------------------------------------------------------
    # * Get Number of Lines to Show
    #--------------------------------------------------------------------------
    def visible_line_number
      item_max
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items
    #--------------------------------------------------------------------------
    def item_max
      @list.size
    end
    #--------------------------------------------------------------------------
    # * Clear Command List
    #--------------------------------------------------------------------------
    def clear_command_list
      @list = []
    end
    #--------------------------------------------------------------------------
    # * Create Command List
    #--------------------------------------------------------------------------
    def make_command_list
    end
    #--------------------------------------------------------------------------
    # * Add Command
    #     name    : Command name
    #     symbol  : Corresponding symbol
    #     enabled : Activation state flag
    #     ext     : Arbitrary extended data
    #--------------------------------------------------------------------------
    def add_command(name, symbol, enabled = true, ext = nil)
      @list.push({:name=>name, :symbol=>symbol, :enabled=>enabled, :ext=>ext})
    end
    #--------------------------------------------------------------------------
    # * Get Command Name
    #--------------------------------------------------------------------------
    def command_name(index)
      @list[index][:name]
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Command
    #--------------------------------------------------------------------------
    def command_enabled?(index)
      @list[index][:enabled]
    end
    #--------------------------------------------------------------------------
    # * Get Command Data of Selection Item
    #--------------------------------------------------------------------------
    def current_data
      index >= 0 ? @list[index] : nil
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Selection Item
    #--------------------------------------------------------------------------
    def current_item_enabled?
      current_data ? current_data[:enabled] : false
    end
    #--------------------------------------------------------------------------
    # * Get Symbol of Selection Item
    #--------------------------------------------------------------------------
    def current_symbol
      current_data ? current_data[:symbol] : nil
    end
    #--------------------------------------------------------------------------
    # * Get Extended Data of Selected Item
    #--------------------------------------------------------------------------
    def current_ext
      current_data ? current_data[:ext] : nil
    end
    #--------------------------------------------------------------------------
    # * Move Cursor to Command with Specified Symbol
    #--------------------------------------------------------------------------
    def select_symbol(symbol)
      @list.each_index {|i| select(i) if @list[i][:symbol] == symbol }
    end
    #--------------------------------------------------------------------------
    # * Move Cursor to Command with Specified Extended Data
    #--------------------------------------------------------------------------
    def select_ext(ext)
      @list.each_index {|i| select(i) if @list[i][:ext] == ext }
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(index)
      change_color(normal_color, command_enabled?(index))
      draw_text(item_rect_for_text(index), command_name(index), alignment)
    end
    #--------------------------------------------------------------------------
    # * Get Alignment
    #--------------------------------------------------------------------------
    def alignment
      return 0
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of OK Processing
    #--------------------------------------------------------------------------
    def ok_enabled?
      return true
    end
    #--------------------------------------------------------------------------
    # * Call OK Handler
    #--------------------------------------------------------------------------
    def call_ok_handler
      if handle?(current_symbol)
        call_handler(current_symbol)
      elsif handle?(:ok)
        super
      else
        activate
      end
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      clear_command_list
      make_command_list
      create_contents
      super
    end
  end
  #==============================================================================
  # ** Window_HorzCommand
  #------------------------------------------------------------------------------
  #  This is a command window for the horizontal selection format.
  #==============================================================================

  class Window_HorzCommand < Window_Command
    #--------------------------------------------------------------------------
    # * Get Number of Lines to Show
    #--------------------------------------------------------------------------
    def visible_line_number
      return 1
    end
    #--------------------------------------------------------------------------
    # * Get Digit Count
    #--------------------------------------------------------------------------
    def col_max
      return 4
    end
    #--------------------------------------------------------------------------
    # * Get Spacing for Items Arranged Side by Side
    #--------------------------------------------------------------------------
    def spacing
      return 8
    end
    #--------------------------------------------------------------------------
    # * Calculate Width of Window Contents
    #--------------------------------------------------------------------------
    def contents_width
      (item_width + spacing) * item_max - spacing
    end
    #--------------------------------------------------------------------------
    # * Calculate Height of Window Contents
    #--------------------------------------------------------------------------
    def contents_height
      item_height
    end
    #--------------------------------------------------------------------------
    # * Get Leading Digits
    #--------------------------------------------------------------------------
    def top_col
      ox / (item_width + spacing)
    end
    #--------------------------------------------------------------------------
    # * Set Leading Digits
    #--------------------------------------------------------------------------
    def top_col=(col)
      col = 0 if col < 0
      col = col_max - 1 if col > col_max - 1
      self.ox = col * (item_width + spacing)
    end
    #--------------------------------------------------------------------------
    # * Get Trailing Digits
    #--------------------------------------------------------------------------
    def bottom_col
      top_col + col_max - 1
    end
    #--------------------------------------------------------------------------
    # * Set Trailing Digits
    #--------------------------------------------------------------------------
    def bottom_col=(col)
      self.top_col = col - (col_max - 1)
    end
    #--------------------------------------------------------------------------
    # * Scroll Cursor to Position Within Screen
    #--------------------------------------------------------------------------
    def ensure_cursor_visible
      self.top_col = index if index < top_col
      self.bottom_col = index if index > bottom_col
    end
    #--------------------------------------------------------------------------
    # * Get Rectangle for Displaying Items
    #--------------------------------------------------------------------------
    def item_rect(index)
      rect = super
      rect.x = index * (item_width + spacing)
      rect.y = 0
      rect
    end
    #--------------------------------------------------------------------------
    # * Get Alignment
    #--------------------------------------------------------------------------
    def alignment
      return 1
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Down
    #--------------------------------------------------------------------------
    def cursor_down(wrap = false)
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Up
    #--------------------------------------------------------------------------
    def cursor_up(wrap = false)
    end
    #--------------------------------------------------------------------------
    # * Move Cursor One Page Down
    #--------------------------------------------------------------------------
    def cursor_pagedown
    end
    #--------------------------------------------------------------------------
    # * Move Cursor One Page Up
    #--------------------------------------------------------------------------
    def cursor_pageup
    end
  end
  #==============================================================================
  # ** Window_Help
  #------------------------------------------------------------------------------
  #  This window shows skill and item explanations along with actor status.
  #==============================================================================

  class Window_Help < Window_Base
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(line_number = 2)
      super(0, 0, Graphics.width, fitting_height(line_number))
    end
    #--------------------------------------------------------------------------
    # * Set Text
    #--------------------------------------------------------------------------
    def set_text(text)
      if text != @text
        @text = text
        refresh
      end
    end
    #--------------------------------------------------------------------------
    # * Clear
    #--------------------------------------------------------------------------
    def clear
      set_text("")
    end
    #--------------------------------------------------------------------------
    # * Set Item
    #     item : Skills and items etc.
    #--------------------------------------------------------------------------
    def set_item(item)
      set_text(item ? item.description : "")
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      draw_text_ex(4, 0, @text)
    end
  end
  #==============================================================================
  # ** Window_Gold
  #------------------------------------------------------------------------------
  #  This window displays the party's gold.
  #==============================================================================

  class Window_Gold < Window_Base
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0, window_width, fitting_height(1))
      refresh
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 160
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      draw_currency_value(value, currency_unit, 4, 0, contents.width - 8)
    end
    #--------------------------------------------------------------------------
    # * Get Party Gold
    #--------------------------------------------------------------------------
    def value
      $game_party.gold
    end
    #--------------------------------------------------------------------------
    # Get Currency Unit
    #--------------------------------------------------------------------------
    def currency_unit
      Vocab::currency_unit
    end
    #--------------------------------------------------------------------------
    # * Open Window
    #--------------------------------------------------------------------------
    def open
      refresh
      super
    end
  end
  #==============================================================================
  # ** Window_MenuCommand
  #------------------------------------------------------------------------------
  #  This command window appears on the menu screen.
  #==============================================================================

  class Window_MenuCommand < Window_Command
    #--------------------------------------------------------------------------
    # * Initialize Command Selection Position (Class Method)
    #--------------------------------------------------------------------------
    def self.init_command_position
      @@last_command_symbol = nil
    end
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0)
      select_last
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 160
    end
    #--------------------------------------------------------------------------
    # * Get Number of Lines to Show
    #--------------------------------------------------------------------------
    def visible_line_number
      item_max
    end
    #--------------------------------------------------------------------------
    # * Create Command List
    #--------------------------------------------------------------------------
    def make_command_list
      add_main_commands
      add_formation_command
      add_original_commands
      add_save_command
      add_game_end_command
    end
    #--------------------------------------------------------------------------
    # * Add Main Commands to List
    #--------------------------------------------------------------------------
    def add_main_commands
      add_command(Vocab::item,   :item,   main_commands_enabled)
      add_command(Vocab::skill,  :skill,  main_commands_enabled)
      add_command(Vocab::equip,  :equip,  main_commands_enabled)
      add_command(Vocab::status, :status, main_commands_enabled)
    end
    #--------------------------------------------------------------------------
    # * Add Formation to Command List
    #--------------------------------------------------------------------------
    def add_formation_command
      add_command(Vocab::formation, :formation, formation_enabled)
    end
    #--------------------------------------------------------------------------
    # * For Adding Original Commands
    #--------------------------------------------------------------------------
    def add_original_commands
    end
    #--------------------------------------------------------------------------
    # * Add Save to Command List
    #--------------------------------------------------------------------------
    def add_save_command
      add_command(Vocab::save, :save, save_enabled)
    end
    #--------------------------------------------------------------------------
    # * Add Exit Game to Command List
    #--------------------------------------------------------------------------
    def add_game_end_command
      add_command(Vocab::game_end, :game_end)
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Main Commands
    #--------------------------------------------------------------------------
    def main_commands_enabled
      $game_party.exists
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Formation
    #--------------------------------------------------------------------------
    def formation_enabled
      $game_party.members.size >= 2 && !$game_system.formation_disabled
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Save
    #--------------------------------------------------------------------------
    def save_enabled
      !$game_system.save_disabled
    end
    #--------------------------------------------------------------------------
    # * Processing When OK Button Is Pressed
    #--------------------------------------------------------------------------
    def process_ok
      @@last_command_symbol = current_symbol
      super
    end
    #--------------------------------------------------------------------------
    # * Restore Previous Selection Position
    #--------------------------------------------------------------------------
    def select_last
      select_symbol(@@last_command_symbol)
    end
  end
  #==============================================================================
  # ** Window_MenuStatus
  #------------------------------------------------------------------------------
  #  This window displays party member status on the menu screen.
  #==============================================================================

  class Window_MenuStatus < Window_Selectable
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :pending_index            # Pending position (for formation)
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y)
      super(x, y, window_width, window_height)
      @pending_index = -1
      refresh
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      Graphics.width - 160
    end
    #--------------------------------------------------------------------------
    # * Get Window Height
    #--------------------------------------------------------------------------
    def window_height
      Graphics.height
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items
    #--------------------------------------------------------------------------
    def item_max
      $game_party.members.size
    end
    #--------------------------------------------------------------------------
    # * Get Item Height
    #--------------------------------------------------------------------------
    def item_height
      (height - standard_padding * 2) / 4
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(index)
      actor = $game_party.members[index]
      enabled = $game_party.battle_members.include?(actor)
      rect = item_rect(index)
      draw_item_background(index)
      draw_actor_face(actor, rect.x + 1, rect.y + 1, enabled)
      draw_actor_simple_status(actor, rect.x + 108, rect.y + line_height / 2)
    end
    #--------------------------------------------------------------------------
    # * Draw Background for Item
    #--------------------------------------------------------------------------
    def draw_item_background(index)
      if index == @pending_index
        contents.fill_rect(item_rect(index), pending_color)
      end
    end
    #--------------------------------------------------------------------------
    # * Processing When OK Button Is Pressed
    #--------------------------------------------------------------------------
    def process_ok
      super
      $game_party.menu_actor = $game_party.members[index]
    end
    #--------------------------------------------------------------------------
    # * Restore Previous Selection Position
    #--------------------------------------------------------------------------
    def select_last
      select($game_party.menu_actor.index || 0)
    end
    #--------------------------------------------------------------------------
    # * Set Pending Position (for Formation)
    #--------------------------------------------------------------------------
    def pending_index=(index)
      last_pending_index = @pending_index
      @pending_index = index
      redraw_item(@pending_index)
      redraw_item(last_pending_index)
    end
  end
  #==============================================================================
  # ** Window_MenuActor
  #------------------------------------------------------------------------------
  #  This window is for selecting actors that will be the target of item or
  # skill use.
  #==============================================================================

  class Window_MenuActor < Window_MenuStatus
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0)
      self.visible = false
    end
    #--------------------------------------------------------------------------
    # * Processing When OK Button Is Pressed
    #--------------------------------------------------------------------------
    def process_ok
      $game_party.target_actor = $game_party.members[index] unless @cursor_all
      call_ok_handler
    end
    #--------------------------------------------------------------------------
    # * Restore Previous Selection Position
    #--------------------------------------------------------------------------
    def select_last
      select($game_party.target_actor.index || 0)
    end
    #--------------------------------------------------------------------------
    # * Set Position of Cursor for Item
    #--------------------------------------------------------------------------
    def select_for_item(item)
      @cursor_fix = item.for_user?
      @cursor_all = item.for_all?
      if @cursor_fix
        select($game_party.menu_actor.index)
      elsif @cursor_all
        select(0)
      else
        select_last
      end
    end
  end
  #==============================================================================
  # ** Window_ItemCategory
  #------------------------------------------------------------------------------
  #  This window is for selecting a category of normal items and equipment
  # on the item screen or shop screen.
  #==============================================================================

  class Window_ItemCategory < Window_HorzCommand
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :item_window
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0)
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      Graphics.width
    end
    #--------------------------------------------------------------------------
    # * Get Digit Count
    #--------------------------------------------------------------------------
    def col_max
      return 4
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      @item_window.category = current_symbol if @item_window
    end
    #--------------------------------------------------------------------------
    # * Create Command List
    #--------------------------------------------------------------------------
    def make_command_list
      add_command(Vocab::item,     :item)
      add_command(Vocab::weapon,   :weapon)
      add_command(Vocab::armor,    :armor)
      add_command(Vocab::key_item, :key_item)
    end
    #--------------------------------------------------------------------------
    # * Set Item Window
    #--------------------------------------------------------------------------
    def item_window=(item_window)
      @item_window = item_window
      update
    end
  end
  #==============================================================================
  # ** Window_ItemList
  #------------------------------------------------------------------------------
  #  This window displays a list of party items on the item screen.
  #==============================================================================

  class Window_ItemList < Window_Selectable
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y, width, height)
      super
      @category = :none
      @data = []
    end
    #--------------------------------------------------------------------------
    # * Set Category
    #--------------------------------------------------------------------------
    def category=(category)
      return if @category == category
      @category = category
      refresh
      self.oy = 0
    end
    #--------------------------------------------------------------------------
    # * Get Digit Count
    #--------------------------------------------------------------------------
    def col_max
      return 2
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items
    #--------------------------------------------------------------------------
    def item_max
      @data ? @data.size : 1
    end
    #--------------------------------------------------------------------------
    # * Get Item
    #--------------------------------------------------------------------------
    def item
      @data && index >= 0 ? @data[index] : nil
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Selection Item
    #--------------------------------------------------------------------------
    def current_item_enabled?
      enable?(@data[index])
    end
    #--------------------------------------------------------------------------
    # * Include in Item List?
    #--------------------------------------------------------------------------
    def include?(item)
      case @category
      when :item
        item.is_a?(RPG::Item) && !item.key_item?
      when :weapon
        item.is_a?(RPG::Weapon)
      when :armor
        item.is_a?(RPG::Armor)
      when :key_item
        item.is_a?(RPG::Item) && item.key_item?
      else
        false
      end
    end
    #--------------------------------------------------------------------------
    # * Display in Enabled State?
    #--------------------------------------------------------------------------
    def enable?(item)
      $game_party.usable?(item)
    end
    #--------------------------------------------------------------------------
    # * Create Item List
    #--------------------------------------------------------------------------
    def make_item_list
      @data = $game_party.all_items.select {|item| include?(item) }
      @data.push(nil) if include?(nil)
    end
    #--------------------------------------------------------------------------
    # * Restore Previous Selection Position
    #--------------------------------------------------------------------------
    def select_last
      select(@data.index($game_party.last_item.object) || 0)
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(index)
      item = @data[index]
      if item
        rect = item_rect(index)
        rect.width -= 4
        draw_item_name(item, rect.x, rect.y, enable?(item))
        draw_item_number(rect, item)
      end
    end
    #--------------------------------------------------------------------------
    # * Draw Number of Items
    #--------------------------------------------------------------------------
    def draw_item_number(rect, item)
      draw_text(rect, sprintf(":%2d", $game_party.item_number(item)), 2)
    end
    #--------------------------------------------------------------------------
    # * Update Help Text
    #--------------------------------------------------------------------------
    def update_help
      @help_window.set_item(item)
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      make_item_list
      create_contents
      draw_all_items
    end
  end
  #==============================================================================
  # ** Window_SkillCommand
  #------------------------------------------------------------------------------
  #  This window is for selecting commands (special attacks, magic, etc.) on the
  # skill screen.
  #==============================================================================

  class Window_SkillCommand < Window_Command
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :skill_window
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y)
      super(x, y)
      @actor = nil
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 160
    end
    #--------------------------------------------------------------------------
    # * Set Actor
    #--------------------------------------------------------------------------
    def actor=(actor)
      return if @actor == actor
      @actor = actor
      refresh
      select_last
    end
    #--------------------------------------------------------------------------
    # * Get Number of Lines to Show
    #--------------------------------------------------------------------------
    def visible_line_number
      return 4
    end
    #--------------------------------------------------------------------------
    # * Create Command List
    #--------------------------------------------------------------------------
    def make_command_list
      return unless @actor
      @actor.added_skill_types.sort.each do |stype_id|
        name = $data_system.skill_types[stype_id]
        add_command(name, :skill, true, stype_id)
      end
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      @skill_window.stype_id = current_ext if @skill_window
    end
    #--------------------------------------------------------------------------
    # * Set Skill Window
    #--------------------------------------------------------------------------
    def skill_window=(skill_window)
      @skill_window = skill_window
      update
    end
    #--------------------------------------------------------------------------
    # * Restore Previous Selection Position
    #--------------------------------------------------------------------------
    def select_last
      skill = @actor.last_skill.object
      if skill
        select_ext(skill.stype_id)
      else
        select(0)
      end
    end
  end
  #==============================================================================
  # ** Window_SkillStatus
  #------------------------------------------------------------------------------
  #  This window displays the skill user's status on the skill screen.
  #==============================================================================

  class Window_SkillStatus < Window_Base
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y)
      super(x, y, window_width, fitting_height(4))
      @actor = nil
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      Graphics.width - 160
    end
    #--------------------------------------------------------------------------
    # * Actor Settings
    #--------------------------------------------------------------------------
    def actor=(actor)
      return if @actor == actor
      @actor = actor
      refresh
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      return unless @actor
      draw_actor_face(@actor, 0, 0)
      draw_actor_simple_status(@actor, 108, line_height / 2)
    end
  end
  #==============================================================================
  # ** Window_SkillList
  #------------------------------------------------------------------------------
  #  This window is for displaying a list of available skills on the skill window.
  #==============================================================================

  class Window_SkillList < Window_Selectable
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y, width, height)
      super
      @actor = nil
      @stype_id = 0
      @data = []
    end
    #--------------------------------------------------------------------------
    # * Set Actor
    #--------------------------------------------------------------------------
    def actor=(actor)
      return if @actor == actor
      @actor = actor
      refresh
      self.oy = 0
    end
    #--------------------------------------------------------------------------
    # * Set Skill Type ID
    #--------------------------------------------------------------------------
    def stype_id=(stype_id)
      return if @stype_id == stype_id
      @stype_id = stype_id
      refresh
      self.oy = 0
    end
    #--------------------------------------------------------------------------
    # * Get Digit Count
    #--------------------------------------------------------------------------
    def col_max
      return 2
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items
    #--------------------------------------------------------------------------
    def item_max
      @data ? @data.size : 1
    end
    #--------------------------------------------------------------------------
    # * Get Skill
    #--------------------------------------------------------------------------
    def item
      @data && index >= 0 ? @data[index] : nil
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Selection Item
    #--------------------------------------------------------------------------
    def current_item_enabled?
      enable?(@data[index])
    end
    #--------------------------------------------------------------------------
    # * Include in Skill List?
    #--------------------------------------------------------------------------
    def include?(item)
      item && item.stype_id == @stype_id
    end
    #--------------------------------------------------------------------------
    # * Display Skill in Active State?
    #--------------------------------------------------------------------------
    def enable?(item)
      @actor && @actor.usable?(item)
    end
    #--------------------------------------------------------------------------
    # * Create Skill List
    #--------------------------------------------------------------------------
    def make_item_list
      @data = @actor ? @actor.skills.select {|skill| include?(skill) } : []
    end
    #--------------------------------------------------------------------------
    # * Restore Previous Selection Position
    #--------------------------------------------------------------------------
    def select_last
      select(@data.index(@actor.last_skill.object) || 0)
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(index)
      skill = @data[index]
      if skill
        rect = item_rect(index)
        rect.width -= 4
        draw_item_name(skill, rect.x, rect.y, enable?(skill))
        draw_skill_cost(rect, skill)
      end
    end
    #--------------------------------------------------------------------------
    # * Draw Skill Use Cost
    #--------------------------------------------------------------------------
    def draw_skill_cost(rect, skill)
      if @actor.skill_tp_cost(skill) > 0
        change_color(tp_cost_color, enable?(skill))
        draw_text(rect, @actor.skill_tp_cost(skill), 2)
      elsif @actor.skill_mp_cost(skill) > 0
        change_color(mp_cost_color, enable?(skill))
        draw_text(rect, @actor.skill_mp_cost(skill), 2)
      end
    end
    #--------------------------------------------------------------------------
    # * Update Help Text
    #--------------------------------------------------------------------------
    def update_help
      @help_window.set_item(item)
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      make_item_list
      create_contents
      draw_all_items
    end
  end
  #==============================================================================
  # ** Window_EquipStatus
  #------------------------------------------------------------------------------
  #  This window displays actor parameter changes on the equipment screen.
  #==============================================================================

  class Window_EquipStatus < Window_Base
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y)
      super(x, y, window_width, window_height)
      @actor = nil
      @temp_actor = nil
      refresh
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 208
    end
    #--------------------------------------------------------------------------
    # * Get Window Height
    #--------------------------------------------------------------------------
    def window_height
      fitting_height(visible_line_number)
    end
    #--------------------------------------------------------------------------
    # * Get Number of Lines to Show
    #--------------------------------------------------------------------------
    def visible_line_number
      return 7
    end
    #--------------------------------------------------------------------------
    # * Set Actor
    #--------------------------------------------------------------------------
    def actor=(actor)
      return if @actor == actor
      @actor = actor
      refresh
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      draw_actor_name(@actor, 4, 0) if @actor
      6.times {|i| draw_item(0, line_height * (1 + i), 2 + i) }
    end
    #--------------------------------------------------------------------------
    # * Set Temporary Actor After Equipment Change
    #--------------------------------------------------------------------------
    def set_temp_actor(temp_actor)
      return if @temp_actor == temp_actor
      @temp_actor = temp_actor
      refresh
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(x, y, param_id)
      draw_param_name(x + 4, y, param_id)
      draw_current_param(x + 94, y, param_id) if @actor
      draw_right_arrow(x + 126, y)
      draw_new_param(x + 150, y, param_id) if @temp_actor
    end
    #--------------------------------------------------------------------------
    # * Draw Parameter Name
    #--------------------------------------------------------------------------
    def draw_param_name(x, y, param_id)
      change_color(system_color)
      draw_text(x, y, 80, line_height, Vocab::param(param_id))
    end
    #--------------------------------------------------------------------------
    # * Draw Current Parameter
    #--------------------------------------------------------------------------
    def draw_current_param(x, y, param_id)
      change_color(normal_color)
      draw_text(x, y, 32, line_height, @actor.param(param_id), 2)
    end
    #--------------------------------------------------------------------------
    # * Draw Right Arrow
    #--------------------------------------------------------------------------
    def draw_right_arrow(x, y)
      change_color(system_color)
      draw_text(x, y, 22, line_height, "→", 1)
    end
    #--------------------------------------------------------------------------
    # * Draw Post-Equipment Change Parameter
    #--------------------------------------------------------------------------
    def draw_new_param(x, y, param_id)
      new_value = @temp_actor.param(param_id)
      change_color(param_change_color(new_value - @actor.param(param_id)))
      draw_text(x, y, 32, line_height, new_value, 2)
    end
  end
  #==============================================================================
  # ** Window_EquipCommand
  #------------------------------------------------------------------------------
  #  This window is for selecting commands (change equipment/ultimate equipment
  # etc.) on the skill screen.
  #==============================================================================

  class Window_EquipCommand < Window_HorzCommand
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y, width)
      @window_width = width
      super(x, y)
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      @window_width
    end
    #--------------------------------------------------------------------------
    # * Get Digit Count
    #--------------------------------------------------------------------------
    def col_max
      return 3
    end
    #--------------------------------------------------------------------------
    # * Create Command List
    #--------------------------------------------------------------------------
    def make_command_list
      add_command(Vocab::equip2,   :equip)
      add_command(Vocab::optimize, :optimize)
      add_command(Vocab::clear,    :clear)
    end
  end
  #==============================================================================
  # ** Window_EquipSlot
  #------------------------------------------------------------------------------
  #  This window displays items the actor is currently equipped with on the
  # equipment screen.
  #==============================================================================

  class Window_EquipSlot < Window_Selectable
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :status_window            # Status window
    attr_reader   :item_window              # Item window
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y, width)
      super(x, y, width, window_height)
      @actor = nil
      refresh
    end
    #--------------------------------------------------------------------------
    # * Get Window Height
    #--------------------------------------------------------------------------
    def window_height
      fitting_height(visible_line_number)
    end
    #--------------------------------------------------------------------------
    # * Get Number of Lines to Show
    #--------------------------------------------------------------------------
    def visible_line_number
      return 5
    end
    #--------------------------------------------------------------------------
    # * Set Actor
    #--------------------------------------------------------------------------
    def actor=(actor)
      return if @actor == actor
      @actor = actor
      refresh
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      @item_window.slot_id = index if @item_window
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items
    #--------------------------------------------------------------------------
    def item_max
      @actor ? @actor.equip_slots.size : 0
    end
    #--------------------------------------------------------------------------
    # * Get Item
    #--------------------------------------------------------------------------
    def item
      @actor ? @actor.equips[index] : nil
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(index)
      return unless @actor
      rect = item_rect_for_text(index)
      change_color(system_color, enable?(index))
      draw_text(rect.x, rect.y, 92, line_height, slot_name(index))
      draw_item_name(@actor.equips[index], rect.x + 92, rect.y, enable?(index))
    end
    #--------------------------------------------------------------------------
    # * Get Equipment Slot Name
    #--------------------------------------------------------------------------
    def slot_name(index)
      @actor ? Vocab::etype(@actor.equip_slots[index]) : ""
    end
    #--------------------------------------------------------------------------
    # * Display Equipment Slot in Enabled State?
    #--------------------------------------------------------------------------
    def enable?(index)
      @actor ? @actor.equip_change_ok?(index) : false
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Selection Item
    #--------------------------------------------------------------------------
    def current_item_enabled?
      enable?(index)
    end
    #--------------------------------------------------------------------------
    # * Set Status Window
    #--------------------------------------------------------------------------
    def status_window=(status_window)
      @status_window = status_window
      call_update_help
    end
    #--------------------------------------------------------------------------
    # * Set Item Window
    #--------------------------------------------------------------------------
    def item_window=(item_window)
      @item_window = item_window
      update
    end
    #--------------------------------------------------------------------------
    # * Update Help Text
    #--------------------------------------------------------------------------
    def update_help
      super
      @help_window.set_item(item) if @help_window
      @status_window.set_temp_actor(nil) if @status_window
    end
  end
  #==============================================================================
  # ** Window_EquipItem
  #------------------------------------------------------------------------------
  #  This window displays choices when opting to change equipment on the
  # equipment screen.
  #==============================================================================

  class Window_EquipItem < Window_ItemList
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :status_window            # Status window
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y, width, height)
      super
      @actor = nil
      @slot_id = 0
    end
    #--------------------------------------------------------------------------
    # * Set Actor
    #--------------------------------------------------------------------------
    def actor=(actor)
      return if @actor == actor
      @actor = actor
      refresh
      self.oy = 0
    end
    #--------------------------------------------------------------------------
    # * Set Equipment Slot ID
    #--------------------------------------------------------------------------
    def slot_id=(slot_id)
      return if @slot_id == slot_id
      @slot_id = slot_id
      refresh
      self.oy = 0
    end
    #--------------------------------------------------------------------------
    # * Include in Item List?
    #--------------------------------------------------------------------------
    def include?(item)
      return true if item == nil
      return false unless item.is_a?(RPG::EquipItem)
      return false if @slot_id < 0
      return false if item.etype_id != @actor.equip_slots[@slot_id]
      return @actor.equippable?(item)
    end
    #--------------------------------------------------------------------------
    # * Display in Enabled State?
    #--------------------------------------------------------------------------
    def enable?(item)
      return true
    end
    #--------------------------------------------------------------------------
    # * Restore Previous Selection Position
    #--------------------------------------------------------------------------
    def select_last
    end
    #--------------------------------------------------------------------------
    # * Set Status Window
    #--------------------------------------------------------------------------
    def status_window=(status_window)
      @status_window = status_window
      call_update_help
    end
    #--------------------------------------------------------------------------
    # * Update Help Text
    #--------------------------------------------------------------------------
    def update_help
      super
      if @actor && @status_window
        temp_actor = Marshal.load(Marshal.dump(@actor))
        temp_actor.force_change_equip(@slot_id, item)
        @status_window.set_temp_actor(temp_actor)
      end
    end
  end
  #==============================================================================
  # ** Window_Status
  #------------------------------------------------------------------------------
  #  This window displays full status specs on the status screen.
  #==============================================================================

  class Window_Status < Window_Selectable
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(actor)
      super(0, 0, Graphics.width, Graphics.height)
      @actor = actor
      refresh
      activate
    end
    #--------------------------------------------------------------------------
    # * Set Actor
    #--------------------------------------------------------------------------
    def actor=(actor)
      return if @actor == actor
      @actor = actor
      refresh
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      draw_block1   (line_height * 0)
      draw_horz_line(line_height * 1)
      draw_block2   (line_height * 2)
      draw_horz_line(line_height * 6)
      draw_block3   (line_height * 7)
      draw_horz_line(line_height * 13)
      draw_block4   (line_height * 14)
    end
    #--------------------------------------------------------------------------
    # * Draw Block 1
    #--------------------------------------------------------------------------
    def draw_block1(y)
      draw_actor_name(@actor, 4, y)
      draw_actor_class(@actor, 128, y)
      draw_actor_nickname(@actor, 288, y)
    end
    #--------------------------------------------------------------------------
    # * Draw Block 2
    #--------------------------------------------------------------------------
    def draw_block2(y)
      draw_actor_face(@actor, 8, y)
      draw_basic_info(136, y)
      draw_exp_info(304, y)
    end
    #--------------------------------------------------------------------------
    # * Draw Block 3
    #--------------------------------------------------------------------------
    def draw_block3(y)
      draw_parameters(32, y)
      draw_equipments(288, y)
    end
    #--------------------------------------------------------------------------
    # * Draw Block 4
    #--------------------------------------------------------------------------
    def draw_block4(y)
      draw_description(4, y)
    end
    #--------------------------------------------------------------------------
    # * Draw Horizontal Line
    #--------------------------------------------------------------------------
    def draw_horz_line(y)
      line_y = y + line_height / 2 - 1
      contents.fill_rect(0, line_y, contents_width, 2, line_color)
    end
    #--------------------------------------------------------------------------
    # * Get Color of Horizontal Line
    #--------------------------------------------------------------------------
    def line_color
      color = normal_color
      color.alpha = 48
      color
    end
    #--------------------------------------------------------------------------
    # * Draw Basic Information
    #--------------------------------------------------------------------------
    def draw_basic_info(x, y)
      draw_actor_level(@actor, x, y + line_height * 0)
      draw_actor_icons(@actor, x, y + line_height * 1)
      draw_actor_hp(@actor, x, y + line_height * 2)
      draw_actor_mp(@actor, x, y + line_height * 3)
    end
    #--------------------------------------------------------------------------
    # * Draw Parameters
    #--------------------------------------------------------------------------
    def draw_parameters(x, y)
      6.times {|i| draw_actor_param(@actor, x, y + line_height * i, i + 2) }
    end
    #--------------------------------------------------------------------------
    # * Draw Experience Information
    #--------------------------------------------------------------------------
    def draw_exp_info(x, y)
      s1 = @actor.max_level? ? "-------" : @actor.exp
      s2 = @actor.max_level? ? "-------" : @actor.next_level_exp - @actor.exp
      s_next = sprintf(Vocab::ExpNext, Vocab::level)
      change_color(system_color)
      draw_text(x, y + line_height * 0, 180, line_height, Vocab::ExpTotal)
      draw_text(x, y + line_height * 2, 180, line_height, s_next)
      change_color(normal_color)
      draw_text(x, y + line_height * 1, 180, line_height, s1, 2)
      draw_text(x, y + line_height * 3, 180, line_height, s2, 2)
    end
    #--------------------------------------------------------------------------
    # * Draw Equipment
    #--------------------------------------------------------------------------
    def draw_equipments(x, y)
      @actor.equips.each_with_index do |item, i|
        draw_item_name(item, x, y + line_height * i)
      end
    end
    #--------------------------------------------------------------------------
    # * Draw Description
    #--------------------------------------------------------------------------
    def draw_description(x, y)
      draw_text_ex(x, y, @actor.description)
    end
  end
  #==============================================================================
  # ** Window_SaveFile
  #------------------------------------------------------------------------------
  #  This window displays save files on the save and load screens.
  #==============================================================================

  class Window_SaveFile < Window_Base
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :selected                 # selected
    #--------------------------------------------------------------------------
    # * Object Initialization
    #     index : index of save files
    #--------------------------------------------------------------------------
    def initialize(height, index)
      super(0, index * height, Graphics.width, height)
      @file_index = index
      refresh
      @selected = false
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      change_color(normal_color)
      name = Vocab::File + " #{@file_index + 1}"
      draw_text(4, 0, 200, line_height, name)
      @name_width = text_size(name).width
      draw_party_characters(152, 58)
      draw_playtime(0, contents.height - line_height, contents.width - 4, 2)
    end
    #--------------------------------------------------------------------------
    # * Draw Party Characters
    #--------------------------------------------------------------------------
    def draw_party_characters(x, y)
      header = DataManager.load_header(@file_index)
      return unless header
      header[:characters].each_with_index do |data, i|
        draw_character(data[0], data[1], x + i * 48, y)
      end
    end
    #--------------------------------------------------------------------------
    # * Draw Play Time
    #--------------------------------------------------------------------------
    def draw_playtime(x, y, width, align)
      header = DataManager.load_header(@file_index)
      return unless header
      draw_text(x, y, width, line_height, header[:playtime_s], 2)
    end
    #--------------------------------------------------------------------------
    # * Set Selected
    #--------------------------------------------------------------------------
    def selected=(selected)
      @selected = selected
      update_cursor
    end
    #--------------------------------------------------------------------------
    # * Update Cursor
    #--------------------------------------------------------------------------
    def update_cursor
      if @selected
        cursor_rect.set(0, 0, @name_width + 8, line_height)
      else
        cursor_rect.empty
      end
    end
  end
  #==============================================================================
  # ** Window_ShopCommand
  #------------------------------------------------------------------------------
  #  This window is for selecting buy/sell on the shop screen.
  #==============================================================================

  class Window_ShopCommand < Window_HorzCommand
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(window_width, purchase_only)
      @window_width = window_width
      @purchase_only = purchase_only
      super(0, 0)
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      @window_width
    end
    #--------------------------------------------------------------------------
    # * Get Digit Count
    #--------------------------------------------------------------------------
    def col_max
      return 3
    end
    #--------------------------------------------------------------------------
    # * Create Command List
    #--------------------------------------------------------------------------
    def make_command_list
      add_command(Vocab::ShopBuy,    :buy)
      add_command(Vocab::ShopSell,   :sell,   !@purchase_only)
      add_command(Vocab::ShopCancel, :cancel)
    end
  end
  #==============================================================================
  # ** Window_ShopBuy
  #------------------------------------------------------------------------------
  #  This window displays a list of buyable goods on the shop screen.
  #==============================================================================

  class Window_ShopBuy < Window_Selectable
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :status_window            # Status window
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y, height, shop_goods)
      super(x, y, window_width, height)
      @shop_goods = shop_goods
      @money = 0
      refresh
      select(0)
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 304
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items
    #--------------------------------------------------------------------------
    def item_max
      @data ? @data.size : 1
    end
    #--------------------------------------------------------------------------
    # * Get Item
    #--------------------------------------------------------------------------
    def item
      @data[index]
    end
    #--------------------------------------------------------------------------
    # * Set Party Gold
    #--------------------------------------------------------------------------
    def money=(money)
      @money = money
      refresh
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Selection Item
    #--------------------------------------------------------------------------
    def current_item_enabled?
      enable?(@data[index])
    end
    #--------------------------------------------------------------------------
    # * Get Price of Item
    #--------------------------------------------------------------------------
    def price(item)
      @price[item]
    end
    #--------------------------------------------------------------------------
    # * Display in Enabled State?
    #--------------------------------------------------------------------------
    def enable?(item)
      item && price(item) <= @money && !$game_party.item_max?(item)
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      make_item_list
      create_contents
      draw_all_items
    end
    #--------------------------------------------------------------------------
    # * Create Item List
    #--------------------------------------------------------------------------
    def make_item_list
      @data = []
      @price = {}
      @shop_goods.each do |goods|
        case goods[0]
        when 0;  item = $data_items[goods[1]]
        when 1;  item = $data_weapons[goods[1]]
        when 2;  item = $data_armors[goods[1]]
        end
        if item
          @data.push(item)
          @price[item] = goods[2] == 0 ? item.price : goods[3]
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(index)
      item = @data[index]
      rect = item_rect(index)
      draw_item_name(item, rect.x, rect.y, enable?(item))
      rect.width -= 4
      draw_text(rect, price(item), 2)
    end
    #--------------------------------------------------------------------------
    # * Set Status Window
    #--------------------------------------------------------------------------
    def status_window=(status_window)
      @status_window = status_window
      call_update_help
    end
    #--------------------------------------------------------------------------
    # * Update Help Text
    #--------------------------------------------------------------------------
    def update_help
      @help_window.set_item(item) if @help_window
      @status_window.item = item if @status_window
    end
  end
  #==============================================================================
  # ** Window_ShopSell
  #------------------------------------------------------------------------------
  #  This window displays a list of items in possession for selling on the shop
  # screen.
  #==============================================================================

  class Window_ShopSell < Window_ItemList
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y, width, height)
      super(x, y, width, height)
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Selection Item
    #--------------------------------------------------------------------------
    def current_item_enabled?
      enable?(@data[index])
    end
    #--------------------------------------------------------------------------
    # * Display in Enabled State?
    #--------------------------------------------------------------------------
    def enable?(item)
      item && item.price > 0
    end
  end
  #==============================================================================
  # ** Window_ShopNumber
  #------------------------------------------------------------------------------
  #  This window is for inputting quantity of items to buy or sell on the shop
  # screen.
  #==============================================================================

  class Window_ShopNumber < Window_Selectable
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :number                   # quantity entered
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y, height)
      super(x, y, window_width, height)
      @item = nil
      @max = 1
      @price = 0
      @number = 1
      @currency_unit = Vocab::currency_unit
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 304
    end
    #--------------------------------------------------------------------------
    # * Set Item, Max Quantity, Price, and Currency Unit
    #--------------------------------------------------------------------------
    def set(item, max, price, currency_unit = nil)
      @item = item
      @max = max
      @price = price
      @currency_unit = currency_unit if currency_unit
      @number = 1
      refresh
    end
    #--------------------------------------------------------------------------
    # * Set Currency Unit
    #--------------------------------------------------------------------------
    def currency_unit=(currency_unit)
      @currency_unit = currency_unit
      refresh
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      draw_item_name(@item, 0, item_y)
      draw_number
      draw_total_price
    end
    #--------------------------------------------------------------------------
    # * Draw Quantity
    #--------------------------------------------------------------------------
    def draw_number
      change_color(normal_color)
      draw_text(cursor_x - 28, item_y, 22, line_height, "×")
      draw_text(cursor_x, item_y, cursor_width - 4, line_height, @number, 2)
    end
    #--------------------------------------------------------------------------
    # * Draw Total Price
    #--------------------------------------------------------------------------
    def draw_total_price
      width = contents_width - 8
      draw_currency_value(@price * @number, @currency_unit, 4, price_y, width)
    end
    #--------------------------------------------------------------------------
    # * Y Coordinate of Item Name Display Line
    #--------------------------------------------------------------------------
    def item_y
      contents_height / 2 - line_height * 3 / 2
    end
    #--------------------------------------------------------------------------
    # * Y Coordinate of Price Display Line
    #--------------------------------------------------------------------------
    def price_y
      contents_height / 2 + line_height / 2
    end
    #--------------------------------------------------------------------------
    # * Get Cursor Width
    #--------------------------------------------------------------------------
    def cursor_width
      figures * 10 + 12
    end
    #--------------------------------------------------------------------------
    # * Get X Coordinate of Cursor
    #--------------------------------------------------------------------------
    def cursor_x
      contents_width - cursor_width - 4
    end
    #--------------------------------------------------------------------------
    # * Get Maximum Number of Digits for Quantity Display
    #--------------------------------------------------------------------------
    def figures
      return 2
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      if active
        last_number = @number
        update_number
        if @number != last_number
          Sound.play_cursor
          refresh
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Update Quantity
    #--------------------------------------------------------------------------
    def update_number
      change_number(1)   if Input.repeat?(:RIGHT)
      change_number(-1)  if Input.repeat?(:LEFT)
      change_number(10)  if Input.repeat?(:UP)
      change_number(-10) if Input.repeat?(:DOWN)
    end
    #--------------------------------------------------------------------------
    # * Change Quantity
    #--------------------------------------------------------------------------
    def change_number(amount)
      @number = [[@number + amount, @max].min, 1].max
    end
    #--------------------------------------------------------------------------
    # * Update Cursor
    #--------------------------------------------------------------------------
    def update_cursor
      cursor_rect.set(cursor_x, item_y, cursor_width, line_height)
    end
  end
  #==============================================================================
  # ** Window_ShopStatus
  #------------------------------------------------------------------------------
  #  This window displays number of items in possession and the actor's
  # equipment on the shop screen.
  #==============================================================================

  class Window_ShopStatus < Window_Base
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y, width, height)
      super(x, y, width, height)
      @item = nil
      @page_index = 0
      refresh
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      draw_possession(4, 0)
      draw_equip_info(4, line_height * 2) if @item.is_a?(RPG::EquipItem)
    end
    #--------------------------------------------------------------------------
    # * Set Item
    #--------------------------------------------------------------------------
    def item=(item)
      @item = item
      refresh
    end
    #--------------------------------------------------------------------------
    # * Draw Quantity Possessed
    #--------------------------------------------------------------------------
    def draw_possession(x, y)
      rect = Rect.new(x, y, contents.width - 4 - x, line_height)
      change_color(system_color)
      draw_text(rect, Vocab::Possession)
      change_color(normal_color)
      draw_text(rect, $game_party.item_number(@item), 2)
    end
    #--------------------------------------------------------------------------
    # * Draw Equipment Information
    #--------------------------------------------------------------------------
    def draw_equip_info(x, y)
      status_members.each_with_index do |actor, i|
        draw_actor_equip_info(x, y + line_height * (i * 2.4), actor)
      end
    end
    #--------------------------------------------------------------------------
    # * Array of Actors for Which to Draw Equipment Information
    #--------------------------------------------------------------------------
    def status_members
      $game_party.members[@page_index * page_size, page_size]
    end
    #--------------------------------------------------------------------------
    # * Number of Actors Displayable at Once
    #--------------------------------------------------------------------------
    def page_size
      return 4
    end
    #--------------------------------------------------------------------------
    # * Get Maximum Number of Pages
    #--------------------------------------------------------------------------
    def page_max
      ($game_party.members.size + page_size - 1) / page_size
    end
    #--------------------------------------------------------------------------
    # * Draw Actor Equipment Information
    #--------------------------------------------------------------------------
    def draw_actor_equip_info(x, y, actor)
      enabled = actor.equippable?(@item)
      change_color(normal_color, enabled)
      draw_text(x, y, 112, line_height, actor.name)
      item1 = current_equipped_item(actor, @item.etype_id)
      draw_actor_param_change(x, y, actor, item1) if enabled
      draw_item_name(item1, x, y + line_height, enabled)
    end
    #--------------------------------------------------------------------------
    # * Draw Actor Parameter Change
    #--------------------------------------------------------------------------
    def draw_actor_param_change(x, y, actor, item1)
      rect = Rect.new(x, y, contents.width - 4 - x, line_height)
      change = @item.params[param_id] - (item1 ? item1.params[param_id] : 0)
      change_color(param_change_color(change))
      draw_text(rect, sprintf("%+d", change), 2)
    end
    #--------------------------------------------------------------------------
    # * Get Parameter ID Corresponding to Selected Item
    #    By default, ATK if weapon and DEF if armor.
    #--------------------------------------------------------------------------
    def param_id
      @item.is_a?(RPG::Weapon) ? 2 : 3
    end
    #--------------------------------------------------------------------------
    # * Get Current Equipment
    #    Returns the weaker equipment if there is more than one of the same type,
    #    such as with dual wield.
    #--------------------------------------------------------------------------
    def current_equipped_item(actor, etype_id)
      list = []
      actor.equip_slots.each_with_index do |slot_etype_id, i|
        list.push(actor.equips[i]) if slot_etype_id == etype_id
      end
      list.min_by {|item| item ? item.params[param_id] : 0 }
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      update_page
    end
    #--------------------------------------------------------------------------
    # * Update Page
    #--------------------------------------------------------------------------
    def update_page
      if visible && Input.trigger?(:A) && page_max > 1
        @page_index = (@page_index + 1) % page_max
        refresh
      end
    end
  end
  #==============================================================================
  # ** Window_NameEdit
  #------------------------------------------------------------------------------
  #  This window is used to edit an actor's name on the name input screen.
  #==============================================================================

  class Window_NameEdit < Window_Base
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :name                     # name
    attr_reader   :index                    # cursor position
    attr_reader   :max_char                 # maximum number of characters
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(actor, max_char)
      x = (Graphics.width - 360) / 2
      y = (Graphics.height - (fitting_height(4) + fitting_height(9) + 8)) / 2
      super(x, y, 360, fitting_height(4))
      @actor = actor
      @max_char = max_char
      @default_name = @name = actor.name[0, @max_char]
      @index = @name.size
      deactivate
      refresh
    end
    #--------------------------------------------------------------------------
    # * Revert to Default Name
    #--------------------------------------------------------------------------
    def restore_default
      @name = @default_name
      @index = @name.size
      refresh
      return !@name.empty?
    end
    #--------------------------------------------------------------------------
    # * Add Text Character
    #     ch : character to add
    #--------------------------------------------------------------------------
    def add(ch)
      return false if @index >= @max_char
      @name += ch
      @index += 1
      refresh
      return true
    end
    #--------------------------------------------------------------------------
    # * Go Back One Character
    #--------------------------------------------------------------------------
    def back
      return false if @index == 0
      @index -= 1
      @name = @name[0, @index]
      refresh
      return true
    end
    #--------------------------------------------------------------------------
    # * Get Width of Face Graphic
    #--------------------------------------------------------------------------
    def face_width
      return 96
    end
    #--------------------------------------------------------------------------
    # * Get Character Width
    #--------------------------------------------------------------------------
    def char_width
      text_size($game_system.japanese? ? "あ" : "A").width
    end
    #--------------------------------------------------------------------------
    # * Get Coordinates of Left Side for Drawing Name
    #--------------------------------------------------------------------------
    def left
      name_center = (contents_width + face_width) / 2
      name_width = (@max_char + 1) * char_width
      return [name_center - name_width / 2, contents_width - name_width].min
    end
    #--------------------------------------------------------------------------
    # * Get Rectangle for Displaying Item
    #--------------------------------------------------------------------------
    def item_rect(index)
      Rect.new(left + index * char_width, 36, char_width, line_height)
    end
    #--------------------------------------------------------------------------
    # * Get Underline Rectangle
    #--------------------------------------------------------------------------
    def underline_rect(index)
      rect = item_rect(index)
      rect.x += 1
      rect.y += rect.height - 4
      rect.width -= 2
      rect.height = 2
      rect
    end
    #--------------------------------------------------------------------------
    # * Get Underline Color
    #--------------------------------------------------------------------------
    def underline_color
      color = normal_color
      color.alpha = 48
      color
    end
    #--------------------------------------------------------------------------
    # * Draw Underline
    #--------------------------------------------------------------------------
    def draw_underline(index)
      contents.fill_rect(underline_rect(index), underline_color)
    end
    #--------------------------------------------------------------------------
    # * Draw Text
    #--------------------------------------------------------------------------
    def draw_char(index)
      rect = item_rect(index)
      rect.x -= 1
      rect.width += 4
      change_color(normal_color)
      draw_text(rect, @name[index] || "")
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      draw_actor_face(@actor, 0, 0)
      @max_char.times {|i| draw_underline(i) }
      @name.size.times {|i| draw_char(i) }
      cursor_rect.set(item_rect(@index))
    end
  end
  #==============================================================================
  # ** Window_NameInput
  #------------------------------------------------------------------------------
  #  This window is used to select text characters on the name input screen.
  #==============================================================================

  class Window_NameInput < Window_Selectable
    #--------------------------------------------------------------------------
    # * Character Tables (Latin)
    #--------------------------------------------------------------------------
    LATIN1 = [ 'A','B','C','D','E',  'a','b','c','d','e',
               'F','G','H','I','J',  'f','g','h','i','j',
               'K','L','M','N','O',  'k','l','m','n','o',
               'P','Q','R','S','T',  'p','q','r','s','t',
               'U','V','W','X','Y',  'u','v','w','x','y',
               'Z','[',']','^','_',  'z','{','}','|','~',
               '0','1','2','3','4',  '!','#','$','%','&',
               '5','6','7','8','9',  '(',')','*','+','-',
               '/','=','@','<','>',  ':',';',' ','Page','OK']
    LATIN2 = [ 'Á','É','Í','Ó','Ú',  'á','é','í','ó','ú',
               'À','È','Ì','Ò','Ù',  'à','è','ì','ò','ù',
               'Â','Ê','Î','Ô','Û',  'â','ê','î','ô','û',
               'Ä','Ë','Ï','Ö','Ü',  'ä','ë','ï','ö','ü',
               'Ā','Ē','Ī','Ō','Ū',  'ā','ē','ī','ō','ū',
               'Ã','Å','Æ','Ç','Ð',  'ã','å','æ','ç','ð',
               'Ñ','Õ','Ø','Š','Ŵ',  'ñ','õ','ø','š','ŵ',
               'Ý','Ŷ','Ÿ','Ž','Þ',  'ý','ÿ','ŷ','ž','þ',
               'Ĳ','Œ','ĳ','œ','ß',  '«','»',' ','Page','OK']
    #--------------------------------------------------------------------------
    # * Character Tables (Japanese)
    #--------------------------------------------------------------------------
    JAPAN1 = [ 'あ','い','う','え','お',  'が','ぎ','ぐ','げ','ご',
               'か','き','く','け','こ',  'ざ','じ','ず','ぜ','ぞ',
               'さ','し','す','せ','そ',  'だ','ぢ','づ','で','ど',
               'た','ち','つ','て','と',  'ば','び','ぶ','べ','ぼ',
               'な','に','ぬ','ね','の',  'ぱ','ぴ','ぷ','ぺ','ぽ',
               'は','ひ','ふ','へ','ほ',  'ぁ','ぃ','ぅ','ぇ','ぉ',
               'ま','み','む','め','も',  'っ','ゃ','ゅ','ょ','ゎ',
               'や','ゆ','よ','わ','ん',  'ー','～','・','＝','☆',
               'ら','り','る','れ','ろ',  'ゔ','を','　','カナ','決定']
    JAPAN2 = [ 'ア','イ','ウ','エ','オ',  'ガ','ギ','グ','ゲ','ゴ',
               'カ','キ','ク','ケ','コ',  'ザ','ジ','ズ','ゼ','ゾ',
               'サ','シ','ス','セ','ソ',  'ダ','ヂ','ヅ','デ','ド',
               'タ','チ','ツ','テ','ト',  'バ','ビ','ブ','ベ','ボ',
               'ナ','ニ','ヌ','ネ','ノ',  'パ','ピ','プ','ペ','ポ',
               'ハ','ヒ','フ','ヘ','ホ',  'ァ','ィ','ゥ','ェ','ォ',
               'マ','ミ','ム','メ','モ',  'ッ','ャ','ュ','ョ','ヮ',
               'ヤ','ユ','ヨ','ワ','ン',  'ー','～','・','＝','☆',
               'ラ','リ','ル','レ','ロ',  'ヴ','ヲ','　','英数','決定']
    JAPAN3 = [ 'Ａ','Ｂ','Ｃ','Ｄ','Ｅ',  'ａ','ｂ','ｃ','ｄ','ｅ',
               'Ｆ','Ｇ','Ｈ','Ｉ','Ｊ',  'ｆ','ｇ','ｈ','ｉ','ｊ',
               'Ｋ','Ｌ','Ｍ','Ｎ','Ｏ',  'ｋ','ｌ','ｍ','ｎ','ｏ',
               'Ｐ','Ｑ','Ｒ','Ｓ','Ｔ',  'ｐ','ｑ','ｒ','ｓ','ｔ',
               'Ｕ','Ｖ','Ｗ','Ｘ','Ｙ',  'ｕ','ｖ','ｗ','ｘ','ｙ',
               'Ｚ','［','］','＾','＿',  'ｚ','｛','｝','｜','～',
               '０','１','２','３','４',  '！','＃','＄','％','＆',
               '５','６','７','８','９',  '（','）','＊','＋','－',
               '／','＝','＠','＜','＞',  '：','；','　','かな','決定']
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(edit_window)
      super(edit_window.x, edit_window.y + edit_window.height + 8,
            edit_window.width, fitting_height(9))
      @edit_window = edit_window
      @page = 0
      @index = 0
      refresh
      update_cursor
      activate
    end
    #--------------------------------------------------------------------------
    # * Get Text Table
    #--------------------------------------------------------------------------
    def table
      return [JAPAN1, JAPAN2, JAPAN3] if $game_system.japanese?
      return [LATIN1, LATIN2]
    end
    #--------------------------------------------------------------------------
    # * Get Text Character
    #--------------------------------------------------------------------------
    def character
      @index < 88 ? table[@page][@index] : ""
    end
    #--------------------------------------------------------------------------
    # * Determining if Page Changed and Cursor Location
    #--------------------------------------------------------------------------
    def is_page_change?
      @index == 88
    end
    #--------------------------------------------------------------------------
    # * Determine Cursor Location: Confirmation
    #--------------------------------------------------------------------------
    def is_ok?
      @index == 89
    end
    #--------------------------------------------------------------------------
    # * Get Rectangle for Displaying Item
    #--------------------------------------------------------------------------
    def item_rect(index)
      rect = Rect.new
      rect.x = index % 10 * 32 + index % 10 / 5 * 16
      rect.y = index / 10 * line_height
      rect.width = 32
      rect.height = line_height
      rect
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      change_color(normal_color)
      90.times {|i| draw_text(item_rect(i), table[@page][i], 1) }
    end
    #--------------------------------------------------------------------------
    # * Update Cursor
    #--------------------------------------------------------------------------
    def update_cursor
      cursor_rect.set(item_rect(@index))
    end
    #--------------------------------------------------------------------------
    # * Determine if Cursor is Moveable
    #--------------------------------------------------------------------------
    def cursor_movable?
      active
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Down
    #     wrap : Wraparound allowed
    #--------------------------------------------------------------------------
    def cursor_down(wrap)
      if @index < 80 or wrap
        @index = (index + 10) % 90
      end
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Up
    #     wrap : Wraparound allowed
    #--------------------------------------------------------------------------
    def cursor_up(wrap)
      if @index >= 10 or wrap
        @index = (index + 80) % 90
      end
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Right
    #     wrap : Wraparound allowed
    #--------------------------------------------------------------------------
    def cursor_right(wrap)
      if @index % 10 < 9
        @index += 1
      elsif wrap
        @index -= 9
      end
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Left
    #     wrap : Wraparound allowed
    #--------------------------------------------------------------------------
    def cursor_left(wrap)
      if @index % 10 > 0
        @index -= 1
      elsif wrap
        @index += 9
      end
    end
    #--------------------------------------------------------------------------
    # * Move to Next Page
    #--------------------------------------------------------------------------
    def cursor_pagedown
      @page = (@page + 1) % table.size
      refresh
    end
    #--------------------------------------------------------------------------
    # * Move to Previous Page
    #--------------------------------------------------------------------------
    def cursor_pageup
      @page = (@page + table.size - 1) % table.size
      refresh
    end
    #--------------------------------------------------------------------------
    # * Cursor Movement Processing
    #--------------------------------------------------------------------------
    def process_cursor_move
      last_page = @page
      super
      update_cursor
      Sound.play_cursor if @page != last_page
    end
    #--------------------------------------------------------------------------
    # * Handling Processing for OK and Cancel Etc.
    #--------------------------------------------------------------------------
    def process_handling
      return unless open? && active
      process_jump if Input.trigger?(:A)
      process_back if Input.repeat?(:B)
      process_ok   if Input.trigger?(:C)
    end
    #--------------------------------------------------------------------------
    # * Jump to OK
    #--------------------------------------------------------------------------
    def process_jump
      if @index != 89
        @index = 89
        Sound.play_cursor
      end
    end
    #--------------------------------------------------------------------------
    # * Go Back One Character
    #--------------------------------------------------------------------------
    def process_back
      Sound.play_cancel if @edit_window.back
    end
    #--------------------------------------------------------------------------
    # * Processing When OK Button Is Pressed
    #--------------------------------------------------------------------------
    def process_ok
      if !character.empty?
        on_name_add
      elsif is_page_change?
        Sound.play_ok
        cursor_pagedown
      elsif is_ok?
        on_name_ok
      end
    end
    #--------------------------------------------------------------------------
    # * Add Text to Name
    #--------------------------------------------------------------------------
    def on_name_add
      if @edit_window.add(character)
        Sound.play_ok
      else
        Sound.play_buzzer
      end
    end
    #--------------------------------------------------------------------------
    # * Decide Name
    #--------------------------------------------------------------------------
    def on_name_ok
      if @edit_window.name.empty?
        if @edit_window.restore_default
          Sound.play_ok
        else
          Sound.play_buzzer
        end
      else
        Sound.play_ok
        call_ok_handler
      end
    end
  end
  #==============================================================================
  # ** Window_ChoiceList
  #------------------------------------------------------------------------------
  #  This window is used for the event command [Show Choices].
  #==============================================================================

  class Window_ChoiceList < Window_Command
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(message_window)
      @message_window = message_window
      super(0, 0)
      self.openness = 0
      deactivate
    end
    #--------------------------------------------------------------------------
    # * Start Input Processing
    #--------------------------------------------------------------------------
    def start
      update_placement
      refresh
      select(0)
      open
      activate
    end
    #--------------------------------------------------------------------------
    # * Update Window Position
    #--------------------------------------------------------------------------
    def update_placement
      self.width = [max_choice_width + 12, 96].max + padding * 2
      self.width = [width, Graphics.width].min
      self.height = fitting_height($game_message.choices.size)
      self.x = Graphics.width - width
      if @message_window.y >= Graphics.height / 2
        self.y = @message_window.y - height
      else
        self.y = @message_window.y + @message_window.height
      end
    end
    #--------------------------------------------------------------------------
    # * Get Maximum Width of Choices
    #--------------------------------------------------------------------------
    def max_choice_width
      $game_message.choices.collect {|s| text_size(s).width }.max
    end
    #--------------------------------------------------------------------------
    # * Calculate Height of Window Contents
    #--------------------------------------------------------------------------
    def contents_height
      item_max * item_height
    end
    #--------------------------------------------------------------------------
    # * Create Command List
    #--------------------------------------------------------------------------
    def make_command_list
      $game_message.choices.each do |choice|
        add_command(choice, :choice)
      end
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(index)
      rect = item_rect_for_text(index)
      draw_text_ex(rect.x, rect.y, command_name(index))
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Cancel Processing
    #--------------------------------------------------------------------------
    def cancel_enabled?
      $game_message.choice_cancel_type > 0
    end
    #--------------------------------------------------------------------------
    # * Call OK Handler
    #--------------------------------------------------------------------------
    def call_ok_handler
      $game_message.choice_proc.call(index)
      close
    end
    #--------------------------------------------------------------------------
    # * Call Cancel Handler
    #--------------------------------------------------------------------------
    def call_cancel_handler
      $game_message.choice_proc.call($game_message.choice_cancel_type - 1)
      close
    end
  end
  #==============================================================================
  # ** Window_NumberInput
  #------------------------------------------------------------------------------
  #  This window is used for the event command [Input Number].
  #==============================================================================

  class Window_NumberInput < Window_Base
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(message_window)
      @message_window = message_window
      super(0, 0, 0, 0)
      @number = 0
      @digits_max = 1
      @index = 0
      self.openness = 0
      deactivate
    end
    #--------------------------------------------------------------------------
    # * Start Input Processing
    #--------------------------------------------------------------------------
    def start
      @digits_max = $game_message.num_input_digits_max
      @number = $game_variables[$game_message.num_input_variable_id]
      @number = [[@number, 0].max, 10 ** @digits_max - 1].min
      @index = 0
      update_placement
      create_contents
      refresh
      open
      activate
    end
    #--------------------------------------------------------------------------
    # * Update Window Position
    #--------------------------------------------------------------------------
    def update_placement
      self.width = @digits_max * 20 + padding * 2
      self.height = fitting_height(1)
      self.x = (Graphics.width - width) / 2
      if @message_window.y >= Graphics.height / 2
        self.y = @message_window.y - height - 8
      else
        self.y = @message_window.y + @message_window.height + 8
      end
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Right
    #     wrap : Wraparound allowed
    #--------------------------------------------------------------------------
    def cursor_right(wrap)
      if @index < @digits_max - 1 || wrap
        @index = (@index + 1) % @digits_max
      end
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Left
    #     wrap : Wraparound allowed
    #--------------------------------------------------------------------------
    def cursor_left(wrap)
      if @index > 0 || wrap
        @index = (@index + @digits_max - 1) % @digits_max
      end
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      process_cursor_move
      process_digit_change
      process_handling
      update_cursor
    end
    #--------------------------------------------------------------------------
    # * Cursor Movement Processing
    #--------------------------------------------------------------------------
    def process_cursor_move
      return unless active
      last_index = @index
      cursor_right(Input.trigger?(:RIGHT)) if Input.repeat?(:RIGHT)
      cursor_left (Input.trigger?(:LEFT))  if Input.repeat?(:LEFT)
      Sound.play_cursor if @index != last_index
    end
    #--------------------------------------------------------------------------
    # * Change Processing for Digits
    #--------------------------------------------------------------------------
    def process_digit_change
      return unless active
      if Input.repeat?(:UP) || Input.repeat?(:DOWN)
        Sound.play_cursor
        place = 10 ** (@digits_max - 1 - @index)
        n = @number / place % 10
        @number -= n * place
        n = (n + 1) % 10 if Input.repeat?(:UP)
        n = (n + 9) % 10 if Input.repeat?(:DOWN)
        @number += n * place
        refresh
      end
    end
    #--------------------------------------------------------------------------
    # * Handling Processing for OK and Cancel
    #--------------------------------------------------------------------------
    def process_handling
      return unless active
      return process_ok     if Input.trigger?(:C)
      return process_cancel if Input.trigger?(:B)
    end
    #--------------------------------------------------------------------------
    # * Processing When OK Button Is Pressed
    #--------------------------------------------------------------------------
    def process_ok
      Sound.play_ok
      $game_variables[$game_message.num_input_variable_id] = @number
      deactivate
      close
    end
    #--------------------------------------------------------------------------
    # * Processing When Cancel Button Is Pressed
    #--------------------------------------------------------------------------
    def process_cancel
    end
    #--------------------------------------------------------------------------
    # * Get Rectangle for Displaying Item
    #--------------------------------------------------------------------------
    def item_rect(index)
      Rect.new(index * 20, 0, 20, line_height)
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      change_color(normal_color)
      s = sprintf("%0*d", @digits_max, @number)
      @digits_max.times do |i|
        rect = item_rect(i)
        rect.x += 1
        draw_text(rect, s[i,1], 1)
      end
    end
    #--------------------------------------------------------------------------
    # * Update Cursor
    #--------------------------------------------------------------------------
    def update_cursor
      cursor_rect.set(item_rect(@index))
    end
  end
  #==============================================================================
  # ** Window_KeyItem
  #------------------------------------------------------------------------------
  #  This window is used for the event command [Select Item].
  #==============================================================================

  class Window_KeyItem < Window_ItemList
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(message_window)
      @message_window = message_window
      super(0, 0, Graphics.width, fitting_height(4))
      self.openness = 0
      deactivate
      set_handler(:ok,     method(:on_ok))
      set_handler(:cancel, method(:on_cancel))
    end
    #--------------------------------------------------------------------------
    # * Start Input Processing
    #--------------------------------------------------------------------------
    def start
      self.category = :key_item
      update_placement
      refresh
      select(0)
      open
      activate
    end
    #--------------------------------------------------------------------------
    # * Update Window Position
    #--------------------------------------------------------------------------
    def update_placement
      if @message_window.y >= Graphics.height / 2
        self.y = 0
      else
        self.y = Graphics.height - height
      end
    end
    #--------------------------------------------------------------------------
    # * Processing at OK
    #--------------------------------------------------------------------------
    def on_ok
      result = item ? item.id : 0
      $game_variables[$game_message.item_choice_variable_id] = result
      close
    end
    #--------------------------------------------------------------------------
    # * Processing at Cancel
    #--------------------------------------------------------------------------
    def on_cancel
      $game_variables[$game_message.item_choice_variable_id] = 0
      close
    end
  end
  #==============================================================================
  # ** Window_Message
  #------------------------------------------------------------------------------
  #  This message window is used to display text.
  #==============================================================================

  class Window_Message < Window_Base
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0, window_width, window_height)
      self.z = 200
      self.openness = 0
      create_all_windows
      create_back_bitmap
      create_back_sprite
      clear_instance_variables
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      Graphics.width
    end
    #--------------------------------------------------------------------------
    # * Get Window Height
    #--------------------------------------------------------------------------
    def window_height
      fitting_height(visible_line_number)
    end
    #--------------------------------------------------------------------------
    # * Clear Instance Variables
    #--------------------------------------------------------------------------
    def clear_instance_variables
      @fiber = nil                # Fiber
      @background = 0             # Background type
      @position = 2               # Display position
      clear_flags
    end
    #--------------------------------------------------------------------------
    # * Clear Flag
    #--------------------------------------------------------------------------
    def clear_flags
      @show_fast = false          # Fast forward flag
      @line_show_fast = false     # Fast forward by line flag
      @pause_skip = false         # Input standby omission flag
    end
    #--------------------------------------------------------------------------
    # * Get Number of Lines to Show
    #--------------------------------------------------------------------------
    def visible_line_number
      return 4
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      super
      dispose_all_windows
      dispose_back_bitmap
      dispose_back_sprite
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      update_all_windows
      update_back_sprite
      update_fiber
    end
    #--------------------------------------------------------------------------
    # * Update Fiber
    #--------------------------------------------------------------------------
    def update_fiber
      if @fiber
        @fiber.resume
      elsif $game_message.busy? && !$game_message.scroll_mode
        @fiber = Fiber.new { fiber_main }
        @fiber.resume
      else
        $game_message.visible = false
      end
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
      @item_window = Window_KeyItem.new(self)
    end
    #--------------------------------------------------------------------------
    # * Create Background Bitmap
    #--------------------------------------------------------------------------
    def create_back_bitmap
      @back_bitmap = Bitmap.new(width, height)
      rect1 = Rect.new(0, 0, width, 12)
      rect2 = Rect.new(0, 12, width, height - 24)
      rect3 = Rect.new(0, height - 12, width, 12)
      @back_bitmap.gradient_fill_rect(rect1, back_color2, back_color1, true)
      @back_bitmap.fill_rect(rect2, back_color1)
      @back_bitmap.gradient_fill_rect(rect3, back_color1, back_color2, true)
    end
    #--------------------------------------------------------------------------
    # * Get Background Color 1
    #--------------------------------------------------------------------------
    def back_color1
      Color.new(0, 0, 0, 160)
    end
    #--------------------------------------------------------------------------
    # * Get Background Color 2
    #--------------------------------------------------------------------------
    def back_color2
      Color.new(0, 0, 0, 0)
    end
    #--------------------------------------------------------------------------
    # * Create Background Sprite
    #--------------------------------------------------------------------------
    def create_back_sprite
      @back_sprite = Sprite.new
      @back_sprite.bitmap = @back_bitmap
      @back_sprite.visible = false
      @back_sprite.z = z - 1
    end
    #--------------------------------------------------------------------------
    # * Free All Windows
    #--------------------------------------------------------------------------
    def dispose_all_windows
      @gold_window.dispose
      @choice_window.dispose
      @number_window.dispose
      @item_window.dispose
    end
    #--------------------------------------------------------------------------
    # * Free Background Bitmap
    #--------------------------------------------------------------------------
    def dispose_back_bitmap
      @back_bitmap.dispose
    end
    #--------------------------------------------------------------------------
    # * Free Background Sprite
    #--------------------------------------------------------------------------
    def dispose_back_sprite
      @back_sprite.dispose
    end
    #--------------------------------------------------------------------------
    # * Update All Windows
    #--------------------------------------------------------------------------
    def update_all_windows
      @gold_window.update
      @choice_window.update
      @number_window.update
      @item_window.update
    end
    #--------------------------------------------------------------------------
    # * Update Background Sprite
    #--------------------------------------------------------------------------
    def update_back_sprite
      @back_sprite.visible = (@background == 1)
      @back_sprite.y = y
      @back_sprite.opacity = openness
      @back_sprite.update
    end
    #--------------------------------------------------------------------------
    # * Main Processing of Fiber
    #--------------------------------------------------------------------------
    def fiber_main
      $game_message.visible = true
      update_background
      update_placement
      loop do
        process_all_text if $game_message.has_text?
        process_input
        $game_message.clear
        @gold_window.close
        Fiber.yield
        break unless text_continue?
      end
      close_and_wait
      $game_message.visible = false
      @fiber = nil
    end
    #--------------------------------------------------------------------------
    # * Update Window Background
    #--------------------------------------------------------------------------
    def update_background
      @background = $game_message.background
      self.opacity = @background == 0 ? 255 : 0
    end
    #--------------------------------------------------------------------------
    # * Update Window Position
    #--------------------------------------------------------------------------
    def update_placement
      @position = $game_message.position
      self.y = @position * (Graphics.height - height) / 2
      @gold_window.y = y > 0 ? 0 : Graphics.height - @gold_window.height
    end
    #--------------------------------------------------------------------------
    # * Process All Text
    #--------------------------------------------------------------------------
    def process_all_text
      open_and_wait
      text = convert_escape_characters($game_message.all_text)
      pos = {}
      new_page(text, pos)
      process_character(text.slice!(0, 1), text, pos) until text.empty?
    end
    #--------------------------------------------------------------------------
    # * Input Processing
    #--------------------------------------------------------------------------
    def process_input
      if $game_message.choice?
        input_choice
      elsif $game_message.num_input?
        input_number
      elsif $game_message.item_choice?
        input_item
      else
        input_pause unless @pause_skip
      end
    end
    #--------------------------------------------------------------------------
    # * Open Window and Wait for It to Fully Open
    #--------------------------------------------------------------------------
    def open_and_wait
      open
      Fiber.yield until open?
    end
    #--------------------------------------------------------------------------
    # * Close Window and Wait for It to Fully Close
    #--------------------------------------------------------------------------
    def close_and_wait
      close
      Fiber.yield until all_close?
    end
    #--------------------------------------------------------------------------
    # * Determine if All Windows Are Fully Closed
    #--------------------------------------------------------------------------
    def all_close?
      close? && @choice_window.close? &&
        @number_window.close? && @item_window.close?
    end
    #--------------------------------------------------------------------------
    # * Determine Whether to Continue Displaying Text
    #--------------------------------------------------------------------------
    def text_continue?
      $game_message.has_text? && !settings_changed?
    end
    #--------------------------------------------------------------------------
    # * Determine if Background and Position Changed
    #--------------------------------------------------------------------------
    def settings_changed?
      @background != $game_message.background ||
        @position != $game_message.position
    end
    #--------------------------------------------------------------------------
    # * Wait
    #--------------------------------------------------------------------------
    def wait(duration)
      duration.times { Fiber.yield }
    end
    #--------------------------------------------------------------------------
    # * Update Fast Forward Flag
    #--------------------------------------------------------------------------
    def update_show_fast
      @show_fast = true if Input.trigger?(:C)
    end
    #--------------------------------------------------------------------------
    # * Wait After Output of One Character
    #--------------------------------------------------------------------------
    def wait_for_one_character
      update_show_fast
      Fiber.yield unless @show_fast || @line_show_fast
    end
    #--------------------------------------------------------------------------
    # * New Page
    #--------------------------------------------------------------------------
    def new_page(text, pos)
      contents.clear
      draw_face($game_message.face_name, $game_message.face_index, 0, 0)
      reset_font_settings
      pos[:x] = new_line_x
      pos[:y] = 0
      pos[:new_x] = new_line_x
      pos[:height] = calc_line_height(text)
      clear_flags
    end
    #--------------------------------------------------------------------------
    # * Get New Line Position
    #--------------------------------------------------------------------------
    def new_line_x
      $game_message.face_name.empty? ? 0 : 112
    end
    #--------------------------------------------------------------------------
    # * Normal Character Processing
    #--------------------------------------------------------------------------
    def process_normal_character(c, pos)
      super
      wait_for_one_character
    end
    #--------------------------------------------------------------------------
    # * New Line Character Processing
    #--------------------------------------------------------------------------
    def process_new_line(text, pos)
      @line_show_fast = false
      super
      if need_new_page?(text, pos)
        input_pause
        new_page(text, pos)
      end
    end
    #--------------------------------------------------------------------------
    # * Determine if New Page Is Needed
    #--------------------------------------------------------------------------
    def need_new_page?(text, pos)
      pos[:y] + pos[:height] > contents.height && !text.empty?
    end
    #--------------------------------------------------------------------------
    # * New Page Character Processing
    #--------------------------------------------------------------------------
    def process_new_page(text, pos)
      text.slice!(/^\n/)
      input_pause
      new_page(text, pos)
    end
    #--------------------------------------------------------------------------
    # * Icon Drawing Process by Control Characters
    #--------------------------------------------------------------------------
    def process_draw_icon(icon_index, pos)
      super
      wait_for_one_character
    end
    #--------------------------------------------------------------------------
    # * Control Character Processing
    #     code : the core of the control character
    #            e.g. "C" in the case of the control character \C[1].
    #     text : character string buffer in drawing processing (destructive)
    #     pos  : draw position {:x, :y, :new_x, :height}
    #--------------------------------------------------------------------------
    def process_escape_character(code, text, pos)
      case code.upcase
      when '$'
        @gold_window.open
      when '.'
        wait(15)
      when '|'
        wait(60)
      when '!'
        input_pause
      when '>'
        @line_show_fast = true
      when '<'
        @line_show_fast = false
      when '^'
        @pause_skip = true
      else
        super
      end
    end
    #--------------------------------------------------------------------------
    # * Input Pause Processing
    #--------------------------------------------------------------------------
    def input_pause
      self.pause = true
      wait(10)
      Fiber.yield until Input.trigger?(:B) || Input.trigger?(:C)
      Input.update
      self.pause = false
    end
    #--------------------------------------------------------------------------
    # * Choice Input Processing
    #--------------------------------------------------------------------------
    def input_choice
      @choice_window.start
      Fiber.yield while @choice_window.active
    end
    #--------------------------------------------------------------------------
    # * Number Input Processing
    #--------------------------------------------------------------------------
    def input_number
      @number_window.start
      Fiber.yield while @number_window.active
    end
    #--------------------------------------------------------------------------
    # * Item Selection Processing
    #--------------------------------------------------------------------------
    def input_item
      @item_window.start
      Fiber.yield while @item_window.active
    end
  end
  #==============================================================================
  # ** Window_ScrollText
  #------------------------------------------------------------------------------
  #  This window is for displaying scrolling text. No frame is displayed, but it
  # is handled as a window for convenience.
  #==============================================================================

  class Window_ScrollText < Window_Base
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0, Graphics.width, Graphics.height)
      self.opacity = 0
      self.arrows_visible = false
      hide
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      if $game_message.scroll_mode
        update_message if @text
        start_message if !@text && $game_message.has_text?
      end
    end
    #--------------------------------------------------------------------------
    # * Start Message
    #--------------------------------------------------------------------------
    def start_message
      @text = $game_message.all_text
      refresh
      show
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      reset_font_settings
      update_all_text_height
      create_contents
      draw_text_ex(4, 0, @text)
      self.oy = @scroll_pos = -height
    end
    #--------------------------------------------------------------------------
    # * Update Height Needed to Draw All Text
    #--------------------------------------------------------------------------
    def update_all_text_height
      @all_text_height = 1
      convert_escape_characters(@text).each_line do |line|
        @all_text_height += calc_line_height(line, false)
      end
      reset_font_settings
    end
    #--------------------------------------------------------------------------
    # * Calculate Height of Window Contents
    #--------------------------------------------------------------------------
    def contents_height
      @all_text_height ? @all_text_height : super
    end
    #--------------------------------------------------------------------------
    # * Update Message
    #--------------------------------------------------------------------------
    def update_message
      @scroll_pos += scroll_speed
      self.oy = @scroll_pos
      terminate_message if @scroll_pos >= contents.height
    end
    #--------------------------------------------------------------------------
    # * Get Scroll Speed
    #--------------------------------------------------------------------------
    def scroll_speed
      $game_message.scroll_speed * (show_fast? ? 1.0 : 0.5)
    end
    #--------------------------------------------------------------------------
    # * Determine if Fast Forward
    #--------------------------------------------------------------------------
    def show_fast?
      !$game_message.scroll_no_fast && (Input.press?(:A) || Input.press?(:C))
    end
    #--------------------------------------------------------------------------
    # * End Message
    #--------------------------------------------------------------------------
    def terminate_message
      @text = nil
      $game_message.clear
      hide
    end
  end
  #==============================================================================
  # ** Window_MapName
  #------------------------------------------------------------------------------
  #  This window displays the map name.
  #==============================================================================

  class Window_MapName < Window_Base
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0, window_width, fitting_height(1))
      self.opacity = 0
      self.contents_opacity = 0
      @show_count = 0
      refresh
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 240
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      if @show_count > 0 && $game_map.name_display
        update_fadein
        @show_count -= 1
      else
        update_fadeout
      end
    end
    #--------------------------------------------------------------------------
    # * Update Fadein
    #--------------------------------------------------------------------------
    def update_fadein
      self.contents_opacity += 16
    end
    #--------------------------------------------------------------------------
    # * Update Fadeout
    #--------------------------------------------------------------------------
    def update_fadeout
      self.contents_opacity -= 16
    end
    #--------------------------------------------------------------------------
    # * Open Window
    #--------------------------------------------------------------------------
    def open
      refresh
      @show_count = 150
      self.contents_opacity = 0
      self
    end
    #--------------------------------------------------------------------------
    # * Close Window
    #--------------------------------------------------------------------------
    def close
      @show_count = 0
      self
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      unless $game_map.display_name.empty?
        draw_background(contents.rect)
        draw_text(contents.rect, $game_map.display_name, 1)
      end
    end
    #--------------------------------------------------------------------------
    # * Draw Background
    #--------------------------------------------------------------------------
    def draw_background(rect)
      temp_rect = rect.clone
      temp_rect.width /= 2
      contents.gradient_fill_rect(temp_rect, back_color2, back_color1)
      temp_rect.x = temp_rect.width
      contents.gradient_fill_rect(temp_rect, back_color1, back_color2)
    end
    #--------------------------------------------------------------------------
    # * Get Background Color 1
    #--------------------------------------------------------------------------
    def back_color1
      Color.new(0, 0, 0, 192)
    end
    #--------------------------------------------------------------------------
    # * Get Background Color 2
    #--------------------------------------------------------------------------
    def back_color2
      Color.new(0, 0, 0, 0)
    end
  end
  #==============================================================================
  # ** Window_BattleLog
  #------------------------------------------------------------------------------
  #  This window is for displaying battle progress. No frame is displayed, but it
  # is handled as a window for convenience.
  #==============================================================================

  class Window_BattleLog < Window_Selectable
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0, window_width, window_height)
      self.z = 200
      self.opacity = 0
      @lines = []
      @num_wait = 0
      create_back_bitmap
      create_back_sprite
      refresh
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      super
      dispose_back_bitmap
      dispose_back_sprite
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      Graphics.width
    end
    #--------------------------------------------------------------------------
    # * Get Window Height
    #--------------------------------------------------------------------------
    def window_height
      fitting_height(max_line_number)
    end
    #--------------------------------------------------------------------------
    # * Get Maximum Number of Lines
    #--------------------------------------------------------------------------
    def max_line_number
      return 6
    end
    #--------------------------------------------------------------------------
    # * Create Background Bitmap
    #--------------------------------------------------------------------------
    def create_back_bitmap
      @back_bitmap = Bitmap.new(width, height)
    end
    #--------------------------------------------------------------------------
    # * Create Background Sprite
    #--------------------------------------------------------------------------
    def create_back_sprite
      @back_sprite = Sprite.new
      @back_sprite.bitmap = @back_bitmap
      @back_sprite.y = y
      @back_sprite.z = z - 1
    end
    #--------------------------------------------------------------------------
    # * Free Background Bitmap
    #--------------------------------------------------------------------------
    def dispose_back_bitmap
      @back_bitmap.dispose
    end
    #--------------------------------------------------------------------------
    # * Free Background Sprite
    #--------------------------------------------------------------------------
    def dispose_back_sprite
      @back_sprite.dispose
    end
    #--------------------------------------------------------------------------
    # * Clear
    #--------------------------------------------------------------------------
    def clear
      @num_wait = 0
      @lines.clear
      refresh
    end
    #--------------------------------------------------------------------------
    # * Get Number of Data Lines
    #--------------------------------------------------------------------------
    def line_number
      @lines.size
    end
    #--------------------------------------------------------------------------
    # * Go Back One Line
    #--------------------------------------------------------------------------
    def back_one
      @lines.pop
      refresh
    end
    #--------------------------------------------------------------------------
    # * Return to Designated Line
    #--------------------------------------------------------------------------
    def back_to(line_number)
      @lines.pop while @lines.size > line_number
      refresh
    end
    #--------------------------------------------------------------------------
    # * Add Text
    #--------------------------------------------------------------------------
    def add_text(text)
      @lines.push(text)
      refresh
    end
    #--------------------------------------------------------------------------
    # * Replace Text
    #    Replaces the last line with different text.
    #--------------------------------------------------------------------------
    def replace_text(text)
      @lines.pop
      @lines.push(text)
      refresh
    end
    #--------------------------------------------------------------------------
    # * Get Text From Last Line
    #--------------------------------------------------------------------------
    def last_text
      @lines[-1]
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      draw_background
      contents.clear
      @lines.size.times {|i| draw_line(i) }
    end
    #--------------------------------------------------------------------------
    # * Draw Background
    #--------------------------------------------------------------------------
    def draw_background
      @back_bitmap.clear
      @back_bitmap.fill_rect(back_rect, back_color)
    end
    #--------------------------------------------------------------------------
    # * Get Background Rectangle
    #--------------------------------------------------------------------------
    def back_rect
      Rect.new(0, padding, width, line_number * line_height)
    end
    #--------------------------------------------------------------------------
    # * Get Background Color
    #--------------------------------------------------------------------------
    def back_color
      Color.new(0, 0, 0, back_opacity)
    end
    #--------------------------------------------------------------------------
    # * Get Background Opacity
    #--------------------------------------------------------------------------
    def back_opacity
      return 64
    end
    #--------------------------------------------------------------------------
    # * Draw Line
    #--------------------------------------------------------------------------
    def draw_line(line_number)
      rect = item_rect_for_text(line_number)
      contents.clear_rect(rect)
      draw_text_ex(rect.x, rect.y, @lines[line_number])
    end
    #--------------------------------------------------------------------------
    # * Set Wait Method
    #--------------------------------------------------------------------------
    def method_wait=(method)
      @method_wait = method
    end
    #--------------------------------------------------------------------------
    # * Set Wait Method for Effect Execution
    #--------------------------------------------------------------------------
    def method_wait_for_effect=(method)
      @method_wait_for_effect = method
    end
    #--------------------------------------------------------------------------
    # * Wait
    #--------------------------------------------------------------------------
    def wait
      @num_wait += 1
      @method_wait.call(message_speed) if @method_wait
    end
    #--------------------------------------------------------------------------
    # * Wait Until Effect Execution Ends
    #--------------------------------------------------------------------------
    def wait_for_effect
      @method_wait_for_effect.call if @method_wait_for_effect
    end
    #--------------------------------------------------------------------------
    # * Get Message Speed
    #--------------------------------------------------------------------------
    def message_speed
      return 20
    end
    #--------------------------------------------------------------------------
    # * Wait and Clear
    #    Clear after inputing minimum necessary wait for the message to be read.
    #--------------------------------------------------------------------------
    def wait_and_clear
      wait while @num_wait < 2 if line_number > 0
      clear
    end
    #--------------------------------------------------------------------------
    # * Display Current State
    #--------------------------------------------------------------------------
    def display_current_state(subject)
      unless subject.most_important_state_text.empty?
        add_text(subject.name + subject.most_important_state_text)
        wait
      end
    end
    #--------------------------------------------------------------------------
    # * Display Skill/Item Use
    #--------------------------------------------------------------------------
    def display_use_item(subject, item)
      if item.is_a?(RPG::Skill)
        add_text(subject.name + item.message1)
        unless item.message2.empty?
          wait
          add_text(item.message2)
        end
      else
        add_text(sprintf(Vocab::UseItem, subject.name, item.name))
      end
    end
    #--------------------------------------------------------------------------
    # * Display Counterattack
    #--------------------------------------------------------------------------
    def display_counter(target, item)
      Sound.play_evasion
      add_text(sprintf(Vocab::CounterAttack, target.name))
      wait
      back_one
    end
    #--------------------------------------------------------------------------
    # * Display Reflection
    #--------------------------------------------------------------------------
    def display_reflection(target, item)
      Sound.play_reflection
      add_text(sprintf(Vocab::MagicReflection, target.name))
      wait
      back_one
    end
    #--------------------------------------------------------------------------
    # * Display Substitute
    #--------------------------------------------------------------------------
    def display_substitute(substitute, target)
      add_text(sprintf(Vocab::Substitute, substitute.name, target.name))
      wait
      back_one
    end
    #--------------------------------------------------------------------------
    # * Display Action Results
    #--------------------------------------------------------------------------
    def display_action_results(target, item)
      if target.result.used
        last_line_number = line_number
        display_critical(target, item)
        display_damage(target, item)
        display_affected_status(target, item)
        display_failure(target, item)
        wait if line_number > last_line_number
        back_to(last_line_number)
      end
    end
    #--------------------------------------------------------------------------
    # * Display Failure
    #--------------------------------------------------------------------------
    def display_failure(target, item)
      if target.result.hit? && !target.result.success
        add_text(sprintf(Vocab::ActionFailure, target.name))
        wait
      end
    end
    #--------------------------------------------------------------------------
    # * Display Critical Hit
    #--------------------------------------------------------------------------
    def display_critical(target, item)
      if target.result.critical
        text = target.actor? ? Vocab::CriticalToActor : Vocab::CriticalToEnemy
        add_text(text)
        wait
      end
    end
    #--------------------------------------------------------------------------
    # * Display Damage
    #--------------------------------------------------------------------------
    def display_damage(target, item)
      if target.result.missed
        display_miss(target, item)
      elsif target.result.evaded
        display_evasion(target, item)
      else
        display_hp_damage(target, item)
        display_mp_damage(target, item)
        display_tp_damage(target, item)
      end
    end
    #--------------------------------------------------------------------------
    # * Display Miss
    #--------------------------------------------------------------------------
    def display_miss(target, item)
      if !item || item.physical?
        fmt = target.actor? ? Vocab::ActorNoHit : Vocab::EnemyNoHit
        Sound.play_miss
      else
        fmt = Vocab::ActionFailure
      end
      add_text(sprintf(fmt, target.name))
      wait
    end
    #--------------------------------------------------------------------------
    # * Display Evasion
    #--------------------------------------------------------------------------
    def display_evasion(target, item)
      if !item || item.physical?
        fmt = Vocab::Evasion
        Sound.play_evasion
      else
        fmt = Vocab::MagicEvasion
        Sound.play_magic_evasion
      end
      add_text(sprintf(fmt, target.name))
      wait
    end
    #--------------------------------------------------------------------------
    # * Display HP Damage
    #--------------------------------------------------------------------------
    def display_hp_damage(target, item)
      return if target.result.hp_damage == 0 && item && !item.damage.to_hp?
      if target.result.hp_damage > 0 && target.result.hp_drain == 0
        target.perform_damage_effect
      end
      Sound.play_recovery if target.result.hp_damage < 0
      add_text(target.result.hp_damage_text)
      wait
    end
    #--------------------------------------------------------------------------
    # * Display MP Damage
    #--------------------------------------------------------------------------
    def display_mp_damage(target, item)
      return if target.dead? || target.result.mp_damage == 0
      Sound.play_recovery if target.result.mp_damage < 0
      add_text(target.result.mp_damage_text)
      wait
    end
    #--------------------------------------------------------------------------
    # * Display TP Damage
    #--------------------------------------------------------------------------
    def display_tp_damage(target, item)
      return if target.dead? || target.result.tp_damage == 0
      Sound.play_recovery if target.result.tp_damage < 0
      add_text(target.result.tp_damage_text)
      wait
    end
    #--------------------------------------------------------------------------
    # * Display Affected Status
    #--------------------------------------------------------------------------
    def display_affected_status(target, item)
      if target.result.status_affected?
        add_text("") if line_number < max_line_number
        display_changed_states(target)
        display_changed_buffs(target)
        back_one if last_text.empty?
      end
    end
    #--------------------------------------------------------------------------
    # * Display Automatically Affected Status
    #--------------------------------------------------------------------------
    def display_auto_affected_status(target)
      if target.result.status_affected?
        display_affected_status(target, nil)
        wait if line_number > 0
      end
    end
    #--------------------------------------------------------------------------
    # * Display Added/Removed State
    #--------------------------------------------------------------------------
    def display_changed_states(target)
      display_added_states(target)
      display_removed_states(target)
    end
    #--------------------------------------------------------------------------
    # * Display Added State
    #--------------------------------------------------------------------------
    def display_added_states(target)
      target.result.added_state_objects.each do |state|
        state_msg = target.actor? ? state.message1 : state.message2
        target.perform_collapse_effect if state.id == target.death_state_id
        next if state_msg.empty?
        replace_text(target.name + state_msg)
        wait
        wait_for_effect
      end
    end
    #--------------------------------------------------------------------------
    # * Display Removed State
    #--------------------------------------------------------------------------
    def display_removed_states(target)
      target.result.removed_state_objects.each do |state|
        next if state.message4.empty?
        replace_text(target.name + state.message4)
        wait
      end
    end
    #--------------------------------------------------------------------------
    # * Display Buff/Debuff
    #--------------------------------------------------------------------------
    def display_changed_buffs(target)
      display_buffs(target, target.result.added_buffs, Vocab::BuffAdd)
      display_buffs(target, target.result.added_debuffs, Vocab::DebuffAdd)
      display_buffs(target, target.result.removed_buffs, Vocab::BuffRemove)
    end
    #--------------------------------------------------------------------------
    # * Display Buff/Debuff (Individual)
    #--------------------------------------------------------------------------
    def display_buffs(target, buffs, fmt)
      buffs.each do |param_id|
        replace_text(sprintf(fmt, target.name, Vocab::param(param_id)))
        wait
      end
    end
  end
  #==============================================================================
  # ** Window_PartyCommand
  #------------------------------------------------------------------------------
  #  This window is used to select whether to fight or escape on the battle
  # screen.
  #==============================================================================

  class Window_PartyCommand < Window_Command
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0)
      self.openness = 0
      deactivate
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 128
    end
    #--------------------------------------------------------------------------
    # * Get Number of Lines to Show
    #--------------------------------------------------------------------------
    def visible_line_number
      return 4
    end
    #--------------------------------------------------------------------------
    # * Create Command List
    #--------------------------------------------------------------------------
    def make_command_list
      add_command(Vocab::fight,  :fight)
      add_command(Vocab::escape, :escape, BattleManager.can_escape?)
    end
    #--------------------------------------------------------------------------
    # * Setup
    #--------------------------------------------------------------------------
    def setup
      clear_command_list
      make_command_list
      refresh
      select(0)
      activate
      open
    end
  end
  #==============================================================================
  # ** Window_ActorCommand
  #------------------------------------------------------------------------------
  #  This window is for selecting an actor's action on the battle screen.
  #==============================================================================

  class Window_ActorCommand < Window_Command
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0)
      self.openness = 0
      deactivate
      @actor = nil
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 128
    end
    #--------------------------------------------------------------------------
    # * Get Number of Lines to Show
    #--------------------------------------------------------------------------
    def visible_line_number
      return 4
    end
    #--------------------------------------------------------------------------
    # * Create Command List
    #--------------------------------------------------------------------------
    def make_command_list
      return unless @actor
      add_attack_command
      add_skill_commands
      add_guard_command
      add_item_command
    end
    #--------------------------------------------------------------------------
    # * Add Attack Command to List
    #--------------------------------------------------------------------------
    def add_attack_command
      add_command(Vocab::attack, :attack, @actor.attack_usable?)
    end
    #--------------------------------------------------------------------------
    # * Add Skill Command to List
    #--------------------------------------------------------------------------
    def add_skill_commands
      @actor.added_skill_types.sort.each do |stype_id|
        name = $data_system.skill_types[stype_id]
        add_command(name, :skill, true, stype_id)
      end
    end
    #--------------------------------------------------------------------------
    # * Add Guard Command to List
    #--------------------------------------------------------------------------
    def add_guard_command
      add_command(Vocab::guard, :guard, @actor.guard_usable?)
    end
    #--------------------------------------------------------------------------
    # * Add Item Command to List
    #--------------------------------------------------------------------------
    def add_item_command
      add_command(Vocab::item, :item)
    end
    #--------------------------------------------------------------------------
    # * Setup
    #--------------------------------------------------------------------------
    def setup(actor)
      @actor = actor
      clear_command_list
      make_command_list
      refresh
      select(0)
      activate
      open
    end
  end
  #==============================================================================
  # ** Window_BattleStatus
  #------------------------------------------------------------------------------
  #  This window is for displaying the status of party members on the battle
  # screen.
  #==============================================================================

  class Window_BattleStatus < Window_Selectable
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0, window_width, window_height)
      refresh
      self.openness = 0
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      Graphics.width - 128
    end
    #--------------------------------------------------------------------------
    # * Get Window Height
    #--------------------------------------------------------------------------
    def window_height
      fitting_height(visible_line_number)
    end
    #--------------------------------------------------------------------------
    # * Get Number of Lines to Show
    #--------------------------------------------------------------------------
    def visible_line_number
      return 4
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items
    #--------------------------------------------------------------------------
    def item_max
      $game_party.battle_members.size
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      draw_all_items
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(index)
      actor = $game_party.battle_members[index]
      draw_basic_area(basic_area_rect(index), actor)
      draw_gauge_area(gauge_area_rect(index), actor)
    end
    #--------------------------------------------------------------------------
    # * Get Basic Area Retangle
    #--------------------------------------------------------------------------
    def basic_area_rect(index)
      rect = item_rect_for_text(index)
      rect.width -= gauge_area_width + 10
      rect
    end
    #--------------------------------------------------------------------------
    # * Get Gauge Area Rectangle
    #--------------------------------------------------------------------------
    def gauge_area_rect(index)
      rect = item_rect_for_text(index)
      rect.x += rect.width - gauge_area_width
      rect.width = gauge_area_width
      rect
    end
    #--------------------------------------------------------------------------
    # * Get Gauge Area Width
    #--------------------------------------------------------------------------
    def gauge_area_width
      return 220
    end
    #--------------------------------------------------------------------------
    # * Draw Basic Area
    #--------------------------------------------------------------------------
    def draw_basic_area(rect, actor)
      draw_actor_name(actor, rect.x + 0, rect.y, 100)
      draw_actor_icons(actor, rect.x + 104, rect.y, rect.width - 104)
    end
    #--------------------------------------------------------------------------
    # * Draw Gauge Area
    #--------------------------------------------------------------------------
    def draw_gauge_area(rect, actor)
      if $data_system.opt_display_tp
        draw_gauge_area_with_tp(rect, actor)
      else
        draw_gauge_area_without_tp(rect, actor)
      end
    end
    #--------------------------------------------------------------------------
    # * Draw Gauge Area (with TP)
    #--------------------------------------------------------------------------
    def draw_gauge_area_with_tp(rect, actor)
      draw_actor_hp(actor, rect.x + 0, rect.y, 72)
      draw_actor_mp(actor, rect.x + 82, rect.y, 64)
      draw_actor_tp(actor, rect.x + 156, rect.y, 64)
    end
    #--------------------------------------------------------------------------
    # * Draw Gauge Area (without TP)
    #--------------------------------------------------------------------------
    def draw_gauge_area_without_tp(rect, actor)
      draw_actor_hp(actor, rect.x + 0, rect.y, 134)
      draw_actor_mp(actor, rect.x + 144,  rect.y, 76)
    end
  end
  #==============================================================================
  # ** Window_BattleActor
  #------------------------------------------------------------------------------
  #  This window is for selecting an actor's action target on the battle screen.
  #==============================================================================

  class Window_BattleActor < Window_BattleStatus
    #--------------------------------------------------------------------------
    # * Object Initialization
    #     info_viewport : Viewport for displaying information
    #--------------------------------------------------------------------------
    def initialize(info_viewport)
      super()
      self.y = info_viewport.rect.y
      self.visible = false
      self.openness = 255
      @info_viewport = info_viewport
    end
    #--------------------------------------------------------------------------
    # * Show Window
    #--------------------------------------------------------------------------
    def show
      if @info_viewport
        width_remain = Graphics.width - width
        self.x = width_remain
        @info_viewport.rect.width = width_remain
        select(0)
      end
      super
    end
    #--------------------------------------------------------------------------
    # * Hide Window
    #--------------------------------------------------------------------------
    def hide
      @info_viewport.rect.width = Graphics.width if @info_viewport
      super
    end
  end
  #==============================================================================
  # ** Window_BattleEnemy
  #------------------------------------------------------------------------------
  #  Window for selecting the enemy who is the action target on the battle
  # screen.
  #==============================================================================

  class Window_BattleEnemy < Window_Selectable
    #--------------------------------------------------------------------------
    # * Object Initialization
    #     info_viewport : Viewport for displaying information
    #--------------------------------------------------------------------------
    def initialize(info_viewport)
      super(0, info_viewport.rect.y, window_width, fitting_height(4))
      refresh
      self.visible = false
      @info_viewport = info_viewport
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      Graphics.width - 128
    end
    #--------------------------------------------------------------------------
    # * Get Digit Count
    #--------------------------------------------------------------------------
    def col_max
      return 2
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items
    #--------------------------------------------------------------------------
    def item_max
      $game_troop.alive_members.size
    end
    #--------------------------------------------------------------------------
    # * Get Enemy Object
    #--------------------------------------------------------------------------
    def enemy
      $game_troop.alive_members[@index]
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(index)
      change_color(normal_color)
      name = $game_troop.alive_members[index].name
      draw_text(item_rect_for_text(index), name)
    end
    #--------------------------------------------------------------------------
    # * Show Window
    #--------------------------------------------------------------------------
    def show
      if @info_viewport
        width_remain = Graphics.width - width
        self.x = width_remain
        @info_viewport.rect.width = width_remain
        select(0)
      end
      super
    end
    #--------------------------------------------------------------------------
    # * Hide Window
    #--------------------------------------------------------------------------
    def hide
      @info_viewport.rect.width = Graphics.width if @info_viewport
      super
    end
  end
  #==============================================================================
  # ** Window_BattleSkill
  #------------------------------------------------------------------------------
  #  This window is for selecting skills to use in the battle window.
  #==============================================================================

  class Window_BattleSkill < Window_SkillList
    #--------------------------------------------------------------------------
    # * Object Initialization
    #     info_viewport : Viewport for displaying information
    #--------------------------------------------------------------------------
    def initialize(help_window, info_viewport)
      y = help_window.height
      super(0, y, Graphics.width, info_viewport.rect.y - y)
      self.visible = false
      @help_window = help_window
      @info_viewport = info_viewport
    end
    #--------------------------------------------------------------------------
    # * Show Window
    #--------------------------------------------------------------------------
    def show
      select_last
      @help_window.show
      super
    end
    #--------------------------------------------------------------------------
    # * Hide Window
    #--------------------------------------------------------------------------
    def hide
      @help_window.hide
      super
    end
  end
  #==============================================================================
  # ** Window_BattleItem
  #------------------------------------------------------------------------------
  #  This window is for selecting items to use in the battle window.
  #==============================================================================

  class Window_BattleItem < Window_ItemList
    #--------------------------------------------------------------------------
    # * Object Initialization
    #     info_viewport : Viewport for displaying information
    #--------------------------------------------------------------------------
    def initialize(help_window, info_viewport)
      y = help_window.height
      super(0, y, Graphics.width, info_viewport.rect.y - y)
      self.visible = false
      @help_window = help_window
      @info_viewport = info_viewport
    end
    #--------------------------------------------------------------------------
    # * Include in Item List?
    #--------------------------------------------------------------------------
    def include?(item)
      $game_party.usable?(item)
    end
    #--------------------------------------------------------------------------
    # * Show Window
    #--------------------------------------------------------------------------
    def show
      select_last
      @help_window.show
      super
    end
    #--------------------------------------------------------------------------
    # * Hide Window
    #--------------------------------------------------------------------------
    def hide
      @help_window.hide
      super
    end
  end
  #==============================================================================
  # ** Window_TitleCommand
  #------------------------------------------------------------------------------
  #  This window is for selecting New Game/Continue on the title screen.
  #==============================================================================

  class Window_TitleCommand < Window_Command
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0)
      update_placement
      select_symbol(:continue) if continue_enabled
      self.openness = 0
      open
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 160
    end
    #--------------------------------------------------------------------------
    # * Update Window Position
    #--------------------------------------------------------------------------
    def update_placement
      self.x = (Graphics.width - width) / 2
      self.y = (Graphics.height * 1.6 - height) / 2
    end
    #--------------------------------------------------------------------------
    # * Create Command List
    #--------------------------------------------------------------------------
    def make_command_list
      add_command(Vocab::new_game, :new_game)
      add_command(Vocab::continue, :continue, continue_enabled)
      add_command(Vocab::shutdown, :shutdown)
    end
    #--------------------------------------------------------------------------
    # * Get Activation State of Continue
    #--------------------------------------------------------------------------
    def continue_enabled
      DataManager.save_file_exists?
    end
  end
  #==============================================================================
  # ** Window_GameEnd
  #------------------------------------------------------------------------------
  #  This window is for selecting Go to Title/Shut Down on the game over screen.
  #==============================================================================

  class Window_GameEnd < Window_Command
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super(0, 0)
      update_placement
      self.openness = 0
      open
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 160
    end
    #--------------------------------------------------------------------------
    # * Update Window Position
    #--------------------------------------------------------------------------
    def update_placement
      self.x = (Graphics.width - width) / 2
      self.y = (Graphics.height - height) / 2
    end
    #--------------------------------------------------------------------------
    # * Create Command List
    #--------------------------------------------------------------------------
    def make_command_list
      add_command(Vocab::to_title, :to_title)
      add_command(Vocab::shutdown, :shutdown)
      add_command(Vocab::cancel,   :cancel)
    end
  end
  #==============================================================================
  # ** Window_DebugLeft
  #------------------------------------------------------------------------------
  #  This window designates switch and variable blocks on the debug screen.
  #==============================================================================

  class Window_DebugLeft < Window_Selectable
    #--------------------------------------------------------------------------
    # * Class Variable
    #--------------------------------------------------------------------------
    @@last_top_row = 0                      # For saving first line
    @@last_index   = 0                      # For saving cursor position
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :right_window             # Right window
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize(x, y)
      super(x, y, window_width, window_height)
      refresh
      self.top_row = @@last_top_row
      select(@@last_index)
      activate
    end
    #--------------------------------------------------------------------------
    # * Get Window Width
    #--------------------------------------------------------------------------
    def window_width
      return 164
    end
    #--------------------------------------------------------------------------
    # * Get Window Height
    #--------------------------------------------------------------------------
    def window_height
      Graphics.height
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items
    #--------------------------------------------------------------------------
    def item_max
      @item_max || 0
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      return unless @right_window
      @right_window.mode = mode
      @right_window.top_id = top_id
    end
    #--------------------------------------------------------------------------
    # * Get Mode
    #--------------------------------------------------------------------------
    def mode
      index < @switch_max ? :switch : :variable
    end
    #--------------------------------------------------------------------------
    # * Get ID Shown on Top
    #--------------------------------------------------------------------------
    def top_id
      (index - (index < @switch_max ? 0 : @switch_max)) * 10 + 1
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      @switch_max = ($data_system.switches.size - 1 + 9) / 10
      @variable_max = ($data_system.variables.size - 1 + 9) / 10
      @item_max = @switch_max + @variable_max
      create_contents
      draw_all_items
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(index)
      if index < @switch_max
        n = index * 10
        text = sprintf("S [%04d-%04d]", n+1, n+10)
      else
        n = (index - @switch_max) * 10
        text = sprintf("V [%04d-%04d]", n+1, n+10)
      end
      draw_text(item_rect_for_text(index), text)
    end
    #--------------------------------------------------------------------------
    # * Processing When Cancel Button Is Pressed
    #--------------------------------------------------------------------------
    def process_cancel
      super
      @@last_top_row = top_row
      @@last_index = index
    end
    #--------------------------------------------------------------------------
    # * Set Right Window
    #--------------------------------------------------------------------------
    def right_window=(right_window)
      @right_window = right_window
      update
    end
  end
  #==============================================================================
  # ** Window_DebugRight
  #------------------------------------------------------------------------------
  #  This window displays switches and variables separately on the debug screen.
  #==============================================================================

  class Window_DebugRight < Window_Selectable
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader   :mode                     # Mode (:switch / :variable)
    attr_reader   :top_id                   # ID shown on top
    #--------------------------------------------------------------------------
    # * Object Initialization
    #-------------------------------------------------------------------------
    def initialize(x, y, width)
      super(x, y, width, fitting_height(10))
      @mode = :switch
      @top_id = 1
      refresh
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items
    #--------------------------------------------------------------------------
    def item_max
      return 10
    end
    #--------------------------------------------------------------------------
    # * Refresh
    #--------------------------------------------------------------------------
    def refresh
      contents.clear
      draw_all_items
    end
    #--------------------------------------------------------------------------
    # * Draw Item
    #--------------------------------------------------------------------------
    def draw_item(index)
      data_id = @top_id + index
      id_text = sprintf("%04d:", data_id)
      id_width = text_size(id_text).width
      if @mode == :switch
        name = $data_system.switches[data_id]
        status = $game_switches[data_id] ? "[ON]" : "[OFF]"
      else
        name = $data_system.variables[data_id]
        status = $game_variables[data_id]
      end
      name = "" unless name
      rect = item_rect_for_text(index)
      change_color(normal_color)
      draw_text(rect, id_text)
      rect.x += id_width
      rect.width -= id_width + 60
      draw_text(rect, name)
      rect.width += 60
      draw_text(rect, status, 2)
    end
    #--------------------------------------------------------------------------
    # * Set Mode
    #     mode : New mode
    #--------------------------------------------------------------------------
    def mode=(mode)
      if @mode != mode
        @mode = mode
        refresh
      end
    end
    #--------------------------------------------------------------------------
    # * Set ID Shown on Top
    #     id : new ID
    #--------------------------------------------------------------------------
    def top_id=(id)
      if @top_id != id
        @top_id = id
        refresh
      end
    end
    #--------------------------------------------------------------------------
    # * Get Currently Selected ID
    #--------------------------------------------------------------------------
    def current_id
      top_id + index
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      update_switch_mode   if active && mode == :switch
      update_variable_mode if active && mode == :variable
    end
    #--------------------------------------------------------------------------
    # * Update During Switch Mode
    #--------------------------------------------------------------------------
    def update_switch_mode
      if Input.trigger?(:C)
        Sound.play_ok
        $game_switches[current_id] = !$game_switches[current_id]
        redraw_current_item
      end
    end
    #--------------------------------------------------------------------------
    # * Update During Variable Mode
    #--------------------------------------------------------------------------
    def update_variable_mode
      return unless $game_variables[current_id].is_a?(Numeric)
      value = $game_variables[current_id]
      value += 1 if Input.repeat?(:RIGHT)
      value -= 1 if Input.repeat?(:LEFT)
      value += 10 if Input.repeat?(:R)
      value -= 10 if Input.repeat?(:L)
      if $game_variables[current_id] != value
        $game_variables[current_id] = value
        Sound.play_cursor
        redraw_current_item
      end
    end
  end
  #==============================================================================
  # ** Scene_Base
  #------------------------------------------------------------------------------
  #  This is a super class of all scenes within the game.
  #==============================================================================

  class Scene_Base
    #--------------------------------------------------------------------------
    # * Main
    #--------------------------------------------------------------------------
    def main
      start
      post_start
      update until scene_changing?
      pre_terminate
      terminate
    end
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      create_main_viewport
    end
    #--------------------------------------------------------------------------
    # * Post-Start Processing
    #--------------------------------------------------------------------------
    def post_start
      perform_transition
      Input.update
    end
    #--------------------------------------------------------------------------
    # * Determine if Scene Is Changing
    #--------------------------------------------------------------------------
    def scene_changing?
      SceneManager.scene != self
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      update_basic
    end
    #--------------------------------------------------------------------------
    # * Update Frame (Basic)
    #--------------------------------------------------------------------------
    def update_basic
      Graphics.update
      Input.update
      update_all_windows
    end
    #--------------------------------------------------------------------------
    # * Pre-Termination Processing
    #--------------------------------------------------------------------------
    def pre_terminate
    end
    #--------------------------------------------------------------------------
    # * Termination Processing
    #--------------------------------------------------------------------------
    def terminate
      Graphics.freeze
      dispose_all_windows
      dispose_main_viewport
    end
    #--------------------------------------------------------------------------
    # * Execute Transition
    #--------------------------------------------------------------------------
    def perform_transition
      Graphics.transition(transition_speed)
    end
    #--------------------------------------------------------------------------
    # * Get Transition Speed
    #--------------------------------------------------------------------------
    def transition_speed
      return 10
    end
    #--------------------------------------------------------------------------
    # * Create Viewport
    #--------------------------------------------------------------------------
    def create_main_viewport
      @viewport = Viewport.new
      @viewport.z = 200
    end
    #--------------------------------------------------------------------------
    # * Free Viewport
    #--------------------------------------------------------------------------
    def dispose_main_viewport
      @viewport.dispose
    end
    #--------------------------------------------------------------------------
    # * Update All Windows
    #--------------------------------------------------------------------------
    def update_all_windows
      instance_variables.each do |varname|
        ivar = instance_variable_get(varname)
        ivar.update if ivar.is_a?(Window)
      end
    end
    #--------------------------------------------------------------------------
    # * Free All Windows
    #--------------------------------------------------------------------------
    def dispose_all_windows
      instance_variables.each do |varname|
        ivar = instance_variable_get(varname)
        ivar.dispose if ivar.is_a?(Window)
      end
    end
    #--------------------------------------------------------------------------
    # * Return to Calling Scene
    #--------------------------------------------------------------------------
    def return_scene
      SceneManager.return
    end
    #--------------------------------------------------------------------------
    # * Fade Out All Sounds and Graphics
    #--------------------------------------------------------------------------
    def fadeout_all(time = 1000)
      RPG::BGM.fade(time)
      RPG::BGS.fade(time)
      RPG::ME.fade(time)
      Graphics.fadeout(time * Graphics.frame_rate / 1000)
      RPG::BGM.stop
      RPG::BGS.stop
      RPG::ME.stop
    end
    #--------------------------------------------------------------------------
    # * Determine if Game Is Over
    #   Transition to the game over screen if the entire party is dead.
    #--------------------------------------------------------------------------
    def check_gameover
      SceneManager.goto(Scene_Gameover) if $game_party.all_dead?
    end
  end
  #==============================================================================
  # ** Scene_Title
  #------------------------------------------------------------------------------
  #  This class performs the title screen processing.
  #==============================================================================

  class Scene_Title < Scene_Base
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      SceneManager.clear
      Graphics.freeze
      create_background
      create_foreground
      create_command_window
      play_title_music
    end
    #--------------------------------------------------------------------------
    # * Get Transition Speed
    #--------------------------------------------------------------------------
    def transition_speed
      return 20
    end
    #--------------------------------------------------------------------------
    # * Termination Processing
    #--------------------------------------------------------------------------
    def terminate
      super
      SceneManager.snapshot_for_background
      dispose_background
      dispose_foreground
    end
    #--------------------------------------------------------------------------
    # * Create Background
    #--------------------------------------------------------------------------
    def create_background
      @sprite1 = Sprite.new
      @sprite1.bitmap = Cache.title1($data_system.title1_name)
      @sprite2 = Sprite.new
      @sprite2.bitmap = Cache.title2($data_system.title2_name)
      center_sprite(@sprite1)
      center_sprite(@sprite2)
    end
    #--------------------------------------------------------------------------
    # * Create Foreground
    #--------------------------------------------------------------------------
    def create_foreground
      @foreground_sprite = Sprite.new
      @foreground_sprite.bitmap = Bitmap.new(Graphics.width, Graphics.height)
      @foreground_sprite.z = 100
      draw_game_title if $data_system.opt_draw_title
    end
    #--------------------------------------------------------------------------
    # * Draw Game Title
    #--------------------------------------------------------------------------
    def draw_game_title
      @foreground_sprite.bitmap.font.size = 48
      rect = Rect.new(0, 0, Graphics.width, Graphics.height / 2)
      @foreground_sprite.bitmap.draw_text(rect, $data_system.game_title, 1)
    end
    #--------------------------------------------------------------------------
    # * Free Background
    #--------------------------------------------------------------------------
    def dispose_background
      @sprite1.bitmap.dispose
      @sprite1.dispose
      @sprite2.bitmap.dispose
      @sprite2.dispose
    end
    #--------------------------------------------------------------------------
    # * Free Foreground
    #--------------------------------------------------------------------------
    def dispose_foreground
      @foreground_sprite.bitmap.dispose
      @foreground_sprite.dispose
    end
    #--------------------------------------------------------------------------
    # * Move Sprite to Screen Center
    #--------------------------------------------------------------------------
    def center_sprite(sprite)
      sprite.ox = sprite.bitmap.width / 2
      sprite.oy = sprite.bitmap.height / 2
      sprite.x = Graphics.width / 2
      sprite.y = Graphics.height / 2
    end
    #--------------------------------------------------------------------------
    # * Create Command Window
    #--------------------------------------------------------------------------
    def create_command_window
      @command_window = Window_TitleCommand.new
      @command_window.set_handler(:new_game, method(:command_new_game))
      @command_window.set_handler(:continue, method(:command_continue))
      @command_window.set_handler(:shutdown, method(:command_shutdown))
    end
    #--------------------------------------------------------------------------
    # * Close Command Window
    #--------------------------------------------------------------------------
    def close_command_window
      @command_window.close
      update until @command_window.close?
    end
    #--------------------------------------------------------------------------
    # * [New Game] Command
    #--------------------------------------------------------------------------
    def command_new_game
      DataManager.setup_new_game
      close_command_window
      fadeout_all
      $game_map.autoplay
      SceneManager.goto(Scene_Map)
    end
    #--------------------------------------------------------------------------
    # * [Continue] Command
    #--------------------------------------------------------------------------
    def command_continue
      close_command_window
      SceneManager.call(Scene_Load)
    end
    #--------------------------------------------------------------------------
    # * [Shut Down] Command
    #--------------------------------------------------------------------------
    def command_shutdown
      close_command_window
      fadeout_all
      SceneManager.exit
    end
    #--------------------------------------------------------------------------
    # * Play Title Screen Music
    #--------------------------------------------------------------------------
    def play_title_music
      $data_system.title_bgm.play
      RPG::BGS.stop
      RPG::ME.stop
    end
  end
  #==============================================================================
  # ** Scene_Map
  #------------------------------------------------------------------------------
  #  This class performs the map screen processing.
  #==============================================================================

  class Scene_Map < Scene_Base
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      SceneManager.clear
      $game_player.straighten
      $game_map.refresh
      $game_message.visible = false
      create_spriteset
      create_all_windows
      @menu_calling = false
    end
    #--------------------------------------------------------------------------
    # * Execute Transition
    #    Performs a fade in when the screen has been blacked out, such as
    #    immediately after a battle or load.
    #--------------------------------------------------------------------------
    def perform_transition
      if Graphics.brightness == 0
        Graphics.transition(0)
        fadein(fadein_speed)
      else
        super
      end
    end
    #--------------------------------------------------------------------------
    # * Get Transition Speed
    #--------------------------------------------------------------------------
    def transition_speed
      return 15
    end
    #--------------------------------------------------------------------------
    # * Pre-Termination Processing
    #--------------------------------------------------------------------------
    def pre_terminate
      super
      pre_battle_scene if SceneManager.scene_is?(Scene_Battle)
      pre_title_scene  if SceneManager.scene_is?(Scene_Title)
    end
    #--------------------------------------------------------------------------
    # * Termination Processing
    #--------------------------------------------------------------------------
    def terminate
      super
      SceneManager.snapshot_for_background
      dispose_spriteset
      perform_battle_transition if SceneManager.scene_is?(Scene_Battle)
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      $game_map.update(true)
      $game_player.update
      $game_timer.update
      @spriteset.update
      update_scene if scene_change_ok?
    end
    #--------------------------------------------------------------------------
    # * Determine if Scene Transition Is Possible
    #--------------------------------------------------------------------------
    def scene_change_ok?
      !$game_message.busy? && !$game_message.visible
    end
    #--------------------------------------------------------------------------
    # * Update Scene Transition
    #--------------------------------------------------------------------------
    def update_scene
      check_gameover
      update_transfer_player unless scene_changing?
      update_encounter unless scene_changing?
      update_call_menu unless scene_changing?
      update_call_debug unless scene_changing?
    end
    #--------------------------------------------------------------------------
    # * Update Frame (for Fade In)
    #--------------------------------------------------------------------------
    def update_for_fade
      update_basic
      $game_map.update(false)
      @spriteset.update
    end
    #--------------------------------------------------------------------------
    # * General-Purpose Fade Processing
    #--------------------------------------------------------------------------
    def fade_loop(duration)
      duration.times do |i|
        yield 255 * (i + 1) / duration
        update_for_fade
      end
    end
    #--------------------------------------------------------------------------
    # * Fadein Screen
    #--------------------------------------------------------------------------
    def fadein(duration)
      fade_loop(duration) {|v| Graphics.brightness = v }
    end
    #--------------------------------------------------------------------------
    # * Fadeout Screen
    #--------------------------------------------------------------------------
    def fadeout(duration)
      fade_loop(duration) {|v| Graphics.brightness = 255 - v }
    end
    #--------------------------------------------------------------------------
    # * Screen Fade In (White)
    #--------------------------------------------------------------------------
    def white_fadein(duration)
      fade_loop(duration) {|v| @viewport.color.set(255, 255, 255, 255 - v) }
    end
    #--------------------------------------------------------------------------
    # * Screen Fade Out (White)
    #--------------------------------------------------------------------------
    def white_fadeout(duration)
      fade_loop(duration) {|v| @viewport.color.set(255, 255, 255, v) }
    end
    #--------------------------------------------------------------------------
    # * Create Sprite Set
    #--------------------------------------------------------------------------
    def create_spriteset
      @spriteset = Spriteset_Map.new
    end
    #--------------------------------------------------------------------------
    # * Free Sprite Set
    #--------------------------------------------------------------------------
    def dispose_spriteset
      @spriteset.dispose
    end
    #--------------------------------------------------------------------------
    # * Create All Windows
    #--------------------------------------------------------------------------
    def create_all_windows
      create_message_window
      create_scroll_text_window
      create_location_window
    end
    #--------------------------------------------------------------------------
    # * Create Message Window
    #--------------------------------------------------------------------------
    def create_message_window
      @message_window = Window_Message.new
    end
    #--------------------------------------------------------------------------
    # * Create Scrolling Text Window
    #--------------------------------------------------------------------------
    def create_scroll_text_window
      @scroll_text_window = Window_ScrollText.new
    end
    #--------------------------------------------------------------------------
    # * Create Map Name Window
    #--------------------------------------------------------------------------
    def create_location_window
      @map_name_window = Window_MapName.new
    end
    #--------------------------------------------------------------------------
    # * Update Player Transfer
    #--------------------------------------------------------------------------
    def update_transfer_player
      perform_transfer if $game_player.transfer?
    end
    #--------------------------------------------------------------------------
    # * Update Encounter
    #--------------------------------------------------------------------------
    def update_encounter
      SceneManager.call(Scene_Battle) if $game_player.encounter
    end
    #--------------------------------------------------------------------------
    # * Determine if Menu is Called due to Cancel Button
    #--------------------------------------------------------------------------
    def update_call_menu
      if $game_system.menu_disabled || $game_map.interpreter.running?
        @menu_calling = false
      else
        @menu_calling ||= Input.trigger?(:B)
        call_menu if @menu_calling && !$game_player.moving?
      end
    end
    #--------------------------------------------------------------------------
    # * Call Menu Screen
    #--------------------------------------------------------------------------
    def call_menu
      Sound.play_ok
      SceneManager.call(Scene_Menu)
      Window_MenuCommand::init_command_position
    end
    #--------------------------------------------------------------------------
    # * Determine if Debug Call by F9 key
    #--------------------------------------------------------------------------
    def update_call_debug
      SceneManager.call(Scene_Debug) if $TEST && Input.press?(:F9)
    end
    #--------------------------------------------------------------------------
    # * Player Transfer Processing
    #--------------------------------------------------------------------------
    def perform_transfer
      pre_transfer
      $game_player.perform_transfer
      post_transfer
    end
    #--------------------------------------------------------------------------
    # * Preprocessing for Transferring Player
    #--------------------------------------------------------------------------
    def pre_transfer
      @map_name_window.close
      case $game_temp.fade_type
      when 0
        fadeout(fadeout_speed)
      when 1
        white_fadeout(fadeout_speed)
      end
    end
    #--------------------------------------------------------------------------
    # * Post Processing for Transferring Player
    #--------------------------------------------------------------------------
    def post_transfer
      case $game_temp.fade_type
      when 0
        Graphics.wait(fadein_speed / 2)
        fadein(fadein_speed)
      when 1
        Graphics.wait(fadein_speed / 2)
        white_fadein(fadein_speed)
      end
      @map_name_window.open
    end
    #--------------------------------------------------------------------------
    # * Preprocessing for Battle Screen Transition
    #--------------------------------------------------------------------------
    def pre_battle_scene
      Graphics.update
      Graphics.freeze
      @spriteset.dispose_characters
      BattleManager.save_bgm_and_bgs
      BattleManager.play_battle_bgm
      Sound.play_battle_start
    end
    #--------------------------------------------------------------------------
    # * Preprocessing for Title Screen Transition
    #--------------------------------------------------------------------------
    def pre_title_scene
      fadeout(fadeout_speed_to_title)
    end
    #--------------------------------------------------------------------------
    # * Execute Pre-Battle Transition
    #--------------------------------------------------------------------------
    def perform_battle_transition
      Graphics.transition(60, "Graphics/System/BattleStart", 100)
      Graphics.freeze
    end
    #--------------------------------------------------------------------------
    # * Get Fade Out Speed
    #--------------------------------------------------------------------------
    def fadeout_speed
      return 30
    end
    #--------------------------------------------------------------------------
    # * Get Fade In Speed
    #--------------------------------------------------------------------------
    def fadein_speed
      return 30
    end
    #--------------------------------------------------------------------------
    # * Get Fade Out Speed for Title Screen Transition
    #--------------------------------------------------------------------------
    def fadeout_speed_to_title
      return 60
    end
  end
  #==============================================================================
  # ** Scene_MenuBase
  #------------------------------------------------------------------------------
  #  This class performs basic processing related to the menu screen.
  #==============================================================================

  class Scene_MenuBase < Scene_Base
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      create_background
      @actor = $game_party.menu_actor
    end
    #--------------------------------------------------------------------------
    # * Termination Processing
    #--------------------------------------------------------------------------
    def terminate
      super
      dispose_background
    end
    #--------------------------------------------------------------------------
    # * Create Background
    #--------------------------------------------------------------------------
    def create_background
      @background_sprite = Sprite.new
      @background_sprite.bitmap = SceneManager.background_bitmap
      @background_sprite.color.set(16, 16, 16, 128)
    end
    #--------------------------------------------------------------------------
    # * Free Background
    #--------------------------------------------------------------------------
    def dispose_background
      @background_sprite.dispose
    end
    #--------------------------------------------------------------------------
    # * Create Help Window
    #--------------------------------------------------------------------------
    def create_help_window
      @help_window = Window_Help.new
      @help_window.viewport = @viewport
    end
    #--------------------------------------------------------------------------
    # * Switch to Next Actor
    #--------------------------------------------------------------------------
    def next_actor
      @actor = $game_party.menu_actor_next
      on_actor_change
    end
    #--------------------------------------------------------------------------
    # * Switch to Previous Actor
    #--------------------------------------------------------------------------
    def prev_actor
      @actor = $game_party.menu_actor_prev
      on_actor_change
    end
    #--------------------------------------------------------------------------
    # * Change Actors
    #--------------------------------------------------------------------------
    def on_actor_change
    end
  end
  #==============================================================================
  # ** Scene_Menu
  #------------------------------------------------------------------------------
  #  This class performs the menu screen processing.
  #==============================================================================

  class Scene_Menu < Scene_MenuBase
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      create_command_window
      create_gold_window
      create_status_window
    end
    #--------------------------------------------------------------------------
    # * Create Command Window
    #--------------------------------------------------------------------------
    def create_command_window
      @command_window = Window_MenuCommand.new
      @command_window.set_handler(:item,      method(:command_item))
      @command_window.set_handler(:skill,     method(:command_personal))
      @command_window.set_handler(:equip,     method(:command_personal))
      @command_window.set_handler(:status,    method(:command_personal))
      @command_window.set_handler(:formation, method(:command_formation))
      @command_window.set_handler(:save,      method(:command_save))
      @command_window.set_handler(:game_end,  method(:command_game_end))
      @command_window.set_handler(:cancel,    method(:return_scene))
    end
    #--------------------------------------------------------------------------
    # * Create Gold Window
    #--------------------------------------------------------------------------
    def create_gold_window
      @gold_window = Window_Gold.new
      @gold_window.x = 0
      @gold_window.y = Graphics.height - @gold_window.height
    end
    #--------------------------------------------------------------------------
    # * Create Status Window
    #--------------------------------------------------------------------------
    def create_status_window
      @status_window = Window_MenuStatus.new(@command_window.width, 0)
    end
    #--------------------------------------------------------------------------
    # * [Item] Command
    #--------------------------------------------------------------------------
    def command_item
      SceneManager.call(Scene_Item)
    end
    #--------------------------------------------------------------------------
    # * [Skill], [Equipment] and [Status] Commands
    #--------------------------------------------------------------------------
    def command_personal
      @status_window.select_last
      @status_window.activate
      @status_window.set_handler(:ok,     method(:on_personal_ok))
      @status_window.set_handler(:cancel, method(:on_personal_cancel))
    end
    #--------------------------------------------------------------------------
    # * [Formation] Command
    #--------------------------------------------------------------------------
    def command_formation
      @status_window.select_last
      @status_window.activate
      @status_window.set_handler(:ok,     method(:on_formation_ok))
      @status_window.set_handler(:cancel, method(:on_formation_cancel))
    end
    #--------------------------------------------------------------------------
    # * [Save] Command
    #--------------------------------------------------------------------------
    def command_save
      SceneManager.call(Scene_Save)
    end
    #--------------------------------------------------------------------------
    # * [Exit Game] Command
    #--------------------------------------------------------------------------
    def command_game_end
      SceneManager.call(Scene_End)
    end
    #--------------------------------------------------------------------------
    # * [OK] Personal Command
    #--------------------------------------------------------------------------
    def on_personal_ok
      case @command_window.current_symbol
      when :skill
        SceneManager.call(Scene_Skill)
      when :equip
        SceneManager.call(Scene_Equip)
      when :status
        SceneManager.call(Scene_Status)
      end
    end
    #--------------------------------------------------------------------------
    # * [Cancel] Personal Command
    #--------------------------------------------------------------------------
    def on_personal_cancel
      @status_window.unselect
      @command_window.activate
    end
    #--------------------------------------------------------------------------
    # * Formation [OK]
    #--------------------------------------------------------------------------
    def on_formation_ok
      if @status_window.pending_index >= 0
        $game_party.swap_order(@status_window.index,
                               @status_window.pending_index)
        @status_window.pending_index = -1
        @status_window.redraw_item(@status_window.index)
      else
        @status_window.pending_index = @status_window.index
      end
      @status_window.activate
    end
    #--------------------------------------------------------------------------
    # * Formation [Cancel]
    #--------------------------------------------------------------------------
    def on_formation_cancel
      if @status_window.pending_index >= 0
        @status_window.pending_index = -1
        @status_window.activate
      else
        @status_window.unselect
        @command_window.activate
      end
    end
  end
  #==============================================================================
  # ** Scene_ItemBase
  #------------------------------------------------------------------------------
  #  This class performs common processing for the item screen and skill screen.
  #==============================================================================

  class Scene_ItemBase < Scene_MenuBase
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      create_actor_window
    end
    #--------------------------------------------------------------------------
    # * Create Actor Window
    #--------------------------------------------------------------------------
    def create_actor_window
      @actor_window = Window_MenuActor.new
      @actor_window.set_handler(:ok,     method(:on_actor_ok))
      @actor_window.set_handler(:cancel, method(:on_actor_cancel))
    end
    #--------------------------------------------------------------------------
    # * Get Currently Selected Item
    #--------------------------------------------------------------------------
    def item
      @item_window.item
    end
    #--------------------------------------------------------------------------
    # * Get Item's User
    #--------------------------------------------------------------------------
    def user
      $game_party.movable_members.max_by {|member| member.pha }
    end
    #--------------------------------------------------------------------------
    # * Determine if Cursor Is in Left Column
    #--------------------------------------------------------------------------
    def cursor_left?
      @item_window.index % 2 == 0
    end
    #--------------------------------------------------------------------------
    # * Show Subwindow
    #--------------------------------------------------------------------------
    def show_sub_window(window)
      width_remain = Graphics.width - window.width
      window.x = cursor_left? ? width_remain : 0
      @viewport.rect.x = @viewport.ox = cursor_left? ? 0 : window.width
      @viewport.rect.width = width_remain
      window.show.activate
    end
    #--------------------------------------------------------------------------
    # * Hide Subwindow
    #--------------------------------------------------------------------------
    def hide_sub_window(window)
      @viewport.rect.x = @viewport.ox = 0
      @viewport.rect.width = Graphics.width
      window.hide.deactivate
      activate_item_window
    end
    #--------------------------------------------------------------------------
    # * Actor [OK]
    #--------------------------------------------------------------------------
    def on_actor_ok
      if item_usable?
        use_item
      else
        Sound.play_buzzer
      end
    end
    #--------------------------------------------------------------------------
    # * Actor [Cancel]
    #--------------------------------------------------------------------------
    def on_actor_cancel
      hide_sub_window(@actor_window)
    end
    #--------------------------------------------------------------------------
    # * Confirm Item
    #--------------------------------------------------------------------------
    def determine_item
      if item.for_friend?
        show_sub_window(@actor_window)
        @actor_window.select_for_item(item)
      else
        use_item
        activate_item_window
      end
    end
    #--------------------------------------------------------------------------
    # * Activate Item Window
    #--------------------------------------------------------------------------
    def activate_item_window
      @item_window.refresh
      @item_window.activate
    end
    #--------------------------------------------------------------------------
    # * Get Array of Actors Targeted by Item Use
    #--------------------------------------------------------------------------
    def item_target_actors
      if !item.for_friend?
        []
      elsif item.for_all?
        $game_party.members
      else
        [$game_party.members[@actor_window.index]]
      end
    end
    #--------------------------------------------------------------------------
    # * Determine if Item is Usable
    #--------------------------------------------------------------------------
    def item_usable?
      user.usable?(item) && item_effects_valid?
    end
    #--------------------------------------------------------------------------
    # * Determine if Item Is Effective
    #--------------------------------------------------------------------------
    def item_effects_valid?
      item_target_actors.any? do |target|
        target.item_test(user, item)
      end
    end
    #--------------------------------------------------------------------------
    # * Use Item on Actor
    #--------------------------------------------------------------------------
    def use_item_to_actors
      item_target_actors.each do |target|
        item.repeats.times { target.item_apply(user, item) }
      end
    end
    #--------------------------------------------------------------------------
    # * Use Item
    #--------------------------------------------------------------------------
    def use_item
      play_se_for_item
      user.use_item(item)
      use_item_to_actors
      check_common_event
      check_gameover
      @actor_window.refresh
    end
    #--------------------------------------------------------------------------
    # * Determine if Common Event Is Reserved
    #    Transition to the map screen if the event call is reserved.
    #--------------------------------------------------------------------------
    def check_common_event
      SceneManager.goto(Scene_Map) if $game_temp.common_event_reserved?
    end
  end
  #==============================================================================
  # ** Scene_Item
  #------------------------------------------------------------------------------
  #  This class performs the item screen processing.
  #==============================================================================

  class Scene_Item < Scene_ItemBase
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      create_help_window
      create_category_window
      create_item_window
    end
    #--------------------------------------------------------------------------
    # * Create Category Window
    #--------------------------------------------------------------------------
    def create_category_window
      @category_window = Window_ItemCategory.new
      @category_window.viewport = @viewport
      @category_window.help_window = @help_window
      @category_window.y = @help_window.height
      @category_window.set_handler(:ok,     method(:on_category_ok))
      @category_window.set_handler(:cancel, method(:return_scene))
    end
    #--------------------------------------------------------------------------
    # * Create Item Window
    #--------------------------------------------------------------------------
    def create_item_window
      wy = @category_window.y + @category_window.height
      wh = Graphics.height - wy
      @item_window = Window_ItemList.new(0, wy, Graphics.width, wh)
      @item_window.viewport = @viewport
      @item_window.help_window = @help_window
      @item_window.set_handler(:ok,     method(:on_item_ok))
      @item_window.set_handler(:cancel, method(:on_item_cancel))
      @category_window.item_window = @item_window
    end
    #--------------------------------------------------------------------------
    # * Category [OK]
    #--------------------------------------------------------------------------
    def on_category_ok
      @item_window.activate
      @item_window.select_last
    end
    #--------------------------------------------------------------------------
    # * Item [OK]
    #--------------------------------------------------------------------------
    def on_item_ok
      $game_party.last_item.object = item
      determine_item
    end
    #--------------------------------------------------------------------------
    # * Item [Cancel]
    #--------------------------------------------------------------------------
    def on_item_cancel
      @item_window.unselect
      @category_window.activate
    end
    #--------------------------------------------------------------------------
    # * Play SE When Using Item
    #--------------------------------------------------------------------------
    def play_se_for_item
      Sound.play_use_item
    end
    #--------------------------------------------------------------------------
    # * Use Item
    #--------------------------------------------------------------------------
    def use_item
      super
      @item_window.redraw_current_item
    end
  end
  #==============================================================================
  # ** Scene_Skill
  #------------------------------------------------------------------------------
  #  This class performs skill screen processing. Skills are handled as items for
  # the sake of process sharing.
  #==============================================================================

  class Scene_Skill < Scene_ItemBase
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      create_help_window
      create_command_window
      create_status_window
      create_item_window
    end
    #--------------------------------------------------------------------------
    # * Create Command Window
    #--------------------------------------------------------------------------
    def create_command_window
      wy = @help_window.height
      @command_window = Window_SkillCommand.new(0, wy)
      @command_window.viewport = @viewport
      @command_window.help_window = @help_window
      @command_window.actor = @actor
      @command_window.set_handler(:skill,    method(:command_skill))
      @command_window.set_handler(:cancel,   method(:return_scene))
      @command_window.set_handler(:pagedown, method(:next_actor))
      @command_window.set_handler(:pageup,   method(:prev_actor))
    end
    #--------------------------------------------------------------------------
    # * Create Status Window
    #--------------------------------------------------------------------------
    def create_status_window
      y = @help_window.height
      @status_window = Window_SkillStatus.new(@command_window.width, y)
      @status_window.viewport = @viewport
      @status_window.actor = @actor
    end
    #--------------------------------------------------------------------------
    # * Create Item Window
    #--------------------------------------------------------------------------
    def create_item_window
      wx = 0
      wy = @status_window.y + @status_window.height
      ww = Graphics.width
      wh = Graphics.height - wy
      @item_window = Window_SkillList.new(wx, wy, ww, wh)
      @item_window.actor = @actor
      @item_window.viewport = @viewport
      @item_window.help_window = @help_window
      @item_window.set_handler(:ok,     method(:on_item_ok))
      @item_window.set_handler(:cancel, method(:on_item_cancel))
      @command_window.skill_window = @item_window
    end
    #--------------------------------------------------------------------------
    # * Get Skill's User
    #--------------------------------------------------------------------------
    def user
      @actor
    end
    #--------------------------------------------------------------------------
    # * [Skill] Command
    #--------------------------------------------------------------------------
    def command_skill
      @item_window.activate
      @item_window.select_last
    end
    #--------------------------------------------------------------------------
    # * Item [OK]
    #--------------------------------------------------------------------------
    def on_item_ok
      @actor.last_skill.object = item
      determine_item
    end
    #--------------------------------------------------------------------------
    # * Item [Cancel]
    #--------------------------------------------------------------------------
    def on_item_cancel
      @item_window.unselect
      @command_window.activate
    end
    #--------------------------------------------------------------------------
    # * Play SE When Using Item
    #--------------------------------------------------------------------------
    def play_se_for_item
      Sound.play_use_skill
    end
    #--------------------------------------------------------------------------
    # * Use Item
    #--------------------------------------------------------------------------
    def use_item
      super
      @status_window.refresh
      @item_window.refresh
    end
    #--------------------------------------------------------------------------
    # * Change Actors
    #--------------------------------------------------------------------------
    def on_actor_change
      @command_window.actor = @actor
      @status_window.actor = @actor
      @item_window.actor = @actor
      @command_window.activate
    end
  end
  #==============================================================================
  # ** Scene_Equip
  #------------------------------------------------------------------------------
  #  This class performs the equipment screen processing.
  #==============================================================================

  class Scene_Equip < Scene_MenuBase
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      create_help_window
      create_status_window
      create_command_window
      create_slot_window
      create_item_window
    end
    #--------------------------------------------------------------------------
    # * Create Status Window
    #--------------------------------------------------------------------------
    def create_status_window
      @status_window = Window_EquipStatus.new(0, @help_window.height)
      @status_window.viewport = @viewport
      @status_window.actor = @actor
    end
    #--------------------------------------------------------------------------
    # * Create Command Window
    #--------------------------------------------------------------------------
    def create_command_window
      wx = @status_window.width
      wy = @help_window.height
      ww = Graphics.width - @status_window.width
      @command_window = Window_EquipCommand.new(wx, wy, ww)
      @command_window.viewport = @viewport
      @command_window.help_window = @help_window
      @command_window.set_handler(:equip,    method(:command_equip))
      @command_window.set_handler(:optimize, method(:command_optimize))
      @command_window.set_handler(:clear,    method(:command_clear))
      @command_window.set_handler(:cancel,   method(:return_scene))
      @command_window.set_handler(:pagedown, method(:next_actor))
      @command_window.set_handler(:pageup,   method(:prev_actor))
    end
    #--------------------------------------------------------------------------
    # * Create Slot Window
    #--------------------------------------------------------------------------
    def create_slot_window
      wx = @status_window.width
      wy = @command_window.y + @command_window.height
      ww = Graphics.width - @status_window.width
      @slot_window = Window_EquipSlot.new(wx, wy, ww)
      @slot_window.viewport = @viewport
      @slot_window.help_window = @help_window
      @slot_window.status_window = @status_window
      @slot_window.actor = @actor
      @slot_window.set_handler(:ok,       method(:on_slot_ok))
      @slot_window.set_handler(:cancel,   method(:on_slot_cancel))
    end
    #--------------------------------------------------------------------------
    # * Create Item Window
    #--------------------------------------------------------------------------
    def create_item_window
      wx = 0
      wy = @slot_window.y + @slot_window.height
      ww = Graphics.width
      wh = Graphics.height - wy
      @item_window = Window_EquipItem.new(wx, wy, ww, wh)
      @item_window.viewport = @viewport
      @item_window.help_window = @help_window
      @item_window.status_window = @status_window
      @item_window.actor = @actor
      @item_window.set_handler(:ok,     method(:on_item_ok))
      @item_window.set_handler(:cancel, method(:on_item_cancel))
      @slot_window.item_window = @item_window
    end
    #--------------------------------------------------------------------------
    # * [Change Equipment] Command
    #--------------------------------------------------------------------------
    def command_equip
      @slot_window.activate
      @slot_window.select(0)
    end
    #--------------------------------------------------------------------------
    # * [Ultimate Equipment] Command
    #--------------------------------------------------------------------------
    def command_optimize
      Sound.play_equip
      @actor.optimize_equipments
      @status_window.refresh
      @slot_window.refresh
      @command_window.activate
    end
    #--------------------------------------------------------------------------
    # * [Remove All] Command
    #--------------------------------------------------------------------------
    def command_clear
      Sound.play_equip
      @actor.clear_equipments
      @status_window.refresh
      @slot_window.refresh
      @command_window.activate
    end
    #--------------------------------------------------------------------------
    # * Slot [OK]
    #--------------------------------------------------------------------------
    def on_slot_ok
      @item_window.activate
      @item_window.select(0)
    end
    #--------------------------------------------------------------------------
    # * Slot [Cancel]
    #--------------------------------------------------------------------------
    def on_slot_cancel
      @slot_window.unselect
      @command_window.activate
    end
    #--------------------------------------------------------------------------
    # * Item [OK]
    #--------------------------------------------------------------------------
    def on_item_ok
      Sound.play_equip
      @actor.change_equip(@slot_window.index, @item_window.item)
      @slot_window.activate
      @slot_window.refresh
      @item_window.unselect
      @item_window.refresh
    end
    #--------------------------------------------------------------------------
    # * Item [Cancel]
    #--------------------------------------------------------------------------
    def on_item_cancel
      @slot_window.activate
      @item_window.unselect
    end
    #--------------------------------------------------------------------------
    # * Change Actors
    #--------------------------------------------------------------------------
    def on_actor_change
      @status_window.actor = @actor
      @slot_window.actor = @actor
      @item_window.actor = @actor
      @command_window.activate
    end
  end
  #==============================================================================
  # ** Scene_Status
  #------------------------------------------------------------------------------
  #  This class performs the status screen processing.
  #==============================================================================

  class Scene_Status < Scene_MenuBase
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      @status_window = Window_Status.new(@actor)
      @status_window.set_handler(:cancel,   method(:return_scene))
      @status_window.set_handler(:pagedown, method(:next_actor))
      @status_window.set_handler(:pageup,   method(:prev_actor))
    end
    #--------------------------------------------------------------------------
    # * Change Actors
    #--------------------------------------------------------------------------
    def on_actor_change
      @status_window.actor = @actor
      @status_window.activate
    end
  end
  #==============================================================================
  # ** Scene_File
  #------------------------------------------------------------------------------
  #  This class performs common processing for the save screen and load screen.
  #==============================================================================

  class Scene_File < Scene_MenuBase
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      create_help_window
      create_savefile_viewport
      create_savefile_windows
      init_selection
    end
    #--------------------------------------------------------------------------
    # * Termination Processing
    #--------------------------------------------------------------------------
    def terminate
      super
      @savefile_viewport.dispose
      @savefile_windows.each {|window| window.dispose }
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      @savefile_windows.each {|window| window.update }
      update_savefile_selection
    end
    #--------------------------------------------------------------------------
    # * Create Help Window
    #--------------------------------------------------------------------------
    def create_help_window
      @help_window = Window_Help.new(1)
      @help_window.set_text(help_window_text)
    end
    #--------------------------------------------------------------------------
    # * Get Help Window Text
    #--------------------------------------------------------------------------
    def help_window_text
      return ""
    end
    #--------------------------------------------------------------------------
    # * Create Save File Viewport
    #--------------------------------------------------------------------------
    def create_savefile_viewport
      @savefile_viewport = Viewport.new
      @savefile_viewport.rect.y = @help_window.height
      @savefile_viewport.rect.height -= @help_window.height
    end
    #--------------------------------------------------------------------------
    # * Create Save File Window
    #--------------------------------------------------------------------------
    def create_savefile_windows
      @savefile_windows = Array.new(item_max) do |i|
        Window_SaveFile.new(savefile_height, i)
      end
      @savefile_windows.each {|window| window.viewport = @savefile_viewport }
    end
    #--------------------------------------------------------------------------
    # * Initialize Selection State
    #--------------------------------------------------------------------------
    def init_selection
      @index = first_savefile_index
      @savefile_windows[@index].selected = true
      self.top_index = @index - visible_max / 2
      ensure_cursor_visible
    end
    #--------------------------------------------------------------------------
    # * Get Number of Items
    #--------------------------------------------------------------------------
    def item_max
      DataManager.savefile_max
    end
    #--------------------------------------------------------------------------
    # * Get Number of Save Files to Show on Screen
    #--------------------------------------------------------------------------
    def visible_max
      return 4
    end
    #--------------------------------------------------------------------------
    # * Get Height of Save File Window
    #--------------------------------------------------------------------------
    def savefile_height
      @savefile_viewport.rect.height / visible_max
    end
    #--------------------------------------------------------------------------
    # * Get File Index to Select First
    #--------------------------------------------------------------------------
    def first_savefile_index
      return 0
    end
    #--------------------------------------------------------------------------
    # * Get Current Index
    #--------------------------------------------------------------------------
    def index
      @index
    end
    #--------------------------------------------------------------------------
    # * Get Top Index
    #--------------------------------------------------------------------------
    def top_index
      @savefile_viewport.oy / savefile_height
    end
    #--------------------------------------------------------------------------
    # * Set Top Index
    #--------------------------------------------------------------------------
    def top_index=(index)
      index = 0 if index < 0
      index = item_max - visible_max if index > item_max - visible_max
      @savefile_viewport.oy = index * savefile_height
    end
    #--------------------------------------------------------------------------
    # * Get Bottom Index
    #--------------------------------------------------------------------------
    def bottom_index
      top_index + visible_max - 1
    end
    #--------------------------------------------------------------------------
    # * Set Bottom Index
    #--------------------------------------------------------------------------
    def bottom_index=(index)
      self.top_index = index - (visible_max - 1)
    end
    #--------------------------------------------------------------------------
    # * Update Save File Selection
    #--------------------------------------------------------------------------
    def update_savefile_selection
      return on_savefile_ok     if Input.trigger?(:C)
      return on_savefile_cancel if Input.trigger?(:B)
      update_cursor
    end
    #--------------------------------------------------------------------------
    # * Save File [OK]
    #--------------------------------------------------------------------------
    def on_savefile_ok
    end
    #--------------------------------------------------------------------------
    # * Save File [Cancel]
    #--------------------------------------------------------------------------
    def on_savefile_cancel
      Sound.play_cancel
      return_scene
    end
    #--------------------------------------------------------------------------
    # * Update Cursor
    #--------------------------------------------------------------------------
    def update_cursor
      last_index = @index
      cursor_down (Input.trigger?(:DOWN))  if Input.repeat?(:DOWN)
      cursor_up   (Input.trigger?(:UP))    if Input.repeat?(:UP)
      cursor_pagedown   if Input.trigger?(:R)
      cursor_pageup     if Input.trigger?(:L)
      if @index != last_index
        Sound.play_cursor
        @savefile_windows[last_index].selected = false
        @savefile_windows[@index].selected = true
      end
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Down
    #--------------------------------------------------------------------------
    def cursor_down(wrap)
      @index = (@index + 1) % item_max if @index < item_max - 1 || wrap
      ensure_cursor_visible
    end
    #--------------------------------------------------------------------------
    # * Move Cursor Up
    #--------------------------------------------------------------------------
    def cursor_up(wrap)
      @index = (@index - 1 + item_max) % item_max if @index > 0 || wrap
      ensure_cursor_visible
    end
    #--------------------------------------------------------------------------
    # * Move Cursor One Page Down
    #--------------------------------------------------------------------------
    def cursor_pagedown
      if top_index + visible_max < item_max
        self.top_index += visible_max
        @index = [@index + visible_max, item_max - 1].min
      end
    end
    #--------------------------------------------------------------------------
    # * Move Cursor One Page Up
    #--------------------------------------------------------------------------
    def cursor_pageup
      if top_index > 0
        self.top_index -= visible_max
        @index = [@index - visible_max, 0].max
      end
    end
    #--------------------------------------------------------------------------
    # * Scroll Cursor to Position Within Screen
    #--------------------------------------------------------------------------
    def ensure_cursor_visible
      self.top_index = index if index < top_index
      self.bottom_index = index if index > bottom_index
    end
  end
  #==============================================================================
  # ** Scene_Save
  #------------------------------------------------------------------------------
  #  This class performs save screen processing.
  #==============================================================================

  class Scene_Save < Scene_File
    #--------------------------------------------------------------------------
    # * Get Help Window Text
    #--------------------------------------------------------------------------
    def help_window_text
      Vocab::SaveMessage
    end
    #--------------------------------------------------------------------------
    # * Get File Index to Select First
    #--------------------------------------------------------------------------
    def first_savefile_index
      DataManager.last_savefile_index
    end
    #--------------------------------------------------------------------------
    # * Confirm Save File
    #--------------------------------------------------------------------------
    def on_savefile_ok
      super
      if DataManager.save_game(@index)
        on_save_success
      else
        Sound.play_buzzer
      end
    end
    #--------------------------------------------------------------------------
    # * Processing When Save Is Successful
    #--------------------------------------------------------------------------
    def on_save_success
      Sound.play_save
      return_scene
    end
  end
  #==============================================================================
  # ** Scene_Load
  #------------------------------------------------------------------------------
  #  This class performs load screen processing.
  #==============================================================================

  class Scene_Load < Scene_File
    #--------------------------------------------------------------------------
    # * Get Help Window Text
    #--------------------------------------------------------------------------
    def help_window_text
      Vocab::LoadMessage
    end
    #--------------------------------------------------------------------------
    # * Get File Index to Select First
    #--------------------------------------------------------------------------
    def first_savefile_index
      DataManager.latest_savefile_index
    end
    #--------------------------------------------------------------------------
    # * Confirm Save File
    #--------------------------------------------------------------------------
    def on_savefile_ok
      super
      if DataManager.load_game(@index)
        on_load_success
      else
        Sound.play_buzzer
      end
    end
    #--------------------------------------------------------------------------
    # * Processing When Load Is Successful
    #--------------------------------------------------------------------------
    def on_load_success
      Sound.play_load
      fadeout_all
      $game_system.on_after_load
      SceneManager.goto(Scene_Map)
    end
  end
  #==============================================================================
  # ** Scene_End
  #------------------------------------------------------------------------------
  #  This class performs game over screen processing.
  #==============================================================================

  class Scene_End < Scene_MenuBase
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      create_command_window
    end
    #--------------------------------------------------------------------------
    # * Pre-Termination Processing
    #--------------------------------------------------------------------------
    def pre_terminate
      super
      close_command_window
    end
    #--------------------------------------------------------------------------
    # * Create Background
    #--------------------------------------------------------------------------
    def create_background
      super
      @background_sprite.tone.set(0, 0, 0, 128)
    end
    #--------------------------------------------------------------------------
    # * Create Command Window
    #--------------------------------------------------------------------------
    def create_command_window
      @command_window = Window_GameEnd.new
      @command_window.set_handler(:to_title, method(:command_to_title))
      @command_window.set_handler(:shutdown, method(:command_shutdown))
      @command_window.set_handler(:cancel,   method(:return_scene))
    end
    #--------------------------------------------------------------------------
    # * Close Command Window
    #--------------------------------------------------------------------------
    def close_command_window
      @command_window.close
      update until @command_window.close?
    end
    #--------------------------------------------------------------------------
    # * [Go to Title] Command
    #--------------------------------------------------------------------------
    def command_to_title
      close_command_window
      fadeout_all
      SceneManager.goto(Scene_Title)
    end
    #--------------------------------------------------------------------------
    # * [Shut Down] Command
    #--------------------------------------------------------------------------
    def command_shutdown
      close_command_window
      fadeout_all
      SceneManager.exit
    end
  end
  #==============================================================================
  # ** Scene_Shop
  #------------------------------------------------------------------------------
  #  This class performs shop screen processing.
  #==============================================================================

  class Scene_Shop < Scene_MenuBase
    #--------------------------------------------------------------------------
    # * Prepare
    #--------------------------------------------------------------------------
    def prepare(goods, purchase_only)
      @goods = goods
      @purchase_only = purchase_only
    end
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      create_help_window
      create_gold_window
      create_command_window
      create_dummy_window
      create_number_window
      create_status_window
      create_buy_window
      create_category_window
      create_sell_window
    end
    #--------------------------------------------------------------------------
    # * Create Gold Window
    #--------------------------------------------------------------------------
    def create_gold_window
      @gold_window = Window_Gold.new
      @gold_window.viewport = @viewport
      @gold_window.x = Graphics.width - @gold_window.width
      @gold_window.y = @help_window.height
    end
    #--------------------------------------------------------------------------
    # * Create Command Window
    #--------------------------------------------------------------------------
    def create_command_window
      @command_window = Window_ShopCommand.new(@gold_window.x, @purchase_only)
      @command_window.viewport = @viewport
      @command_window.y = @help_window.height
      @command_window.set_handler(:buy,    method(:command_buy))
      @command_window.set_handler(:sell,   method(:command_sell))
      @command_window.set_handler(:cancel, method(:return_scene))
    end
    #--------------------------------------------------------------------------
    # * Create Dummy Window
    #--------------------------------------------------------------------------
    def create_dummy_window
      wy = @command_window.y + @command_window.height
      wh = Graphics.height - wy
      @dummy_window = Window_Base.new(0, wy, Graphics.width, wh)
      @dummy_window.viewport = @viewport
    end
    #--------------------------------------------------------------------------
    # * Create Quantity Input Window
    #--------------------------------------------------------------------------
    def create_number_window
      wy = @dummy_window.y
      wh = @dummy_window.height
      @number_window = Window_ShopNumber.new(0, wy, wh)
      @number_window.viewport = @viewport
      @number_window.hide
      @number_window.set_handler(:ok,     method(:on_number_ok))
      @number_window.set_handler(:cancel, method(:on_number_cancel))
    end
    #--------------------------------------------------------------------------
    # * Create Status Window
    #--------------------------------------------------------------------------
    def create_status_window
      wx = @number_window.width
      wy = @dummy_window.y
      ww = Graphics.width - wx
      wh = @dummy_window.height
      @status_window = Window_ShopStatus.new(wx, wy, ww, wh)
      @status_window.viewport = @viewport
      @status_window.hide
    end
    #--------------------------------------------------------------------------
    # * Create Purchase Window
    #--------------------------------------------------------------------------
    def create_buy_window
      wy = @dummy_window.y
      wh = @dummy_window.height
      @buy_window = Window_ShopBuy.new(0, wy, wh, @goods)
      @buy_window.viewport = @viewport
      @buy_window.help_window = @help_window
      @buy_window.status_window = @status_window
      @buy_window.hide
      @buy_window.set_handler(:ok,     method(:on_buy_ok))
      @buy_window.set_handler(:cancel, method(:on_buy_cancel))
    end
    #--------------------------------------------------------------------------
    # * Create Category Window
    #--------------------------------------------------------------------------
    def create_category_window
      @category_window = Window_ItemCategory.new
      @category_window.viewport = @viewport
      @category_window.help_window = @help_window
      @category_window.y = @dummy_window.y
      @category_window.hide.deactivate
      @category_window.set_handler(:ok,     method(:on_category_ok))
      @category_window.set_handler(:cancel, method(:on_category_cancel))
    end
    #--------------------------------------------------------------------------
    # * Create Sell Window
    #--------------------------------------------------------------------------
    def create_sell_window
      wy = @category_window.y + @category_window.height
      wh = Graphics.height - wy
      @sell_window = Window_ShopSell.new(0, wy, Graphics.width, wh)
      @sell_window.viewport = @viewport
      @sell_window.help_window = @help_window
      @sell_window.hide
      @sell_window.set_handler(:ok,     method(:on_sell_ok))
      @sell_window.set_handler(:cancel, method(:on_sell_cancel))
      @category_window.item_window = @sell_window
    end
    #--------------------------------------------------------------------------
    # * Activate Purchase Window
    #--------------------------------------------------------------------------
    def activate_buy_window
      @buy_window.money = money
      @buy_window.show.activate
      @status_window.show
    end
    #--------------------------------------------------------------------------
    # * Activate Sell Window
    #--------------------------------------------------------------------------
    def activate_sell_window
      @category_window.show
      @sell_window.refresh
      @sell_window.show.activate
      @status_window.hide
    end
    #--------------------------------------------------------------------------
    # * [Buy] Command
    #--------------------------------------------------------------------------
    def command_buy
      @dummy_window.hide
      activate_buy_window
    end
    #--------------------------------------------------------------------------
    # * [Sell] Command
    #--------------------------------------------------------------------------
    def command_sell
      @dummy_window.hide
      @category_window.show.activate
      @sell_window.show
      @sell_window.unselect
      @sell_window.refresh
    end
    #--------------------------------------------------------------------------
    # * Buy [OK]
    #--------------------------------------------------------------------------
    def on_buy_ok
      @item = @buy_window.item
      @buy_window.hide
      @number_window.set(@item, max_buy, buying_price, currency_unit)
      @number_window.show.activate
    end
    #--------------------------------------------------------------------------
    # * Buy [Cancel]
    #--------------------------------------------------------------------------
    def on_buy_cancel
      @command_window.activate
      @dummy_window.show
      @buy_window.hide
      @status_window.hide
      @status_window.item = nil
      @help_window.clear
    end
    #--------------------------------------------------------------------------
    # * Category [OK]
    #--------------------------------------------------------------------------
    def on_category_ok
      activate_sell_window
      @sell_window.select(0)
    end
    #--------------------------------------------------------------------------
    # * Category [Cancel]
    #--------------------------------------------------------------------------
    def on_category_cancel
      @command_window.activate
      @dummy_window.show
      @category_window.hide
      @sell_window.hide
    end
    #--------------------------------------------------------------------------
    # * Sell [OK]
    #--------------------------------------------------------------------------
    def on_sell_ok
      @item = @sell_window.item
      @status_window.item = @item
      @category_window.hide
      @sell_window.hide
      @number_window.set(@item, max_sell, selling_price, currency_unit)
      @number_window.show.activate
      @status_window.show
    end
    #--------------------------------------------------------------------------
    # * Sell [Cancel]
    #--------------------------------------------------------------------------
    def on_sell_cancel
      @sell_window.unselect
      @category_window.activate
      @status_window.item = nil
      @help_window.clear
    end
    #--------------------------------------------------------------------------
    # * Quantity Input [OK]
    #--------------------------------------------------------------------------
    def on_number_ok
      Sound.play_shop
      case @command_window.current_symbol
      when :buy
        do_buy(@number_window.number)
      when :sell
        do_sell(@number_window.number)
      end
      end_number_input
      @gold_window.refresh
      @status_window.refresh
    end
    #--------------------------------------------------------------------------
    # * Quantity Input [Cancel]
    #--------------------------------------------------------------------------
    def on_number_cancel
      Sound.play_cancel
      end_number_input
    end
    #--------------------------------------------------------------------------
    # * Execute Purchase
    #--------------------------------------------------------------------------
    def do_buy(number)
      $game_party.lose_gold(number * buying_price)
      $game_party.gain_item(@item, number)
    end
    #--------------------------------------------------------------------------
    # * Execute Sale
    #--------------------------------------------------------------------------
    def do_sell(number)
      $game_party.gain_gold(number * selling_price)
      $game_party.lose_item(@item, number)
    end
    #--------------------------------------------------------------------------
    # * Exit Quantity Input
    #--------------------------------------------------------------------------
    def end_number_input
      @number_window.hide
      case @command_window.current_symbol
      when :buy
        activate_buy_window
      when :sell
        activate_sell_window
      end
    end
    #--------------------------------------------------------------------------
    # * Get Maximum Quantity Buyable
    #--------------------------------------------------------------------------
    def max_buy
      max = $game_party.max_item_number(@item) - $game_party.item_number(@item)
      buying_price == 0 ? max : [max, money / buying_price].min
    end
    #--------------------------------------------------------------------------
    # * Get Maximum Quantity Sellable
    #--------------------------------------------------------------------------
    def max_sell
      $game_party.item_number(@item)
    end
    #--------------------------------------------------------------------------
    # * Get Party Gold
    #--------------------------------------------------------------------------
    def money
      @gold_window.value
    end
    #--------------------------------------------------------------------------
    # Get Currency Unit
    #--------------------------------------------------------------------------
    def currency_unit
      @gold_window.currency_unit
    end
    #--------------------------------------------------------------------------
    # * Get Purchase Price
    #--------------------------------------------------------------------------
    def buying_price
      @buy_window.price(@item)
    end
    #--------------------------------------------------------------------------
    # * Get Sale Price
    #--------------------------------------------------------------------------
    def selling_price
      @item.price / 2
    end
  end
  #==============================================================================
  # ** Scene_Name
  #------------------------------------------------------------------------------
  #  This class performs name input screen processing.
  #==============================================================================

  class Scene_Name < Scene_MenuBase
    #--------------------------------------------------------------------------
    # * Prepare
    #--------------------------------------------------------------------------
    def prepare(actor_id, max_char)
      @actor_id = actor_id
      @max_char = max_char
    end
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      @actor = $game_actors[@actor_id]
      @edit_window = Window_NameEdit.new(@actor, @max_char)
      @input_window = Window_NameInput.new(@edit_window)
      @input_window.set_handler(:ok, method(:on_input_ok))
    end
    #--------------------------------------------------------------------------
    # * Input [OK]
    #--------------------------------------------------------------------------
    def on_input_ok
      @actor.name = @edit_window.name
      return_scene
    end
  end
  #==============================================================================
  # ** Scene_Debug
  #------------------------------------------------------------------------------
  #  This class performs debug screen processing.
  #==============================================================================

  class Scene_Debug < Scene_MenuBase
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      create_left_window
      create_right_window
      create_debug_help_window
    end
    #--------------------------------------------------------------------------
    # * Termination Processing
    #--------------------------------------------------------------------------
    def terminate
      super
      #$game_map.refresh
    end
    #--------------------------------------------------------------------------
    # * Create Left Window
    #--------------------------------------------------------------------------
    def create_left_window
      @left_window = Window_DebugLeft.new(0, 0)
      @left_window.set_handler(:ok,     method(:on_left_ok))
      @left_window.set_handler(:cancel, method(:return_scene))
    end
    #--------------------------------------------------------------------------
    # * Create Right Window
    #--------------------------------------------------------------------------
    def create_right_window
      wx = @left_window.width
      ww = Graphics.width - wx
      @right_window = Window_DebugRight.new(wx, 0, ww)
      @right_window.set_handler(:cancel, method(:on_right_cancel))
      @left_window.right_window = @right_window
    end
    #--------------------------------------------------------------------------
    # * Create Help Window
    #--------------------------------------------------------------------------
    def create_debug_help_window
      wx = @right_window.x
      wy = @right_window.height
      ww = @right_window.width
      wh = Graphics.height - wy
      @debug_help_window = Window_Base.new(wx, wy, ww, wh)
    end
    #--------------------------------------------------------------------------
    # * Left [OK]
    #--------------------------------------------------------------------------
    def on_left_ok
      refresh_help_window
      @right_window.activate
      @right_window.select(0)
    end
    #--------------------------------------------------------------------------
    # * Right [Cancel]
    #--------------------------------------------------------------------------
    def on_right_cancel
      @left_window.activate
      @right_window.unselect
      @debug_help_window.contents.clear
    end
    #--------------------------------------------------------------------------
    # * Refresh Help Window
    #--------------------------------------------------------------------------
    def refresh_help_window
      @debug_help_window.draw_text_ex(4, 0, help_text)
    end
    #--------------------------------------------------------------------------
    # * Get Help Text
    #--------------------------------------------------------------------------
    def help_text
      if @left_window.mode == :switch
        "C (Enter) : ON / OFF"
      else
        "← (Left)    :  -1\n" +
          "→ (Right)   :  +1\n" +
          "L (Pageup)   : -10\n" +
          "R (Pagedown) : +10"
      end
    end
  end
  #==============================================================================
  # ** Scene_Battle
  #------------------------------------------------------------------------------
  #  This class performs battle screen processing.
  #==============================================================================

  class Scene_Battle < Scene_Base
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      create_spriteset
      create_all_windows
      BattleManager.method_wait_for_message = method(:wait_for_message)
    end
    #--------------------------------------------------------------------------
    # * Post-Start Processing
    #--------------------------------------------------------------------------
    def post_start
      super
      battle_start
    end
    #--------------------------------------------------------------------------
    # * Pre-Termination Processing
    #--------------------------------------------------------------------------
    def pre_terminate
      super
      Graphics.fadeout(30) if SceneManager.scene_is?(Scene_Map)
      Graphics.fadeout(60) if SceneManager.scene_is?(Scene_Title)
    end
    #--------------------------------------------------------------------------
    # * Termination Processing
    #--------------------------------------------------------------------------
    def terminate
      super
      dispose_spriteset
      @info_viewport.dispose
      RPG::ME.stop
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      if BattleManager.in_turn?
        process_event
        process_action
      end
      BattleManager.judge_win_loss
    end
    #--------------------------------------------------------------------------
    # * Update Frame (Basic)
    #--------------------------------------------------------------------------
    def update_basic
      super
      $game_timer.update
      $game_troop.update
      @spriteset.update
      update_info_viewport
      update_message_open
    end
    #--------------------------------------------------------------------------
    # * Update Frame (for Wait)
    #--------------------------------------------------------------------------
    def update_for_wait
      update_basic
    end
    #--------------------------------------------------------------------------
    # * Wait
    #--------------------------------------------------------------------------
    def wait(duration)
      duration.times {|i| update_for_wait if i < duration / 2 || !show_fast? }
    end
    #--------------------------------------------------------------------------
    # * Determine if Fast Forward
    #--------------------------------------------------------------------------
    def show_fast?
      Input.press?(:A) || Input.press?(:C)
    end
    #--------------------------------------------------------------------------
    # * Wait (No Fast Forward)
    #--------------------------------------------------------------------------
    def abs_wait(duration)
      duration.times {|i| update_for_wait }
    end
    #--------------------------------------------------------------------------
    # * Short Wait (No Fast Forward)
    #--------------------------------------------------------------------------
    def abs_wait_short
      abs_wait(15)
    end
    #--------------------------------------------------------------------------
    # * Wait Until Message Display has Finished
    #--------------------------------------------------------------------------
    def wait_for_message
      @message_window.update
      update_for_wait while $game_message.visible
    end
    #--------------------------------------------------------------------------
    # * Wait Until Animation Display has Finished
    #--------------------------------------------------------------------------
    def wait_for_animation
      update_for_wait
      update_for_wait while @spriteset.animation?
    end
    #--------------------------------------------------------------------------
    # * Wait Until Effect Execution Ends
    #--------------------------------------------------------------------------
    def wait_for_effect
      update_for_wait
      update_for_wait while @spriteset.effect?
    end
    #--------------------------------------------------------------------------
    # * Update Information Display Viewport
    #--------------------------------------------------------------------------
    def update_info_viewport
      move_info_viewport(0)   if @party_command_window.active
      move_info_viewport(128) if @actor_command_window.active
      move_info_viewport(64)  if BattleManager.in_turn?
    end
    #--------------------------------------------------------------------------
    # * Move Information Display Viewport
    #--------------------------------------------------------------------------
    def move_info_viewport(ox)
      current_ox = @info_viewport.ox
      @info_viewport.ox = [ox, current_ox + 16].min if current_ox < ox
      @info_viewport.ox = [ox, current_ox - 16].max if current_ox > ox
    end
    #--------------------------------------------------------------------------
    # * Update Processing for Opening Message Window
    #    Set openness to 0 until the status window and so on are finished closing.
    #--------------------------------------------------------------------------
    def update_message_open
      if $game_message.busy? && !@status_window.close?
        @message_window.openness = 0
        @status_window.close
        @party_command_window.close
        @actor_command_window.close
      end
    end
    #--------------------------------------------------------------------------
    # * Create Sprite Set
    #--------------------------------------------------------------------------
    def create_spriteset
      @spriteset = Spriteset_Battle.new
    end
    #--------------------------------------------------------------------------
    # * Free Sprite Set
    #--------------------------------------------------------------------------
    def dispose_spriteset
      @spriteset.dispose
    end
    #--------------------------------------------------------------------------
    # * Create All Windows
    #--------------------------------------------------------------------------
    def create_all_windows
      create_message_window
      create_scroll_text_window
      create_log_window
      create_status_window
      create_info_viewport
      create_party_command_window
      create_actor_command_window
      create_help_window
      create_skill_window
      create_item_window
      create_actor_window
      create_enemy_window
    end
    #--------------------------------------------------------------------------
    # * Create Message Window
    #--------------------------------------------------------------------------
    def create_message_window
      @message_window = Window_Message.new
    end
    #--------------------------------------------------------------------------
    # * Create Scrolling Text Window
    #--------------------------------------------------------------------------
    def create_scroll_text_window
      @scroll_text_window = Window_ScrollText.new
    end
    #--------------------------------------------------------------------------
    # * Create Log Window
    #--------------------------------------------------------------------------
    def create_log_window
      @log_window = Window_BattleLog.new
      @log_window.method_wait = method(:wait)
      @log_window.method_wait_for_effect = method(:wait_for_effect)
    end
    #--------------------------------------------------------------------------
    # * Create Status Window
    #--------------------------------------------------------------------------
    def create_status_window
      @status_window = Window_BattleStatus.new
      @status_window.x = 128
    end
    #--------------------------------------------------------------------------
    # * Create Information Display Viewport
    #--------------------------------------------------------------------------
    def create_info_viewport
      @info_viewport = Viewport.new
      @info_viewport.rect.y = Graphics.height - @status_window.height
      @info_viewport.rect.height = @status_window.height
      @info_viewport.z = 100
      @info_viewport.ox = 64
      @status_window.viewport = @info_viewport
    end
    #--------------------------------------------------------------------------
    # * Create Party Commands Window
    #--------------------------------------------------------------------------
    def create_party_command_window
      @party_command_window = Window_PartyCommand.new
      @party_command_window.viewport = @info_viewport
      @party_command_window.set_handler(:fight,  method(:command_fight))
      @party_command_window.set_handler(:escape, method(:command_escape))
      @party_command_window.unselect
    end
    #--------------------------------------------------------------------------
    # * Create Actor Commands Window
    #--------------------------------------------------------------------------
    def create_actor_command_window
      @actor_command_window = Window_ActorCommand.new
      @actor_command_window.viewport = @info_viewport
      @actor_command_window.set_handler(:attack, method(:command_attack))
      @actor_command_window.set_handler(:skill,  method(:command_skill))
      @actor_command_window.set_handler(:guard,  method(:command_guard))
      @actor_command_window.set_handler(:item,   method(:command_item))
      @actor_command_window.set_handler(:cancel, method(:prior_command))
      @actor_command_window.x = Graphics.width
    end
    #--------------------------------------------------------------------------
    # * Create Help Window
    #--------------------------------------------------------------------------
    def create_help_window
      @help_window = Window_Help.new
      @help_window.visible = false
    end
    #--------------------------------------------------------------------------
    # * Create Skill Window
    #--------------------------------------------------------------------------
    def create_skill_window
      @skill_window = Window_BattleSkill.new(@help_window, @info_viewport)
      @skill_window.set_handler(:ok,     method(:on_skill_ok))
      @skill_window.set_handler(:cancel, method(:on_skill_cancel))
    end
    #--------------------------------------------------------------------------
    # * Create Item Window
    #--------------------------------------------------------------------------
    def create_item_window
      @item_window = Window_BattleItem.new(@help_window, @info_viewport)
      @item_window.set_handler(:ok,     method(:on_item_ok))
      @item_window.set_handler(:cancel, method(:on_item_cancel))
    end
    #--------------------------------------------------------------------------
    # * Create Actor Window
    #--------------------------------------------------------------------------
    def create_actor_window
      @actor_window = Window_BattleActor.new(@info_viewport)
      @actor_window.set_handler(:ok,     method(:on_actor_ok))
      @actor_window.set_handler(:cancel, method(:on_actor_cancel))
    end
    #--------------------------------------------------------------------------
    # * Create Enemy Window
    #--------------------------------------------------------------------------
    def create_enemy_window
      @enemy_window = Window_BattleEnemy.new(@info_viewport)
      @enemy_window.set_handler(:ok,     method(:on_enemy_ok))
      @enemy_window.set_handler(:cancel, method(:on_enemy_cancel))
    end
    #--------------------------------------------------------------------------
    # * Update Status Window Information
    #--------------------------------------------------------------------------
    def refresh_status
      @status_window.refresh
    end
    #--------------------------------------------------------------------------
    # * To Next Command Input
    #--------------------------------------------------------------------------
    def next_command
      if BattleManager.next_command
        start_actor_command_selection
      else
        turn_start
      end
    end
    #--------------------------------------------------------------------------
    # * To Previous Command Input
    #--------------------------------------------------------------------------
    def prior_command
      if BattleManager.prior_command
        start_actor_command_selection
      else
        start_party_command_selection
      end
    end
    #--------------------------------------------------------------------------
    # * Start Party Command Selection
    #--------------------------------------------------------------------------
    def start_party_command_selection
      unless scene_changing?
        refresh_status
        @status_window.unselect
        @status_window.open
        if BattleManager.input_start
          @actor_command_window.close
          @party_command_window.setup
        else
          @party_command_window.deactivate
          turn_start
        end
      end
    end
    #--------------------------------------------------------------------------
    # * [Fight] Command
    #--------------------------------------------------------------------------
    def command_fight
      next_command
    end
    #--------------------------------------------------------------------------
    # * [Escape] Command
    #--------------------------------------------------------------------------
    def command_escape
      turn_start unless BattleManager.process_escape
    end
    #--------------------------------------------------------------------------
    # * Start Actor Command Selection
    #--------------------------------------------------------------------------
    def start_actor_command_selection
      @status_window.select(BattleManager.actor.index)
      @party_command_window.close
      @actor_command_window.setup(BattleManager.actor)
    end
    #--------------------------------------------------------------------------
    # * [Attack] Command
    #--------------------------------------------------------------------------
    def command_attack
      BattleManager.actor.input.set_attack
      select_enemy_selection
    end
    #--------------------------------------------------------------------------
    # * [Skill] Command
    #--------------------------------------------------------------------------
    def command_skill
      @skill_window.actor = BattleManager.actor
      @skill_window.stype_id = @actor_command_window.current_ext
      @skill_window.refresh
      @skill_window.show.activate
    end
    #--------------------------------------------------------------------------
    # * [Guard] Command
    #--------------------------------------------------------------------------
    def command_guard
      BattleManager.actor.input.set_guard
      next_command
    end
    #--------------------------------------------------------------------------
    # * [Item] Command
    #--------------------------------------------------------------------------
    def command_item
      @item_window.refresh
      @item_window.show.activate
    end
    #--------------------------------------------------------------------------
    # * Start Actor Selection
    #--------------------------------------------------------------------------
    def select_actor_selection
      @actor_window.refresh
      @actor_window.show.activate
    end
    #--------------------------------------------------------------------------
    # * Actor [OK]
    #--------------------------------------------------------------------------
    def on_actor_ok
      BattleManager.actor.input.target_index = @actor_window.index
      @actor_window.hide
      @skill_window.hide
      @item_window.hide
      next_command
    end
    #--------------------------------------------------------------------------
    # * Actor [Cancel]
    #--------------------------------------------------------------------------
    def on_actor_cancel
      @actor_window.hide
      case @actor_command_window.current_symbol
      when :skill
        @skill_window.activate
      when :item
        @item_window.activate
      end
    end
    #--------------------------------------------------------------------------
    # * Start Enemy Selection
    #--------------------------------------------------------------------------
    def select_enemy_selection
      @enemy_window.refresh
      @enemy_window.show.activate
    end
    #--------------------------------------------------------------------------
    # * Enemy [OK]
    #--------------------------------------------------------------------------
    def on_enemy_ok
      BattleManager.actor.input.target_index = @enemy_window.enemy.index
      @enemy_window.hide
      @skill_window.hide
      @item_window.hide
      next_command
    end
    #--------------------------------------------------------------------------
    # * Enemy [Cancel]
    #--------------------------------------------------------------------------
    def on_enemy_cancel
      @enemy_window.hide
      case @actor_command_window.current_symbol
      when :attack
        @actor_command_window.activate
      when :skill
        @skill_window.activate
      when :item
        @item_window.activate
      end
    end
    #--------------------------------------------------------------------------
    # * Skill [OK]
    #--------------------------------------------------------------------------
    def on_skill_ok
      @skill = @skill_window.item
      BattleManager.actor.input.set_skill(@skill.id)
      BattleManager.actor.last_skill.object = @skill
      if !@skill.need_selection?
        @skill_window.hide
        next_command
      elsif @skill.for_opponent?
        select_enemy_selection
      else
        select_actor_selection
      end
    end
    #--------------------------------------------------------------------------
    # * Skill [Cancel]
    #--------------------------------------------------------------------------
    def on_skill_cancel
      @skill_window.hide
      @actor_command_window.activate
    end
    #--------------------------------------------------------------------------
    # * Item [OK]
    #--------------------------------------------------------------------------
    def on_item_ok
      @item = @item_window.item
      BattleManager.actor.input.set_item(@item.id)
      if !@item.need_selection?
        @item_window.hide
        next_command
      elsif @item.for_opponent?
        select_enemy_selection
      else
        select_actor_selection
      end
      $game_party.last_item.object = @item
    end
    #--------------------------------------------------------------------------
    # * Item [Cancel]
    #--------------------------------------------------------------------------
    def on_item_cancel
      @item_window.hide
      @actor_command_window.activate
    end
    #--------------------------------------------------------------------------
    # * Battle Start
    #--------------------------------------------------------------------------
    def battle_start
      BattleManager.battle_start
      process_event
      start_party_command_selection
    end
    #--------------------------------------------------------------------------
    # * Start Turn
    #--------------------------------------------------------------------------
    def turn_start
      @party_command_window.close
      @actor_command_window.close
      @status_window.unselect
      @subject =  nil
      BattleManager.turn_start
      @log_window.wait
      @log_window.clear
    end
    #--------------------------------------------------------------------------
    # * End Turn
    #--------------------------------------------------------------------------
    def turn_end
      all_battle_members.each do |battler|
        battler.on_turn_end
        refresh_status
        @log_window.display_auto_affected_status(battler)
        @log_window.wait_and_clear
      end
      BattleManager.turn_end
      process_event
      start_party_command_selection
    end
    #--------------------------------------------------------------------------
    # * Get All Battle Members Including Enemies and Allies
    #--------------------------------------------------------------------------
    def all_battle_members
      $game_party.members + $game_troop.members
    end
    #--------------------------------------------------------------------------
    # * Event Processing
    #--------------------------------------------------------------------------
    def process_event
      while !scene_changing?
        $game_troop.interpreter.update
        $game_troop.setup_battle_event
        wait_for_message
        wait_for_effect if $game_troop.all_dead?
        process_forced_action
        BattleManager.judge_win_loss
        break unless $game_troop.interpreter.running?
        update_for_wait
      end
    end
    #--------------------------------------------------------------------------
    # * Forced Action Processing
    #--------------------------------------------------------------------------
    def process_forced_action
      if BattleManager.action_forced?
        last_subject = @subject
        @subject = BattleManager.action_forced_battler
        BattleManager.clear_action_force
        process_action
        @subject = last_subject
      end
    end
    #--------------------------------------------------------------------------
    # * Battle Action Processing
    #--------------------------------------------------------------------------
    def process_action
      return if scene_changing?
      if !@subject || !@subject.current_action
        @subject = BattleManager.next_subject
      end
      return turn_end unless @subject
      if @subject.current_action
        @subject.current_action.prepare
        if @subject.current_action.valid?
          @status_window.open
          execute_action
        end
        @subject.remove_current_action
      end
      process_action_end unless @subject.current_action
    end
    #--------------------------------------------------------------------------
    # * Processing at End of Action
    #--------------------------------------------------------------------------
    def process_action_end
      @subject.on_action_end
      refresh_status
      @log_window.display_auto_affected_status(@subject)
      @log_window.wait_and_clear
      @log_window.display_current_state(@subject)
      @log_window.wait_and_clear
      BattleManager.judge_win_loss
    end
    #--------------------------------------------------------------------------
    # * Execute Battle Actions
    #--------------------------------------------------------------------------
    def execute_action
      @subject.sprite_effect_type = :whiten
      use_item
      @log_window.wait_and_clear
    end
    #--------------------------------------------------------------------------
    # * Use Skill/Item
    #--------------------------------------------------------------------------
    def use_item
      item = @subject.current_action.item
      @log_window.display_use_item(@subject, item)
      @subject.use_item(item)
      refresh_status
      targets = @subject.current_action.make_targets.compact
      show_animation(targets, item.animation_id)
      targets.each {|target| item.repeats.times { invoke_item(target, item) } }
    end
    #--------------------------------------------------------------------------
    # * Invoke Skill/Item
    #--------------------------------------------------------------------------
    def invoke_item(target, item)
      if rand < target.item_cnt(@subject, item)
        invoke_counter_attack(target, item)
      elsif rand < target.item_mrf(@subject, item)
        invoke_magic_reflection(target, item)
      else
        apply_item_effects(apply_substitute(target, item), item)
      end
      @subject.last_target_index = target.index
    end
    #--------------------------------------------------------------------------
    # * Apply Skill/Item Effect
    #--------------------------------------------------------------------------
    def apply_item_effects(target, item)
      target.item_apply(@subject, item)
      refresh_status
      @log_window.display_action_results(target, item)
    end
    #--------------------------------------------------------------------------
    # * Invoke Counterattack
    #--------------------------------------------------------------------------
    def invoke_counter_attack(target, item)
      @log_window.display_counter(target, item)
      attack_skill = $data_skills[target.attack_skill_id]
      @subject.item_apply(target, attack_skill)
      refresh_status
      @log_window.display_action_results(@subject, attack_skill)
    end
    #--------------------------------------------------------------------------
    # * Invoke Magic Reflection
    #--------------------------------------------------------------------------
    def invoke_magic_reflection(target, item)
      @subject.magic_reflection = true
      @log_window.display_reflection(target, item)
      apply_item_effects(@subject, item)
      @subject.magic_reflection = false
    end
    #--------------------------------------------------------------------------
    # * Apply Substitute
    #--------------------------------------------------------------------------
    def apply_substitute(target, item)
      if check_substitute(target, item)
        substitute = target.friends_unit.substitute_battler
        if substitute && target != substitute
          @log_window.display_substitute(substitute, target)
          return substitute
        end
      end
      target
    end
    #--------------------------------------------------------------------------
    # * Check Substitute Condition
    #--------------------------------------------------------------------------
    def check_substitute(target, item)
      target.hp < target.mhp / 4 && (!item || !item.certain?)
    end
    #--------------------------------------------------------------------------
    # * Show Animation
    #     targets      : Target array
    #     animation_id : Animation ID (-1:  Same as normal attack)
    #--------------------------------------------------------------------------
    def show_animation(targets, animation_id)
      if animation_id < 0
        show_attack_animation(targets)
      else
        show_normal_animation(targets, animation_id)
      end
      @log_window.wait
      wait_for_animation
    end
    #--------------------------------------------------------------------------
    # * Show Attack Animation
    #     targets : Target array
    #    Account for dual wield in the case of an actor (flip left hand weapon
    #    display). If enemy, play the [Enemy Attack] SE and wait briefly.
    #--------------------------------------------------------------------------
    def show_attack_animation(targets)
      if @subject.actor?
        show_normal_animation(targets, @subject.atk_animation_id1, false)
        show_normal_animation(targets, @subject.atk_animation_id2, true)
      else
        Sound.play_enemy_attack
        abs_wait_short
      end
    end
    #--------------------------------------------------------------------------
    # * Show Normal Animation
    #     targets      : Target array
    #     animation_id : Animation ID
    #     mirror       : Flip horizontal
    #--------------------------------------------------------------------------
    def show_normal_animation(targets, animation_id, mirror = false)
      animation = $data_animations[animation_id]
      if animation
        targets.each do |target|
          target.animation_id = animation_id
          target.animation_mirror = mirror
          abs_wait_short unless animation.to_screen?
        end
        abs_wait_short if animation.to_screen?
      end
    end
  end
  #==============================================================================
  # ** Scene_Gameover
  #------------------------------------------------------------------------------
  #  This class performs game over screen processing.
  #==============================================================================

  class Scene_Gameover < Scene_Base
    #--------------------------------------------------------------------------
    # * Start Processing
    #--------------------------------------------------------------------------
    def start
      super
      play_gameover_music
      fadeout_frozen_graphics
      create_background
    end
    #--------------------------------------------------------------------------
    # * Termination Processing
    #--------------------------------------------------------------------------
    def terminate
      super
      dispose_background
    end
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    def update
      super
      goto_title if Input.trigger?(:C)
    end
    #--------------------------------------------------------------------------
    # * Execute Transition
    #--------------------------------------------------------------------------
    def perform_transition
      Graphics.transition(fadein_speed)
    end
    #--------------------------------------------------------------------------
    # * Play Music on Game Over Screen
    #--------------------------------------------------------------------------
    def play_gameover_music
      RPG::BGM.stop
      RPG::BGS.stop
      $data_system.gameover_me.play
    end
    #--------------------------------------------------------------------------
    # * Fade Out Frozen Graphics
    #--------------------------------------------------------------------------
    def fadeout_frozen_graphics
      Graphics.transition(fadeout_speed)
      Graphics.freeze
    end
    #--------------------------------------------------------------------------
    # * Create Background
    #--------------------------------------------------------------------------
    def create_background
      @sprite = Sprite.new
      @sprite.bitmap = Cache.system("GameOver")
    end
    #--------------------------------------------------------------------------
    # * Free Background
    #--------------------------------------------------------------------------
    def dispose_background
      @sprite.bitmap.dispose
      @sprite.dispose
    end
    #--------------------------------------------------------------------------
    # * Get Fade Out Speed
    #--------------------------------------------------------------------------
    def fadeout_speed
      return 60
    end
    #--------------------------------------------------------------------------
    # * Get Fade In Speed
    #--------------------------------------------------------------------------
    def fadein_speed
      return 120
    end
    #--------------------------------------------------------------------------
    # * Transition to Title Screen
    #--------------------------------------------------------------------------
    def goto_title
      fadeout_all
      SceneManager.goto(Scene_Title)
    end
  end

  #██████╗  █████╗ ████████╗ ██████╗██╗  ██╗███████╗███████╗
  #██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║  ██║██╔════╝██╔════╝
  #██████╔╝███████║   ██║   ██║     ███████║█████╗  ███████╗
  #██╔═══╝ ██╔══██║   ██║   ██║     ██╔══██║██╔══╝  ╚════██║
  #██║     ██║  ██║   ██║   ╚██████╗██║  ██║███████╗███████║
  #╚═╝     ╚═╝  ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝

  class Sprite_Base
    def update_animation
      return unless animation?
      #We reset the origin so that it shows correctly
      set_animation_origin
      @ani_duration -= 1
      if @ani_duration % @ani_rate == 0
        if @ani_duration > 0
          frame_index = @animation.frame_max
          frame_index -= (@ani_duration + @ani_rate - 1) / @ani_rate
          animation_set_sprites(@animation.frames[frame_index])
          @animation.timings.each do |timing|
            animation_process_timing(timing) if timing.frame == frame_index
          end
        else
          end_animation
        end
      end
    end
  end

  class Game_Map ## Rounds X and Y display values DOWN so the nearest 32 is found.
    def display_x
      (@display_x * 32).floor.to_f / 32
    end

    def display_y
      (@display_y * 32).floor.to_f / 32
    end

    def adjust_x(x)
      if loop_horizontal? && x < display_x - (width - screen_tile_x) / 2
        x - display_x + @map.width
      else
        x - display_x
      end
    end

    def adjust_y(y)
      if loop_vertical? && y < display_y - (height - screen_tile_y) / 2
        y - display_y + @map.height
      else
        y - display_y
      end
    end
  end


  DISABLE_TEXT_SQUEEZE = false
  # turning this to true completely disables all built in text squeezing methods

  TEXT_SQUEEZE_MIN_TRIGGER_RATE = 1.5
  # the rate at which width of the text must be greater than the draw area
  # in order to trigger the default draw method that "squeezes" text
  # set to 1.0 to turn this feature off


  class Bitmap
    TEXT_TOP_BUFFER = 2
    TEXT_SIDE_BUFFER = 8 # buffer in pixels to draw text away from
    # the edge of the bitmap, to prevent certain characters from being cut off
    SIMPLE_FIX = false # just adds the two pixels to prevent unnecessary squeeze
    # depricated, as doing so causes the other mentioned bugs to still appear
    # 1.03 - changed to continue to draw text by character to prevent the crashing error
    MAX_TEXT_DRAW_WIDTH = 640 # tests have shown the draw fails at around 640px
    # if nil, no max width
    MAX_TEXT_DRAW_WIDTH_ABSOLUTE = 2016 # the absolute limit accepted by draw_text
    # this prevents a game.exe crash when the draw_text is called to a small space with a ton of text
    # any text longer than this will be automatically drawn without squeezing
    # this option should NEVER trigger either way
    NO_FIX = false # completely disables the fix, for testing comparison


    alias draw_text_vxa draw_text
    def draw_text(*args)
      return draw_text_vxa(*args) if NO_FIX
      if args[0].is_a?(Rect)
        rect = args[0]
        x, y, width, height = rect.x, rect.y, rect.width, rect.height
        text = args[1].to_s.clone || ""
        align = args[2] || 0
      else
        x, y, width, height = *args[0..3]
        text = args[4].to_s.clone || ""
        align = args[5] || 0
      end
      if check_squeeze_allowed(x, y, width, height, text)
        x -= align
        # shift one pixels to the left if centering
        # two if right right justified
        # to offset the extra width given
        draw_text_vxa(x, y, width + 2, height, text, align)
      else
        draw_text_cached(x, y, width, height, text, align)
      end
    end

    def check_squeeze_allowed(x, y, width, height, text)
      return false if DISABLE_TEXT_SQUEEZE # completely disables squeeze
      return false if MAX_TEXT_DRAW_WIDTH && width > MAX_TEXT_DRAW_WIDTH # will not squeeze if over size limit
      text_width = text_size(text).width
      return false if text_width >= MAX_TEXT_DRAW_WIDTH_ABSOLUTE # will not squeeze if over size limit
      text_width > width * TEXT_SQUEEZE_MIN_TRIGGER_RATE # will not squeeze if over size limit
    end

    def draw_text_cached(x, y, width, height, text, align, allow_squeeze = false)
      text_rect = self.text_size(text)
      text_width = text_rect.width
      text_height = text_rect.height
      # allow_squeeze - not recommended and completely hidden unless you are reading this
      if allow_squeeze && text_width > width * TEXT_SQUEEZE_MIN_TRIGGER_RATE
        ratio = width / text_width.to_f
        ratio = 0.5 if ratio < 0.5
        rect = Rect.new(0, 0, 0, 0)
      else
        ratio = nil
      end
      fontkey = self.font.to_a
      case align
      when 1; x += (width - text_width) / 2
      when 2; x += width - text_width
      end
      y += (height - text_height) / 2 # horizontal center
      buf = -TEXT_SIDE_BUFFER
      buf *= ratio if ratio
      text.each_char { |char|
        letter = TextCache.letters(fontkey, char)
        if SIMPLE_FIX  # swap with original method for debugging and simple fix
          draw_text_vxa(x + buf, y, letter.rect.width + 2, letter.height, char)
          buf += letter.rect.width - TEXT_SIDE_BUFFER * 2
        elsif ratio # drawing squished text
          w = (ratio * 10).to_i * letter.rect.width / 10
          rect.set(x + buf, y, w, text_height)
          self.stretch_blt(rect, letter, letter.rect)
          buf += (letter.rect.width * ratio - TEXT_SIDE_BUFFER * 2 * ratio).to_i
        else
          self.blt(x + buf, y, letter, letter.rect)
          buf += letter.rect.width - TEXT_SIDE_BUFFER * 2
        end
      }
      nil
    end
  end

  module TextCache
    BUFFER_DRAW = 300 # for drawing characters, to make sure there is enough room

    def self.canvas(font = nil)
      @canvas = Bitmap.new(32, 32) if @canvas.nil? || @canvas.disposed?
      #@canvas.font = font if font and font != @canvas.font
      @canvas
    end

    def self.letters(fontary, char)
      @cache ||= {}
      key = fontary + [char]
      if include?(key)
        return @cache[key]
      elsif char.empty?
        return empty_bitmap
      else
        return new_letter(fontary, char)
      end
    end

    def self.empty_bitmap # not used, added for completness in case the cache is accessed directly
      @cache[:empty] = Bitmap.new(32, 32) unless include?(:empty)
      @cache[:empty]
    end

    def self.new_letter(fontary, char)
      font = create_font(fontary)
      # get the font
      canvas.font = font
      rect = canvas.text_size(char * 3)
      key = fontary + [char]
      return @cache[key] = empty_bitmap if (rect.height == 0 || rect.width == 0)
      # get size of character between two other characters (for better kerning)
      b = Bitmap.new((rect.width / 3) + Bitmap::TEXT_SIDE_BUFFER * 2, rect.height)
      # create bitmap just big enough for one character
      b.font = font
      # get the font
      b.draw_text_vxa(rect.x - b.text_size(" ").width + Bitmap::TEXT_SIDE_BUFFER, rect.y - Bitmap::TEXT_TOP_BUFFER, BUFFER_DRAW,
                      rect.height + Bitmap::TEXT_TOP_BUFFER * 2, " #{char} ", 0)
      # draw blank spaces before and after character, fix for cutting off the
      # first pixel using draw_text
      @cache[key] = b
    end

    def self.create_font(fontary)
      font = Font.new(*fontary[0..1])
      font.bold = fontary[2]
      font.italic = fontary[3]
      font.outline = fontary[4]
      font.shadow = fontary[5]
      font.color.set(*fontary[6..9])
      font.out_color.set(*fontary[10..13])
      font
    end


    def self.include?(key)
      @cache[key] && !@cache[key].disposed?
    end

    def self.clear
      @cache ||= {}
      @cache.clear
      GC.start
    end

  end

  class Font
    # font's instance variables are not reflective, so this has to be defined explicitly
    def to_a
      [name, size, bold, italic, outline, shadow, color.red, color.green, color.blue, color.alpha, out_color.red, out_color.green, out_color.blue, out_color.alpha]
    end

  end

  class Game_Map

    def check_passage(x, y, bit)
      all_tiles(x, y).each do |tile_id|
        flag = tileset.flags[tile_id]
        if flag & 0x10 != 0                   # [☆]: No effect on passage
          next         if flag & bit == 0     # [○] : Passable but star
          return false if flag & bit == bit   # [×] : Impassable
        else
          return true  if flag & bit == 0     # [○] : Passable
          return false if flag & bit == bit   # [×] : Impassable
        end
      end
      return false                          # Impassable
    end
  end
