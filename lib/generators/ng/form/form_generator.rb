require 'generators/ng'

module Ng
  module Generators
    class FormGenerator < Base
      source_root File.expand_path('../templates', __FILE__)

      def form
        template 'form.html.erb', "app/assets/templates/#{plural_name}/form.html.erb"
        template 'form_ctrl.coffee', "app/assets/javascripts/ng/controllers/#{singular_name}_form_ctrl.coffee"
      end
    end
  end
end
