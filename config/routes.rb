SkyDance::Application.routes.draw do

  root :to => "welcome#index"

  match "/404" => "errors#not_found"
  match "admin" => "admins#login"

  resources :photos, :except => [:show, :index, :edit]

  resources :teachers do
    member do
      get 'admins_photo' => "photos#create"
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
    end
  end
  resources :categories, :except => [:show, :index] do
    collection do
      get 'edit_all'
    end
  end
  resources :groups, :except => [:show, :index]
  resources :lessons, :except => :show

  resources :videos, :except => [:show, :index]

  resources :genres do
    member do
      get 'admins_video' => "videos#create"
    end
  end

  get ':controller/:action/:group_id'
end
