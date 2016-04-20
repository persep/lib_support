class Array
  def avg
    sum.to_f / count
  end

  def except(*values)
    par = dup
    values.each {|val| par.delete(val) }
    par
  end

  def except!(*values)
    values.each {|val| self.delete(val) }
    self
  end

  def ^(other)
    result = dup
    other.each{|e| result.include?(e) ? result.delete(e) : result.push(e) }

    result
  end unless method_defined?(:^)

  alias diff ^ unless method_defined?(:diff)
end