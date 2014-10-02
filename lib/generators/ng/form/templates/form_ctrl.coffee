angular.module('<%= application_name %>')

.controller '<%= class_name %>FormCtrl', ['$scope', '<%= class_name %>',
  ($scope, <%= class_name %>) ->
    $scope.<%= ng_singular_name %> = new <%= class_name %>()
]
