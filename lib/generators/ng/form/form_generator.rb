require 'generators/ng'

module Ng
  module Generators
    class FormGenerator < Base
      source_root File.expand_path('../templates', __FILE__)

      def form
        template 'form.html.erb', "app/assets/templates/#{plural_name}/form.html.erb"
        template 'form_ctrl.coffee', "app/assets/javascripts/ng/controllers/#{singular_name}_form_ctrl.coffee"
      end

      def spec
        template 'spec.rb.erb', "spec/features/#{singular_name}_show_spec.rb"
      end

      def route
        inject_ng_route do
          "    .state         '#{ng_singular_name}Form',\n"\
          "      controller:  '#{class_name}FormCtrl'\n"\
          "      url:         '/#{plural_name}/new'\n"\
          "      templateUrl: '#{plural_name}/form.html'\n\n"
        end
      end
    end
  end
end
