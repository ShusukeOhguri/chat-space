class MessagesController < ApplicationController
  
  def index
    @group_info = current_user.groups
  end
  
end
