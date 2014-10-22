@app

.controller 'ApplicationCtrl', ['$scope', 'Auth', 'Ability', ($scope, Auth, Ability) ->
  $scope.currentUser    = null
  $scope.currentAbility = null

  $scope.logout = ->
    Auth.logout().then ->
      $scope.setCurrentUser null

  $scope.setCurrentUser = (user) ->
    ability = new Ability(user)
    $scope.currentUser    = user
    $scope.currentAbility = ability
    $scope.can = (action, model) ->
      ability.can(action, model)

  $scope.$on 'devise:login', (event, currentUser) ->
    $scope.setCurrentUser currentUser
]
