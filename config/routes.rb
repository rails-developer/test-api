Rails.application.routes.draw do
  get 'example', to: 'api/v1/resources#show', defaults: { format: "json" }
end
