angular.module('<%= application_name %>')

.controller '<%= plural_name.camelize %>Ctrl', ['$scope', 'searcher', <%= ([class_name] + belongs_to_class_names).map{ |k| "'#{k}'"}.join(', ') %>
  ($scope, searcher, <%= ([class_name] + belongs_to_class_names).join(', ') %>) ->
    $scope.searcher = searcher($scope, <%= class_name %>, '<%= ng_plural_name %>')
    <%- attributes.each do |attribute| -%>
    <%- # TYPEAHEAD -%>
    <%- if attribute.type == :typeahead -%>
    <%- assoc = association_for(attribute, by: :name) -%>

    $scope.<%= ng_var(assoc.plural_name) %> = (filter) ->
      <%= assoc.klass %>.$get(<%= assoc.klass %>.$url('ahead'), byName: filter)
    <%- # SELECT -%>
    <%- elsif attribute.type == :select -%>
    <%- assoc = association_for(attribute, by: :name) -%>

    <%= assoc.klass %>.query().then (<%= ng_var(assoc.plural_name) %>) ->
      $scope.<%= ng_var(assoc.plural_name) %> = <%= ng_var(assoc.plural_name) %>
    <%- # CHECKBOXES -%>
    <%- elsif attribute.type == :checkboxes -%>
    <%- if (assoc = association_for(attribute, by: :name)) -%>

    <%= assoc.klass %>.query(inUse: true).then (<%= ng_var(assoc.plural_name) %>) ->
      $scope.<%= ng_var(assoc.plural_name) %> = <%= ng_var(assoc.plural_name) %>
    <%- else -%>

    $scope.<%= ng_var(attribute.name.pluralize) %> = []
    <%- end -%>
    <%- end -%>
    <%- end -%>
]
