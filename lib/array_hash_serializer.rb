class ArrayHashSerializer
  def self.dump(hash)
    hash.to_json
  end

  def self.load(hash)
    (hash || []).map{|x| x.is_a?(Hash) ? x.symbolize_keys : x }
  end
end