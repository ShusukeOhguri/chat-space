class MessagesController < ApplicationController
  before_action :get_group_info, only: [:index, :create]

  def index
    @groups = current_user.groups
    @group_members = @group.users
    @group_messages = @group.messages
    @message = Message.new(group_id: @group.id)
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージの作成に成功しました" }
        format.json
      end
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
      params.require(:message).permit(:text, :image).merge(user_id:current_user.id, group_id: @group.id)
    end

    def get_group_info
      @group = Group.find(params[:group_id])
    end
end
