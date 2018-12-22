class ChatController < ApplicationController
  def create
     current_user_char_rooms = ChatRoomUser.where(user_id: current_user.id).map(&:chat_room)
     chat_room = ChatRoomUser.where(chat_room: current_user_char_rooms, user_id: params[:user_id]).map(&:chat_room).first
　　　
     if chat_room.blank?
      chat_room = ChatRoom.create
      ChatRoomUser.create(chat_room: chat_room, user_id: current_user.id)
      ChatRoomuser.create(chat_room: chat_room, user_id: params[:user_id])
     end

     redirect_to action: :show, id: chat_room.id
  end

  def show
  end
end
