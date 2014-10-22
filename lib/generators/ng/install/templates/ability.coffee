@app

.factory 'Ability', ->
  class Ability
    constructor: (@user) ->

    can: (action, model) ->
      !!@user
