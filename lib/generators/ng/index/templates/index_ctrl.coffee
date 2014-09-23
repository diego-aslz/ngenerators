angular.module('<%= application_name %>')

.controller '<%= plural_name.camelize %>Ctrl', ['$scope', 'searcher', '<%= class_name %>'
  ($scope, searcher, <%= class_name %>) ->
    $scope.searcher = searcher($scope, <%= class_name %>, '<%= ng_plural_name %>')
]
