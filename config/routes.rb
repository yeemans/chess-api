Rails.application.routes.draw do
  resources :rooms
  get "/room/create", to: "rooms#create"
  get "/:room_id/moves", to: "rooms#get_moves_in_game"
  post "/send_move", to: "moves#send_move"
  post "/update_room_status", to: "rooms#update_join_status"
  mount ActionCable.server => '/cable'
end
