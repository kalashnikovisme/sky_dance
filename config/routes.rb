SkyDance::Application.routes.draw do
  
  root :to => "welcome#index"  

  match "/404" => "errors#not_found"
  match "admin" => "admins#login"

  resources :teachers do
    resources :teacher_photos
  end
  resources :admins do
    collection do
      post "login"
      get "logout" => "admins#logout"
      get "panel" => "admins#panel"
    end
  end
  
  resource :teacher_photos
end
