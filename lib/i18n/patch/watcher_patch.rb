[  
  [RPG::Actor, %w(name nickname description)],
  [RPG::Class, %w(name)],
  [RPG::Skill, %w(name description message1)],
  [RPG::Enemy, %w(name)],
  [RPG::Item, %w(name description)],
  [RPG::Weapon, %w(name description)],
  [RPG::Armor, %w(name description)],
  [RPG::State, %w(name message1 message2 message3 message4)]
].each { |arr| I18n::DatabaseTranslator.watch(*arr) }