class Hash
  def methods_for_keys
    methods_for_keys!
    self
  end

  def methods_for_keys!
    symbolize_keys!

    keys.each do |key|
      instance_eval <<-CODE
       def #{key.to_s}
         self[:#{key}]
       end
      CODE
    end
  end

  def deep_values(key, &block)
    values = []

    values << self[key] if key?(key) && (!block_given? || block.call(self, key))
    each {|_, v|  values += v.deep_values(key, &block) if v && v.is_a?(Hash) }

    values.flatten
  end

end