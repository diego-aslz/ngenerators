require 'generators/ng'

module Ng
  module Generators
    class FormGenerator < Base
      source_root File.expand_path('../templates', __FILE__)

      def form
        template 'form.html.erb', "app/assets/templates/#{plural_name}/form.html.erb"
      end
    end
  end
end
