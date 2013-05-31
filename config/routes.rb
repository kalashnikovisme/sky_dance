SkyDance::Application.routes.draw do
  match "/404" => "errors#not_found"

  resources :teachers
end
