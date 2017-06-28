require 'rails_helper'
require 'pry-rails'

Rspec.describe Message, type: :model do
  describe '#create' do
    it "is invalid with a text" do
      message =  build(:message, image: nil)
      expect(message).to be_valid
    end

    it "is invalid with a image" do
      message =  build(:message)
      expect(message).to be_valid
    end

    it "is invalid with a text,image" do
      message =  build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a text,image" do
      message =  build(:message, text: nil, image: nil)
      message.valid?
      expect(message.errors[:text]).to include("メッセージか画像は必ず入力して下さい")
    end

    it "is invalid without a group_id" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group_id]).to include("グループIDがありません")
    end

    it "is invalid without a user_id" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user_id]).to include("ユーザーIDがありません")
    end
  end
end


 # message.errors.messages
