class RoomsController < ApplicationController
  def index
    render json: Room.all
  end

  def create
    @game_id = Random.new.rand(1_000_000..10_000_000_0-1)
    @room = Room.create!({:game_id => @game_id})
    # prevent duplicate room ids 
    while Room.exists?(game_id: @game_id) 
      @game_id = Random.new.rand(1_000_000..10_000_000-1)
    end
    render json: @room
  end
  
  def get_moves_in_game 
    @room = Room.where({:game_id => params[:room_id]}).first 
    @moves = Move.where({:room_id => @room.id})

    render json: @moves
  end

  def update_join_status 
    @room = Room.find_by({:game_id => params[:room_id]})
    RoomsChannel.broadcast_to(@room, "joined")
  end
end
