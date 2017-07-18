class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validate :add_error_sample
  mount_uploader :image, ImageUploader

  scope :search_message, -> (id){ where("group_id LIKE(?)", "%#{id}%") }

  def add_error_sample
    if text.blank? && image.blank?
      errors[:text] << "メッセージか画像は必ず入力して下さい"
      errors[:image] << "メッセージか画像は必ず入力して下さい"
    end

    if group_id.blank? || user_id.blank?
      errors[:group_id] << "グループIDがありません"
      errors[:user_id] << "ユーザーIDがありません"
    end
  end
end
