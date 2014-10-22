@app

.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/welcome"

  $stateProvider
    .state 'welcome',
      url: "/welcome"
      templateUrl: 'welcome/index.html'
]
