class Group < ApplicationRecord
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :messages
  validate :add_error_sample
 
  def add_error_sample
    if name.blank?
      errors[:base] << "グループ名は必ず入力して下さい"
    end
  end
end
