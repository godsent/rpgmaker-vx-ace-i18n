class String 
  def underscore
    chars.first.downcase + chars.to_a[1..-1].inject('') do |res, char| 
      prefix = char.upcase == char ? '_' : ''
      res + prefix + char.downcase
    end
  end
end