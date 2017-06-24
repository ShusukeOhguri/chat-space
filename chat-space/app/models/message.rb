class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validate :add_error_sample
  mount_uploader :image, ImageUploader

  def add_error_sample
    if text.blank? && image.blank?
      errors[:base] << "メッセージか画像は必ず入力して下さい"
    end
  end
end
