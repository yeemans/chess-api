class MovesChannel < ApplicationCable::Channel
  def subscribed
    game_room = Room.where(:room_id => params[:room_id]).first
    stream_for game_room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
