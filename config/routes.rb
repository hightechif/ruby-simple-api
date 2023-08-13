Rails.application.routes.draw do
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  concern :api_routes do
    
    resources :earthquakes, only: [:index, :show] do
      collection do
        get :fetch, to: 'earthquakes#get_data'
        get :more, to: 'earthquakes#get_more_data'
        get :less, to: 'earthquakes#get_less_data'
      end
    end

    resources :news, only: [:index, :show] do
      collection do
        get :fetch, to: 'news#get_data'        
      end
    end

    resources :weathers, only: [:index, :show] do
      collection do
        get :fetch, to: 'weathers#get_data'        
        get '/city/:location', to: 'weathers#get_weather_per_city'
      end
    end

  end

  namespace :api do
    namespace :v1 do
      concerns :api_routes
    end
  end
end
