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

    def add_to_locale(locale, dict)
      raise ArgumentError, "Local #{symbole} was not found" unless DICTS.has_key? locale 
      add locale, nil, dict
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

require 'i18n/errors'
require 'i18n/ru'
require 'i18n/en'
require 'i18n/database_translator'
require 'i18n/window'
require 'i18n/patch'