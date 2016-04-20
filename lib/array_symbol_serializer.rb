class ArraySymbolSerializer
  def self.dump(hash)
    hash.to_json
  end

  def self.load(hash)
    (hash || []).map(&:to_sym)
  end
end