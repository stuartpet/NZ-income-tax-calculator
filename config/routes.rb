Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resource :calculator, only: %i[show create]
  root "calculators#show"
end
