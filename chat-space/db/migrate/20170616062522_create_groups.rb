class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :group_id, index: true, null: false, foreign_key: true
      t.integer :user_id, index: true, null: false, foreign_key: true
      t.string  :name, null: false
      t.string  :message
    end
  end
end
