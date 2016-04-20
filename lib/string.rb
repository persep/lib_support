require 'unicode'

class String
  def to_tag
    strip.mb_chars.downcase.to_s.gsub(/\s+/, '_').gsub(/\P{Word}/, '')
  end

  def to_html_id
    strip.gsub(/[\[\]]/, '_').gsub(/_$|^_/, '')
  end

  def capitalize
    Unicode::capitalize(self)
  end

  def capitalize!
    replace capitalize
  end

  def downcase
    Unicode::downcase(self)
  end

  def downcase!
    replace downcase
  end

  def upcase
    Unicode::upcase(self)
  end

  def upcase!
    replace upcase
  end
end
