angular.module('<%= application_name %>')

.controller '<%= plural_name.camelize %>Ctrl', ['$scope', 'searcher', '<%= class_name %>'
  ($scope, searcher, <%= class_name %>) ->
    $scope.searcher = searcher($scope, <%= class_name %>, '<%= ng_plural_name %>')
    <%- klass.columns.each do |column| -%>
    <%- if (assoc = association_for(column)) -%>
    # FOR TYPEAHEAD
    $scope.<%= assoc.plural_name %> = (filter) ->
      <%= assoc.class_name %>.$get(<%= assoc.class_name %>.$url('ahead'), by_name: filter)
    # END OF TYPEAHEAD
    # FOR SELECT
    <%= assoc.plural_name %>.query().then (<%= assoc.plural_name %>) ->
      $scope.<%= assoc.plural_name %> = <%= assoc.plural_name %>
    # END OF SELECT

    <%- end -%>
    <%- end -%>
]
