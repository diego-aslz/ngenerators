angular.module('<%= application_name %>')

.directive '<%= ng_singular_name %>', ->
  restrict: 'AE'
  <%- if options.template? -%>
  templateUrl: "directives/<%= directive_name %>.html"
  <%- else -%>
  template: "<span></span>"
  <%- end -%>
  link: (scope) ->
