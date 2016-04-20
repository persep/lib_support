class Time
  def as_json(options = nil)
    to_s
  end

  def to_json(options = {})
    to_s
  end
end