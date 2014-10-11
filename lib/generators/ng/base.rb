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
        column.name.gsub(/_id$/, '').gsub(/^id_/, '')
      end

      def ng_column_name(column)
        column_name(column).camelize(:lower)
      end

      def i18n_column(column)
        klass.human_attribute_name(column_name(column))
      end

      def column_is_association?(column)
        !!association_for(column)
      end

      def association_for(column)
        all_belongs_to.detect { |bt| bt.foreign_key.to_s == column.name }
      end

      def all_belongs_to
        klass.reflect_on_all_associations.select { |a| a.macro == :belongs_to }
      end

      def input_type(column)
        column.klass < Numeric ? 'number' : 'text'
      end

      def inject_ng_route(&block)
        inject_into_file 'app/assets/javascripts/ng/routes.coffee',
          after: "$stateProvider\n", &block
      end

      def belongs_to_class_names
        all_belongs_to.map(&:class_name)
      end
    end
  end
end
