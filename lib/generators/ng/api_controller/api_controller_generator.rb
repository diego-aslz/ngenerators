require 'generators/ng'

module Ng
  module Generators
    class ApiControllerGenerator < Base
      source_root File.expand_path('../templates', __FILE__)

      def controller
        template 'api_controller.rb', "app/controllers/api/#{plural_name}_controller.rb"
        template 'show.json.jbuilder', "app/views/api/#{plural_name}/show.json.jbuilder"
        template 'index.json.jbuilder', "app/views/api/#{plural_name}/index.json.jbuilder"
      end

      def route
        inject_into_file 'config/routes.rb', after: /namespace :api.+do\n/ do
          "    resources :#{plural_name}, only: [:show, :index]\n"
        end
      end

      private

      def symbolic_columns
        klass.columns.reject { |col| association_for(col) }.map(&:name).map do |name|
          ":#{name}"
        end
      end

      def preloads
        all_belongs_to.map do |assoc|
          ".preload(:#{assoc.name})"
        end.join
      end
    end
  end
end
