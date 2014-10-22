require 'generators/ng'

module Ng
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def bower
        gem 'bower-rails'
        gem 'angular-rails-templates'
        generate 'bower_rails:initialize'
        inject_into_file 'Bowerfile', before: /\n$/ do
          "asset 'angular'\n"\
          "asset 'angular-cookies'\n"\
          "asset 'angular-bootstrap'\n"\
          "asset 'angularjs-rails-resource'\n"\
          "asset 'angular-ui-router'\n"\
          "asset 'angular-devise'\n"
        end
        rake 'bower:install'
      end

      def copy_coffees
        %w(query_string searcher toggler).each do |service|
          coffee_template service, "/services"
        end
        %w(locale routes).each do |config|
          coffee_template config
        end
        coffee_template 'application', '/..'
        coffee_template 'application_ctrl', '/controllers'
        coffee_template 'ability', '/resources'
        create_file 'app/assets/templates/welcome/index.html'
      end

      protected

      def coffee_template(name, path = nil)
        template "#{name}.coffee", "app/assets/javascripts/ng#{path}/#{name}.coffee"
      end
    end
  end
end
