json.array!(@<%= plural_name %><%= preloads %>) do |<%= singular_name %>|
  json.(<%= singular_name %>, <%= symbolic_columns.join(', ') %>)
  json.count @count
  <%- all_belongs_to.each do |assoc| -%>

  json.<%= assoc.name %> do
    json.(<%= singular_name %>.<%= assoc.name %>, :id, :name) if <%= singular_name %>.<%= assoc.name %>
  end
  <%- end -%>
end
