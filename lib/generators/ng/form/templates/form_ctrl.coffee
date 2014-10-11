angular.module('<%= application_name %>')

.controller '<%= class_name %>FormCtrl', ['$scope', '$stateParams', <%= ([class_name] + belongs_to_class_names).map{ |k| "'#{k}'"}.join(', ') %>,
  ($scope, $stateParams, <%= ([class_name] + belongs_to_class_names).join(', ') %>) ->
    if $stateParams.id
      <%= class_name %>.get($stateParams.id).then (<%= ng_singular_name %>) ->
        $scope.<%= ng_singular_name %> = <%= ng_singular_name %>
    else
      $scope.<%= ng_singular_name %> = new <%= class_name %>()
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
