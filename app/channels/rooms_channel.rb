class RoomsChannel < ApplicationCable::Channel
    def subscribed
      game_room = Room.where(:game_id => params[:game_id]).first
      stream_for game_room
    end
  
    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
end
  