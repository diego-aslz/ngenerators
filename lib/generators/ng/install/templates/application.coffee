#= require angular/angular
#= require angular-cookies/angular-cookies
#= require angular-bootstrap/ui-bootstrap-tpls
#= require angular-ui-router/release/angular-ui-router
#= require angular-rails-templates
#= require angularjs-rails-resource/angularjs-rails-resource
#= require angular-devise/lib/devise
#= require_tree ../templates
#= require_tree ./ng

@app = angular.module('APP_NAME', ['ui.router', 'templates', 'Devise', 'ui.bootstrap.tpls',
  'ui.bootstrap.typeahead', 'ui.bootstrap.modal', 'rails', 'ngCookies'])

.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest'

  $httpProvider.responseInterceptors.push ['$location', '$rootScope', '$q', ($location, $rootScope, $q) ->
      success = (response) ->
        response
      error   = (response) ->
        if response.status == 401
          $rootScope.$broadcast('event:unauthorized')
          $location.path('/')
          return response
        $q.reject(response)
      f = (promise) ->
        promise.then(success, error)
      f
    ]
]

.run ['User', 'Auth', (User, Auth) ->
  Auth['parse'] = (response) ->
    if response.status >= 200 && response.status < 300
      User.deserialize(response)
      response.data
    else
      null

  Auth.login()
]
