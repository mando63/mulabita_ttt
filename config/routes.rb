Rails.application.routes.draw do

  namespace :tic_tac_api do
    namespace :v1 do
      resources :game_service
      resources :play_service
    end
  end
end
