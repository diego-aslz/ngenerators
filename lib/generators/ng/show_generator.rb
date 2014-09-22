require 'generators/ng'

module Ng
  module Generators
    class ShowGenerator < Base
      source_root File.expand_path('../templates', __FILE__)

      def show
        template 'show.html', "app/assets/templates/#{plural_name}/show.html"
        template 'show_ctrl.coffee', "app/assets/javascripts/ng/controllers/#{singular_name}_ctrl.coffee"
      end

      def route
        inject_into_file 'app/assets/javascripts/ng/routes.coffee', after: "$stateProvider\n" do
          "    .state '#{ng_singular_name}',\n"\
          "      url: '/#{plural_name}/:id'\n"\
          "      templateUrl: '#{plural_name}/show.html'\n\n"
        end
      end
    end
  end
end
