SkyDance::Application.routes.draw do

  root :to => "welcome#index"

  match "/404" => "errors#not_found"
  match "admin" => "admins#login"

  resources :photos
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

  resources :groups
  resources :videos
  resources :genres do
    member do
      get 'add_video' => "videos#create"
    end
  end
end
