# DB設計

## users table
|Column |Type   |Option                                 |
|:------|------:|:-------------------------------------:|
|name   |string |null: false, index: true, unique: true |
|mail   |string |null: false, unique: true              |
|pass   |string |null: false                            |
### Association
・has_many :messages
・has_many :groups, through: :groups_users
・has_many :groups_users

## messages table
|Column   |Type     |Option                                       |
|:--------|--------:|:-------------------------------------------:|
|text     |text     |                                             |
|image    |string   |                                             |
|group_id |integer  |null: false , foreign_key: true              |
|user_id  |integer  |null: false , foreign_key: true              |
### Association
・belongs_to :user
・belongs_to :group

## groups table
|Column     |Type     |Option                                       |
|:----------|--------:|:-------------------------------------------:|
|name       |string   |null: false , unique: true                   |
### Association
・has_many :users, through: :groups_users
・has_many :messages
・has_many :groups_users

## groups_users table
|Column   |Type     |Option                                       |
|:--------|--------:|:-------------------------------------------:|
|group_id |integer  |null: false , foreign_key: true              |
|user_id  |integer  |null: false , foreign_key: true              |
### Association
・belongs_to :user
・belongs_to :group
