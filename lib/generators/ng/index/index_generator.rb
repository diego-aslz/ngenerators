require 'generators/ng'

module Ng
  module Generators
    class IndexGenerator < Base
      source_root File.expand_path('../templates', __FILE__)
      argument :attributes, type: :array, default: [], banner: "field[:type] field[:type]"

      def index
        template 'index.html.erb', "app/assets/templates/#{plural_name}/index.html.erb"
        template 'index_ctrl.coffee', "app/assets/javascripts/ng/controllers/#{plural_name}_ctrl.coffee"
      end

      def spec
        template 'spec.rb.erb', "spec/features/#{singular_name}_index_spec.rb"
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

      def i18n_option_attribute(attribute)
        klass.human_attribute_name(attribute.name)
      end

      def belongs_to_class_names
        attributes.select do |attribute|
          %i(typeahead select checkboxes).include?(attribute.type)
        end.map do |attribute|
          association_for(attribute, by: :name)
        end.reject(&:nil?).map(&:klass).map(&:to_s)
      end

      def align_right?(column)
        column.klass <= Numeric && !column_is_association?(column)
      end
    end
  end
end
