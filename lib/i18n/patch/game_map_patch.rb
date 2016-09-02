class Game_Map
  alias original_display_name_for_i18n display_name
  def display_name
    text = original_display_name_for_i18n

    if text && text.start_with?(I18n::TRANSLATE_MARK)
      t text.sub(I18n::TRANSLATE_MARK, '').strip
    else
      text
    end
  end
end
