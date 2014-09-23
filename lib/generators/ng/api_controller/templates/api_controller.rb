module Api
  class <%= plural_name.camelize %>Controller < BaseController
    <%- if options.model -%>
    defaults resource_class: <%= options.model.try(:camelize) %>

    <%- end -%>
    <%- anothers = [] -%>
    <%- klass.columns.each do |column| -%>
    <%- if column.type == :date || column.type == :datetime -%>
    has_scope :by_<%= column_name(column) %>, type: :hash, using: [:since, :until]
    <%- else anothers << column end -%>
    <%- end -%>
    <%- if anothers.any? -%>
    has_scope <%= anothers.map{ |col| ":by_#{column_name(col)}"}.join(', ') %>
    <%- end -%>
  end
end
