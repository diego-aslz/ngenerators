json.(@<%= singular_name %>, <%= symbolic_columns.join(', ') %>)
<%- all_belongs_to.each do |assoc| -%>

json.<%= assoc.name %> do
  json.(@<%= singular_name %>.<%= assoc.name %>, :id, :name) if @<%= singular_name %>.<%= assoc.name %>
end
<%- end -%>
