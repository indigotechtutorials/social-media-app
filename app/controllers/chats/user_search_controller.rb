module Chats
  class UserSearchController < ApplicationController
    def create
      @users = User.where.not(id: current_user.id).where("username like ?", "%#{params[:q]}%")
      render turbo_stream: turbo_stream.update("user-results", partial: "user", collection: @users)
    end
  end
end