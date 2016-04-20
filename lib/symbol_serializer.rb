class SymbolSerializer
  def self.dump(hash)
    hash.to_s
  end

  def self.load(hash)
    hash.to_sym if hash
  end
end