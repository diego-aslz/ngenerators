@app

.factory 'Toggler', ->
  toggleArray = (ary, key) ->
    idx = ary.indexOf(key)
    if idx > -1
      ary.splice(idx, 1)
    else
      ary.push(key)

  toggleArrayProperty = (object, prop, value) ->
    object[prop] = [] unless object[prop]
    toggleArray object[prop], value

  {
    toggleArray: toggleArray
    toggleArrayProperty: toggleArrayProperty
  }
