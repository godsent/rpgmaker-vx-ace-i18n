module I18n::DatabaseTranslator 
  def self.watch(klass, *method_names)
    klass.class_exec(method_names) do |names|
      names.flatten.each do |method_name|
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