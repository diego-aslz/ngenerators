module Api
  class <%= plural_name.camelize %>Controller < BaseController
    <%- if options.model -%>
    defaults resource_class: <%= options.model.try(:camelize) %>
    <%- end -%>
  end
end
