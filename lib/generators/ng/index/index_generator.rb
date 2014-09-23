require 'generators/ng'

module Ng
  module Generators
    class IndexGenerator < Base
      source_root File.expand_path('../templates', __FILE__)

      def index
        template 'index.html.erb', "app/assets/templates/#{plural_name}/index.html.erb"
        template 'index_ctrl.coffee', "app/assets/javascripts/ng/controllers/#{plural_name}_ctrl.coffee"
      end

      def route
        inject_ng_route do
          "    .state         '#{ng_plural_name}',\n"\
          "      controller:  '#{plural_name.camelize}Ctrl'\n"\
          "      url:         '/#{plural_name}'\n"\
          "      templateUrl: '#{plural_name}/index.html'\n\n"
        end
      end
    end
  end
end
