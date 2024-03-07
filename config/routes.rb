Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :encryptions, only: [] do
        post :cashfree, on: :collection
      end
    end
  end
end
