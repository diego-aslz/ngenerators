json.array!(@<%= plural_name %>) do |<%= singular_name %>|
  json.(<%= singular_name %>, <%= symbolic_columns.join(', ') %>)
  json.count @count
end
