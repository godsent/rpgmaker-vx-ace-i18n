[  
  [RPG::Actor, %w(name nickname)],
  [RPG::Class, %w(name)],
  [RPG::Skill, %w(name description)],
  [RPG::Enemy, %w(name)],
  [RPG::Item, %w(name description)],
  [RPG::Weapon, %w(name description)],
  [RPG::Armor, %w(name description)],
  [RPG::State, %w(name)]
].each { |arr| I18n::DatabaseTranslator.watch(*arr) }