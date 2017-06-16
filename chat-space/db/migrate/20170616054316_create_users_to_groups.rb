class CreateUsersToGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :users_to_groups do |t|
      t.integer :group_id, index: true, null: false, foreign_key: true
      t.integer :user_id, index: true, null: false, foreign_key: true
    end
  end
end
