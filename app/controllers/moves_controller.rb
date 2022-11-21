class MovesController < ApplicationController 
    def send_move  
        @start = params[:start]
        @end = params[:end]
        @color = params[:color]
        @room_id = params[:room]

        @room = Room.where({:game_id => @room_id}).first
        @move = Move.create({:start => @start, :end => @end, :room => @room, :color => @color})
        render json: @move
        # broadcast the move to opponent
        RoomsChannel.broadcast_to(@room, @move)
    end
end