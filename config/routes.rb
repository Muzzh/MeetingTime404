Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  resources :chess_pieces, only: [:create, :update]
  resources :games, except: [:edit, :destroy] do
    get 'offer_draw'
    #get 'decline_draw'
    post 'forfeit'
    post 'accept_draw'
  end

  get 'decline_draw', to: 'games#decline_draw'
  #get 'games/:game_id/decline_draw', to: 'games#decline_draw', as: :decline_draw

  get 'games/:id/select_piece/:chess_piece_id', to: 'games#show', as: :select_piece

  put 'games/:id/move_piece/:chess_piece_id/:x_target/:y_target', to: 'games#move_piece', as: :move_to

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
