require 'rails/generators'

module LibSupport
  class RefsControllerGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def create_controllers
      @name = name.underscore

      template 'refs_controller.rb.template', "app/controllers/#{@name}_controller.rb"
      template 'base_object.rb.template', 'app/models/base_object.rb'
      directory 'views', "app/views/#{@name}"
      directory 'locales', 'config/locales'
    end
  end
end