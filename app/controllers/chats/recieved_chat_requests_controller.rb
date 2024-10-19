module Chats
  class RecievedChatRequestsController < ApplicationController
    def index; end

    def create
      chat_request = current_user.recieved_chat_requests.find_by(from_user_id: params[:from_user_id])
      chat_request.update(accepted: params[:accepted])
      redirect_to chats_path, notice: "You accepted #{chat_request.from_user.username}'s request to chat"
    end
  end
end