class MessagesController < ApplicationController
  before_action :get_group_info, only: [:index, :create]

  def index
    @groups = current_user.groups
    @group_members = @group.users
    @group_messages = @group.messages
    @message = Message.new
  end

  def create
    @message = @group.messages.new(create_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージの作成に成功しました" }
        format.json
      end
    else
      redirect_to group_messages_path, alert:"メッセージの作成に失敗しました"
    end
  end

  def index_update
    update_message_create
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
    def create_params
      params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
    end

    def get_group_info
      @group = Group.find(params[:group_id])
    end

    def update_message_create
      @messages = []
      group_messages = Message.search_message(params[:group_id])
      group_messages.each do |message|
        if message[:created_at].to_i > params[:update_time].to_i
          @messages << message
        end
      end
    end
end
