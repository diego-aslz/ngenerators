require 'generators/ng'

module Ng
  module Generators
    class ResourceGenerator < Base
      source_root File.expand_path('../templates', __FILE__)

      def show
        template 'resource.coffee', "app/assets/javascripts/ng/resources/#{singular_name}.coffee"
      end
    end
  end
end
