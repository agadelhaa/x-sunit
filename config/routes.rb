Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :survivors do
        collection do
          get :percentage_of_abducted
          get :percentage_of_non_abducted
        end
      end
      resources :abductions, only: %i[show create]
    end
  end
end
