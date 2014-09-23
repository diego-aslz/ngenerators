angular.module('<%= application_name %>')

.controller '<%= class_name %>Ctrl', ['$scope', '$stateParams', '<%= class_name %>',
  ($scope, $stateParams, <%= class_name %>) ->
    <%= class_name %>.get({ id: $stateParams.id }).then (<%= ng_singular_name %>) ->
      $scope.<%= ng_singular_name %> = <%= ng_singular_name %>
]
