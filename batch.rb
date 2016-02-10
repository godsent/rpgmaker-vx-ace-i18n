#gems/i18n/lib/i18n.rb
module I18n
  DICTS = {}
  LOCALES = {}
  TRANSLATE_MARK = 't '
  LOCALE_FILE = 'lang.txt'

  class << self
    def current_locale
      @current_locale ||= calculate_current_locale
    end

    def current_locale=(locale)
      @current_locale = locale
      File.open(LOCALE_FILE, 'w') { |f| f.puts locale.to_s }
      reload!
    end

    def t(path)
      path.gsub(/['"]/, '').split('.').inject DICTS.fetch(current_locale) do |dict, key|
        key = dict.is_a?(Array) && key.to_i.to_s == key ? key.to_i - 1 : key.to_sym  
        dict[key] || raise(I18n::Errors::KeyNotFound, path)
      end
    end

    def add(symbol, name = nil, dict = {})
      if name
        LOCALES[symbol] = name
      elsif !LOCALES[symbol]
        raise ArgumentError
      end

      DICTS[symbol] ||= {}
      DICTS[symbol].merge! dict
    end

    def on_reload(&block)
      @on_reload ||= [] 
      @on_reload << block 
    end

    private

    def reload!
      (@on_reload || []).each(&:call)
    end

    def calculate_current_locale
      locale_from_file || :ru
    end

    def locale_from_file
      File.open(LOCALE_FILE, 'r') { |f| f.read.strip.to_sym } rescue nil
    end
  end
end

#gems/i18n/lib/i18n/errors.rb
module I18n::Errors
  class KeyNotFound < StandardError
  end
end
#gems/i18n/lib/i18n/ru.rb
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
#gems/i18n/lib/i18n/en.rb
I18n.add :en, 'English', {
  basic: {
    currency_unit: 'G',
    elements: [''] + %w(Physical Absorb Fire Ice Light Water Earth Air Holy Dark),
    weapon_types: [''] + %w(Axe Claws Spear Sword Katana Bow Dagger Hammer Staff Gun Rod),
    skill_types:  [''] + %w(Skill Spell),
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
#gems/i18n/lib/i18n/database_translator.rb
module I18n::DatabaseTranslator 
  def self.watch(klass, *method_names)
    klass.class_exec(method_names) do 
      method_names.flatten.each do |method_name|
        original_method_name = "original_#{method_name}_for_translator"
        alias_method original_method_name, method_name

        define_method method_name do 
          result = send original_method_name
          if result.start_with?(I18n::TRANSLATE_MARK)
            t result.sub(I18n::TRANSLATE_MARK, '').strip
          else 
            result
          end
        end
      end
    end
  end
end
#gems/i18n/lib/i18n/window.rb
class I18n::Window < Window_Selectable
  def initialize(x, y)
    width = 160
    height = line_height * item_max + 24
    super x, y, width, height
    draw_all_items
    close
  end

  def close
    super
    hide
  end

  def open 
    super
    activate
    select current_index
    show
  end

  def selected_locale
    locales[@index]
  end

  private

  def locales
    I18n::LOCALES.keys
  end

  def names
    I18n::LOCALES.values
  end

  def current_index
    locales.index I18n.current_locale
  end

  def draw_item(index)
    change_color normal_color
    draw_text item_rect_for_text(index), names[index]
  end

  def item_max
    locales.size
  end
end
#gems/i18n/lib/i18n/patch.rb
module I18n::Patch 
end


#gems/i18n/lib/i18n/patch/object_patch.rb
class Object 
  def t(*args, &block)
    I18n.t(*args, &block)
  end
end
#gems/i18n/lib/i18n/patch/string_patch.rb
class String 
  def underscore
    chars.first.downcase + chars.to_a[1..-1].inject('') do |res, char| 
      prefix = char.upcase == char ? '_' : ''
      res + prefix + char.downcase
    end
  end
end
#gems/i18n/lib/i18n/patch/rpg_system_patch.rb
class RPG::System
  def elements
    t 'basic.elements'
  end

  def skill_types
    t 'basic.skill_types'
  end

  def armor_types
    t 'basic.armor_types'
  end

  def weapon_types
    t 'basic.weapon_types'
  end
end
#gems/i18n/lib/i18n/patch/rpg_system_terms_patch.rb
class RPG::System::Terms 
  def basic
    t "basic.basic_status"
  end

  def params
    t "basic.parameters"
  end

  def etypes
    t "basic.equip_types"
  end

  def commands
    t "basic.commands"
  end
end
#gems/i18n/lib/i18n/patch/vocab_patch.rb
module Vocab
  def self.set
    %w(
      ShopBuy
      ShopSell
      ShopCancel
      Possession
      ExpTotal 
      ExpNext 
      SaveMessage 
      LoadMessage
      File
      PartyName
      Emerge
      Preemptive
      Surprise
      EscapeStart
      EscapeFailure
      Victory
      Defeat
      ObtainExp
      ObtainGold
      ObtainItem
      LevelUp
      ObtainSkill
      UseItem
      CriticalToEnemy
      CriticalToActor
      ActorDamage
      ActorRecovery
      ActorGain
      ActorLoss
      ActorDrain
      ActorNoDamage
      ActorNoHit
      EnemyDamage
      EnemyRecovery
      EnemyGain
      EnemyLoss
      EnemyDrain
      EnemyNoDamage
      EnemyNoHit
      Evasion
      MagicEvasion
      MagicReflection
      CounterAttack
      Substitute
      BuffAdd
      DebuffAdd
      BuffRemove
      ActionFailure
      PlayerPosError
      EventOverflow
      ).each do |const_name|
        const_set const_name, t("basic.#{const_name.underscore}")
    end
  end

  set
  I18n.on_reload(&method(:set).to_proc)
  
  # Currency Unit
  def self.currency_unit
    t 'basic.currency_unit'
  end
end
#gems/i18n/lib/i18n/patch/watcher_patch.rb
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
#gems/i18n/lib/i18n/patch/game_interpreter_patch.rb
class Game_Interpreter
  def command_101
    wait_for_message
    $game_message.face_name = @params[0]
    $game_message.face_index = @params[1]
    $game_message.background = @params[2]
    $game_message.position = @params[3]
    while next_event_code == 401       # Text data
      @index += 1
      text = @list[@index].parameters[0]
      if text.start_with? I18n::TRANSLATE_MARK
        t(text.sub(I18n::TRANSLATE_MARK, '').strip).lines.each do |line|
          $game_message.add line.strip
        end
      else
        $game_message.add text
      end
    end
    case next_event_code
    when 102  # Show Choices
      @index += 1
      default_index = @list[@index].parameters.last 
      choices = @list[@index].parameters.first.map do |choice|
        if choice.start_with? I18n::TRANSLATE_MARK 
          t choice.sub(I18n::TRANSLATE_MARK, '').strip.strip
        else 
          choice
        end
      end
      setup_choices [choices, default_index]
    when 103  # Input Number
      @index += 1
      setup_num_input(@list[@index].parameters)
    when 104  # Select Item
      @index += 1
      setup_item_choice(@list[@index].parameters)
    end
    wait_for_message
  end

  def command_105
    Fiber.yield while $game_message.visible
    $game_message.scroll_mode = true
    $game_message.scroll_speed = @params[0]
    $game_message.scroll_no_fast = @params[1]
    while next_event_code == 405
      @index += 1
      text = @list[@index].parameters[0]
      if text.start_with? I18n::TRANSLATE_MARK
        t(text.sub(I18n::TRANSLATE_MARK, '').strip).lines.each do |line|
          $game_message.add line.strip
        end
      else
        $game_message.add text
      end
    end
    wait_for_message
  end

  alias original_setup_choices_for_i18n setup_choices
  def setup_choices(params)
    params[0].map! do |choice|
      if choice.start_with? I18n::TRANSLATE_MARK
        t choice.sub(I18n::TRANSLATE_MARK, '').strip
      else
        choice
      end
    end
    original_setup_choices_for_i18n params
  end
end
#gems/i18n/lib/i18n/patch/scene_title_patch.rb
class Scene_Title 
  alias original_create_command_window_for_i18n create_command_window
  def create_command_window
    original_create_command_window_for_i18n
    @command_window.set_handler :language, method(:command_language)
    create_language_window
  end

  private

  def create_language_window
    @language_window = I18n::Window.new @command_window.x, @command_window.y
    @language_window.set_handler :ok, method(:on_language_ok)
    @language_window.set_handler :cancel, method(:on_language_cancel)
  end

  def command_language
    close_command_window
    open_language_window
  end

  def on_language_ok
    I18n.current_locale = @language_window.selected_locale
    on_language_cancel
  end

  def on_language_cancel
    close_language_window
    open_command_window
  end

  def open_language_window
    @language_window.open 
    update until @language_window.open?
  end

  def open_command_window
    @command_window.refresh
    @command_window.open
    update until @command_window.open?
    @command_window.activate
  end

  def close_language_window
    @language_window.close 
    update until @language_window.close?
  end
end
#gems/i18n/lib/i18n/patch/window_title_command_patch.rb
class Window_TitleCommand
  alias original_make_command_list_for_i18n make_command_list
  def make_command_list
    original_make_command_list_for_i18n
    @list[-1 ... -1] = {
      name: t('basic.language'), symbol: :language, enabled: true, ext: nil
    }
  end

  alias original_update_placement_for_i18n update_placement
  def update_placement
    original_update_placement_for_i18n
    self.y = (Graphics.height * 1.3 - height) / 2
  end
end
