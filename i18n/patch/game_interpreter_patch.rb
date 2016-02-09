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