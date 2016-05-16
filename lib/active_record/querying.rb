module ActiveRecord
  module Querying
    delegate :find_objects, to: :all
  end
end