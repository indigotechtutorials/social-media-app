module Chats
  class ChatRequestsController < ApplicationController
    before_action :set_user
    def new; end

    def create
      @chat_request = ChatRequest.create(to_user: @user, from_user: current_user)
      redirect_to chats_path, notice: "Your chat request was sent ( We will let you know if they accept it )"
    end
  private
    def set_user
      @user = User.find(params[:user_id])
    end
  end
end