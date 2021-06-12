Rails.application.routes.draw do
  namespace :api do
      resources :characters, :path => "character"
      resources :episodes, :path => "episode"
  end
  devise_for :users
end
