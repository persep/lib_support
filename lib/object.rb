class Object
  def get_id
    respond_to?(:id) ? send(:id) : self
  end

  def is_bool?
    is_a?(TrueClass) || is_a?(FalseClass)
  end

  def to_bool
    ActiveRecord::Type::Boolean.new.type_cast_from_user(to_s) unless is_bool?
  end

  def with(*args, &block)
    ->(caller, *rest) { caller.send(self, *rest, *args, &block) }
  end

  def pl_name
    self.class.pl_name
  end

  def sm_name
    self.class.sm_name
  end

  class << self
    def pl_name
      name.pluralize.underscore.to_sym
    end

    def sm_name
      name.underscore.to_sym
    end
  end
end