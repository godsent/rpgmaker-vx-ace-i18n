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