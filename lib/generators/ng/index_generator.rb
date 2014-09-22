require 'generators/ng'

module Ng
  module Generators
    class IndexGenerator < Base
      source_root File.expand_path('../templates', __FILE__)

      def index
        template 'index.html.erb', "app/assets/templates/#{plural_name}/index.html.erb"
      end
    end
  end
end
