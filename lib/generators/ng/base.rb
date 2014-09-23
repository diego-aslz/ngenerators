module Ng
  module Generators
    class Base < ::Rails::Generators::NamedBase
      class_option :model, type: :string, default: nil,
        description: "The name of the model when it differs from model_name"

      protected

      def ng_singular_name
        singular_name.camelize(:lower)
      end

      def ng_plural_name
        plural_name.camelize(:lower)
      end

      def klass
        @klass ||= (options.model.try(:camelize) || class_name).constantize
      end

      def i18n_human
        klass.model_name.human
      end

      def column_name(column)
        column.name.gsub(/_id$/, '')
      end

      def i18n_column(column)
        klass.human_attribute_name(column_name(column))
      end

      def column_is_association?(column)
        column.name.ends_with? '_id'
      end

      def input_type(column)
        column.klass < Numeric ? 'number' : 'text'
      end
    end
  end
end
