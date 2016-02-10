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