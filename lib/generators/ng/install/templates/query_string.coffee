@app

.factory 'queryString', ->
  (obj, prefix) ->
    str = []
    for k, v of obj
      p = if prefix then prefix + "[" + k + "]" else k
      if v instanceof Array
        str.push((k) + "=" + encodeURIComponent(val)) for val in v
      else if v != undefined && v != null
        str.push((k) + "=" + encodeURIComponent(v))
    str.join("&")
