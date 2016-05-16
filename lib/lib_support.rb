require 'array'
require 'array_hash_serializer'
require 'array_symbol_serializer'
require 'hash'
require 'object'
require 'symbol_serializer'
require 'date'
require 'hash_serializer'
require 'string'
require 'time'
require 'mapper'
require 'migration'
require 'version'
require 'refs_controller'
require 'base_object'
require 'generators/refs_controller/refs_controller_generator'
require 'engine'

module ActiveRecord
  module QueryMethods
    # full text search
    def find_objects(txt, *opts)
      text = txt.strip.gsub('$', '')

      res = where("#{table_name}.txt_index @@ plainto_tsquery(unaccent($$#{text}$$))").order("ts_rank(#{table_name}.txt_index, plainto_tsquery($$#{text}$$)) desc")
      res = res.order("#{table_name}.name <-> $$#{text}$$") if column_names.include?('name')

      res
    end
  end

  module Querying
    delegate :find_objects, to: :all
  end
end