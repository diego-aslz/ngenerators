angular.module('<%= application_name %>')

.controller '<%= plural_name.camelize %>Ctrl', ['$scope', 'searcher', <%= ([class_name] + belongs_to_class_names).map{ |k| "'#{k}'"}.join(', ') %>
  ($scope, searcher, <%= ([class_name] + belongs_to_class_names).join(', ') %>) ->
    $scope.searcher = searcher($scope, <%= class_name %>, '<%= ng_plural_name %>')
    <%- klass.columns.each do |column| -%>

    <%- if (assoc = association_for(column)) -%>
    # FOR TYPEAHEAD
    $scope.<%= assoc.plural_name %> = (filter) ->
      <%= assoc.class_name %>.$get(<%= assoc.class_name %>.$url('ahead'), by_name: filter)
    # END OF TYPEAHEAD
    # FOR SELECT
    <%= assoc.class_name %>.query().then (<%= assoc.plural_name.camelize(:lower) %>) ->
      $scope.<%= assoc.plural_name.camelize(:lower) %> = <%= assoc.plural_name.camelize(:lower) %>
    # END OF SELECT
    <%- end -%>
    <%- end -%>
]
