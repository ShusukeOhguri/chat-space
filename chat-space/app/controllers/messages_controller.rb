class MessagesController < ApplicationController
  before_action :get_group_info, only: [:index, :create]

  def index
    @groups = current_user.groups
    @group_members = @group_info.users
    @group_messages = @group_info.messages
    @message = current_user.messages.new(group_id: @group_info.id)
  end

  def create
    @message = current_user.messages.new(create_params)
    if @message.save
      redirect_to group_messages_path, notice: "メッセージの作成に成功しました"
    else
      redirect_to group_messages_path, alert:"メッセージの作成に失敗しました"
    end
  end

  def show
  end

  def edit
  end

   private
    def create_params
      params.require(:message).permit(:text, :image).merge(group_id: @group_info.id)
    end

    def get_group_info
      @group_info = Group.find(params[:group_id])
    end
end
