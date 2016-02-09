#encoding=utf-8
I18n.add :ru, 'Русский', {
  basic: {
    currency_unit: 'Зт.',
    elements: [''] + %w(Физический Aбсорб Огонь Лед Молния Вода Земля Воздух Святость Тьма),
    weapon_types: [''] + %w(Топор Когти Копье Меч Катана Лук Кинжал Молот Посох Огнестрельное Жезл),
    skill_types:  [''] + %w(Навык Магия),
    armor_types:  [''] + %w(Обычная Магическая Легкая Тяжелая Большая Маленькая).map { |p| "#{p} броня" },
    basic_status: %w(уровня Ур HP HP MP MP TP TP),
    parameters: [
      'Макс HP', 'Макс MP', 'Атака', 'Защита', 'Маг. атака',
      'Маг. защита', 'Ловкость', 'Удача'
    ],
    equip_types:  %w(Оружие Щит Голова Тело Аксессуар),
    commands: [
      'Бой', 'Сбежать', 'Атака', 'Защита', 'Вещи', 'Навыки', 'Снаряжение',
      'Статус', 'Построение', 'Сохранить', 'Выйти', '', 'Оружие', 'Броня',
      'Ключевые', 'Одеть', 'Лучшее', 'Снять все', 'Новая игра', 'Загрузить',
      'Выйти', 'Меню', 'Вернуться', ''
    ],
    # Shop Screen
    shop_buy: "Купить",
    shop_sell: "Продать",
    shop_cancel: "Отмена",
    possession: "Имущество",
    # Status Screen
    exp_total: "Опыт",
    exp_next: "До следующего %s",
    # Save/Load Screen
    save_message: "Сохранить в файл",
    load_message: "Загрузить",
    file: "Файл",
    # Display when there are multiple members
    party_name: "Группа %s",
    # Basic Battle Messages
    emerge: "Появляется %s!",
    preemptive: "%s получает преимущество!",
    surprise: "%s удивлен!",
    escape_start: "%s пытается сбежать!",
    escape_failure: "Побег не удался!",
    # Battle Ending Messages
    victory:  "%s Побеждает!",
    defeat: "%s был побежден.",
    obtain_exp: "Получено %s EXP!",
    obtain_gold: "Найдено %s\\G!",
    obtain_item: "Найден %s!",
    level_up: "%s теперь %s %s!",
    obtain_skill: "Изучено умение \"%s!\"",
    # Use Item
    use_item: "%s использует %s!",
    # Critical Hit
    critical_to_enemy: "Критический удар!!",
    critical_to_actor: "Критический удар!!",
    # Results for Actions on Actors
    actor_damage: "%s получает %s урона!",
    actor_recovery: "%s востановаливает %s %s!",
    actor_gain: "%s получает %s %s!",
    actor_loss: "%s теряет %s %s!",
    actor_drain: "%s вытягивает %s %s!",
    actor_no_damage: "%s не получает!",
    actor_no_hit: "Промах! %s не получает урона!",
    # Results for Actions on Enemies
    enemy_damage: "%s получает %s урона!",
    enemy_recovery: "%s востанавливает %s %s!",
    enemy_gain: "%s полуает %s %s!",
    enemy_loss:"%s теряет %s %s!",
    enemy_drain: "Вытягивает %s %s из %s!",
    enemy_no_damage: "%s не получает урона!",
    enemy_no_hit: "Промах! %s не получает урона!",
    # Evasion/Reflection
    evasion: "%s уклоняется от атаки!",
    magic_evasion:  "%s резистирует магию!",
    magic_reflection: "%s отражает магию!",
    counter_attack: "%s контераттакован!",
    substitute: "%s защищен %s!",
    # Buff/Debuff
    buff_add: "%s's %s повышается!",
    debuff_add: "%s's %s понижается!",
    buff_remove: "%s's %s возвращается к норме.",
    # Skill or Item Had No Effect
    action_failure: "Нет эффекта на %s!",
    # Error Message
    player_pos_error: "Начальная точка игрока не установлена.",
    event_overflow: "Обычный эвент превысил лимит.",
    language: 'Язык'
  }
}