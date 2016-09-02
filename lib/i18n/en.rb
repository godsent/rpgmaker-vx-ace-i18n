I18n.add :en, 'English', {
  basic: {
    currency_unit: 'G',
    elements: [''] + %w(Physical Absorb Fire Ice Light Water Earth Air Holy Dark),
    weapon_types: [''] + %w(Axe Claws Spear Sword Katana Bow Dagger Hammer Staff Gun Rod),
    skill_types:  [''] + %w(Skill Spell Passive),
    armor_types:  [''] + %w(Common Magic Light Heavy Big Tiny).map { |p| "#{p} armor" },
    basic_status: %w(level lvl HP HP MP MP TP TP),
    parameters: [
      'Max HP', 'Max MP', 'Attack', 'Defence', 'M. attack',
      'M. defence', 'Agility', 'Luck'
    ],
    equip_types:  %w(Weapon Shield Head Body Accessory),
    commands: [
      'Fight', 'Escape', 'Attack', 'Guard', 'Items', 'Skills', 'Equipment',
      'Status', 'Formation', 'Save', 'Quit', '', 'Weapon', 'Armor',
      'Key', 'Equip', 'Optimize', 'Clear', 'New Game', 'Load',
      'Quit', 'Menu', 'Back', ''
    ],
    # Shop Screen
    shop_buy: "Buy",
    shop_sell: "Sell",
    shop_cancel: "Cancel",
    possession: "Possession",
    # Status Screen
    exp_total: "EXP",
    exp_next: "To next %s",
    # Save/Load Screen
    save_message: "Save to file",
    load_message: "Load",
    file: "File",
    # Display when there are multiple members
    party_name: "%s's Party",
    # Basic Battle Messages
    emerge: "%s emerges!",
    preemptive: "%s is preemptive!",
    surprise: "%s is surprised!",
    escape_start: "%s is trying to escape!",
    escape_failure: "Escape failed!",
    # Battle Ending Messages
    victory:  "%s wins!",
    defeat: "%s was defeated.",
    obtain_exp: "Gained %s EXP!",
    obtain_gold: "Gained %s\\G!",
    obtain_item: "%s is gained!",
    level_up: "%s is %s %s now!",
    obtain_skill: " \"%s!\" skill was learnt",
    # Use Item
    use_item: "%s uses %s!",
    # Critical Hit
    critical_to_enemy: "Critical hit!!",
    critical_to_actor: "Critical hit!!",
    # Results for Actions on Actors
    actor_damage: "%s got %s damage!",
    actor_recovery: "%s recovers %s %s!",
    actor_gain: "%s gains %s %s!",
    actor_loss: "%s losses %s %s!",
    actor_drain: "%s drains %s %s!",
    actor_no_damage: "%s got no damage!",
    actor_no_hit: "Miss! %s got no damage!",
    # Results for Actions on Enemies
    enemy_damage: "%s got %s damage!",
    enemy_recovery: "%s recover %s %s!",
    enemy_gain: "%s gains %s %s!",
    enemy_loss:"%s losses %s %s!",
    enemy_drain: "Drains %s %s из %s!",
    enemy_no_damage: "%s got no damage!",
    enemy_no_hit: "Miss! %s got no damage!",
    # Evasion/Reflection
    evasion: "%s evaded attack!",
    magic_evasion:  "%s resists spell!",
    magic_reflection: "%s reflect spell!",
    counter_attack: "%s is counter attacked!",
    substitute: "%s is covered by %s!",
    # Buff/Debuff
    buff_add: "%s's %s is rising!",
    debuff_add: "%s's %s falling!",
    buff_remove: "%s's %s backs to normal",
    # Skill or Item Had No Effect
    action_failure: "No effect on %s!",
    # Error Message
    player_pos_error: "Player's start point is not setted.",
    event_overflow: "Common event overflowed limit.",
    language: 'Language'
  }
}
