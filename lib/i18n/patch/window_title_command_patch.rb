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