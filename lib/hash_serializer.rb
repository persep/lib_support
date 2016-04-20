class HashSerializer
  def self.dump(hash)
    hash
  end

  def self.load(hash)
    (hash || {}).symbolize_keys
  end
end