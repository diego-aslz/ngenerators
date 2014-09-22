require 'generators/ng'

module Ng
  module Generators
    class DirectiveGenerator < Base
      source_root File.expand_path('../templates', __FILE__)
      class_option :template, type: :boolean, default: true, description: "Generate HTML template file"

      def directive
        template 'directive.coffee', "app/assets/javascripts/ng/directives/#{directive_name}.coffee"
        template 'directive.html', "app/assets/templates/directives/#{directive_name}.html" if options.template?
      end

      protected

      def directive_name
        singular_name.gsub('_', '-')
      end
    end
  end
end
