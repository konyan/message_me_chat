class ChatsroomController < ApplicationController

  def index
    @messages  = Message.all
  end
end
