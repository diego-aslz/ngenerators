module Api
  class <%= plural_name.camelize %>Controller < BaseController
    <%- if options.model -%>
    defaults resource_class: <%= options.model.try(:camelize) %>

    <%- end -%>
    <%- anothers = [] -%>
    <%- klass.columns.each do |column| -%>
    <%- if column.type == :date || column.type == :datetime -%>
    <%- anothers << "#{column_name(column)}_since" -%>
    <%- anothers << "#{column_name(column)}_until" -%>
    <%- else anothers << column_name(column) end -%>
    <%- end -%>
    <%- if anothers.any? -%>
    has_scope <%= anothers.map{ |col| ":by_#{col}"}.join(', ') %>
    <%- end -%>
  end
end
