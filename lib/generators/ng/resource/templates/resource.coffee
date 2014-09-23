angular.module('<%= application_name %>')

.factory '<%= class_name %>', ['RailsResource', (RailsResource) ->
  class <%= class_name %> extends RailsResource
    @configure
      url: '/api/<%= plural_name %>'
      name: '<%= singular_name %>'
]
