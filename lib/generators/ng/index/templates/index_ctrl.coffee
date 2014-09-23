angular.module('<%= application_name %>')

.controller '<%= class_name.pluralize %>Ctrl', ['$scope', 'searcher', '<%= class_name %>'
  ($scope, searcher, <%= class_name %>) ->
    $scope.searcher = searcher($scope, <%= class_name %>, '<%= ng_plural_name %>')
]
