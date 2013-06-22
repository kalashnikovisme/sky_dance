SkyDance::Application.routes.draw do

  root :to => "welcome#index"

  match "/404" => "errors#not_found"
  match "admin" => "admins#login"
  get "schedule" => "lessons#schedule"

  resources :groups, :except => [:show, :index] do
    member do
      resources :lessons, :except => [:show, :index]
    end
  end

  resources :teachers do
    member do
      resources :photos, :except => [:show, :index, :edit] do
        collection do
          get 'admins'
        end
      end
    end
  end

  resources :admins do
    collection do
      post "login"
      get "logout" => "admins#logout"
      get "panel" => "admins#panel"
    end
  end

  resources :welcome do
    collection do
      get "about"
      get "contacts"
      get "place"
    end
  end

  resources :categories, :except => [:show, :index] do
    collection do
      get 'admins'
    end
  end

  resources :genres do
    member do
      resources :videos, :except => [:show, :index] do
        collection do
          get 'admins'
        end
      end
    end
  end

  get ':controller/:action/:group_id'
end
