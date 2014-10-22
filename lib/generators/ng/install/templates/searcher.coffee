@app

.factory 'searcher', ['queryString', '$cookieStore', 'Toggler', '$timeout',
  (queryString, $cookieStore, Toggler, $timeout) ->
    (scope, Model, key) ->
      filtersKey = key + 'Filters'
      scope.filters = $cookieStore.get(filtersKey) || {}

      parsed = (params) ->
        result = {}
        for k, v of params
          result[k] = if angular.isObject(v) && !angular.isDate(v) && !angular.isArray(v)
            v.id
          else
            v
        result
      search = ->
        $cookieStore.put filtersKey, scope.filters
        Model.query(parsed(scope.filters)).then (models) ->
          scope[key] = models
          scope.count = 0
          scope.count = models[0].count if models.length
      clear = ->
        scope.filters = {}
        search()
      qString = ->
        queryString(parsed(scope.filters))

      search()

      {
        search: search
        clear:  clear
        toggleArrayProperty: Toggler.toggleArrayProperty
        queryString: qString
        parsed: parsed
      }
]
