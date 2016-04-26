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
require 'version'

module LibSupport
  module Rails
    class Engine < ::Rails::Engine

    end
  end
end

require 'refs_controller'
require 'base_object'
require 'generators/refs_controller/refs_controller_generator'