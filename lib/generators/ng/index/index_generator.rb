require 'generators/ng'

module Ng
  module Generators
    class IndexGenerator < Base
      source_root File.expand_path('../templates', __FILE__)

      def index
        template 'index.html.erb', "app/assets/templates/#{plural_name}/index.html.erb"
        template 'index_ctrl.coffee', "app/assets/javascripts/ng/controllers/#{plural_name}_ctrl.coffee"
      end

      def spec
        template 'spec.rb.erb', "spec/features/#{singular_name}_index_html_spec.rb"
      end

      def route
        inject_ng_route do
          "    .state         '#{ng_plural_name}',\n"\
          "      controller:  '#{plural_name.camelize}Ctrl'\n"\
          "      url:         '/#{plural_name}'\n"\
          "      templateUrl: '#{plural_name}/index.html'\n\n"
        end
      end

      protected

      def belongs_to_class_names
        all_belongs_to.map(&:class_name)
      end
    end
  end
end
