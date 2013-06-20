SkyDance::Application.routes.draw do

  root :to => "welcome#index"

  match "/404" => "errors#not_found"
  match "admin" => "admins#login"

  resources :photos, :only => [:new, :edit, :destroy]
  resources :teachers do
    member do
      get 'add_photo' => "photos#create"
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
  resources :categories, :only => [:new, :edit, :destroy]
  resources :groups, :only => [:new, :edit, :destroy]
  resources :lessons, :except => :show

  resources :videos, :only => [:new, :edit, :destroy]
  resources :genres do
    member do
      get 'add_video' => "videos#create"
    end
  end

  get ':controller/:action/:group_id'
end
