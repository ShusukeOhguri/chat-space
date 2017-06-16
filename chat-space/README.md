    # DB設計
  
    ## users table
  
    |Column |Type   |Option                     |
    |:------|------:|:-------------------------:|
    |name   |string |null: false, index: true   |
    |mail   |string |null: false, unique: true  |
    |pass   |string |null: false                |
    ### Association
    ・has_many :messages
  
    ## messages table

    |Column   |Type     |Option                                       |
    |:--------|--------:|:-------------------------------------------:|
    |text     |text     |                                             |
    |image    |string   |                                             |
    |group_id |integer  |null: false , foreign_key: true              |
    |user_id  |integer  |null: false , foreign_key: true              |
    ### Association
    ・belongs_to :user
  
    ## groups table
    |Column     |Type     |Option                                       |
    |:----------|--------:|:-------------------------------------------:|
    |name       |string   |null: false , unique: true                   |
    ・has_many :users_to_groups
  
  
    ## groups_users table
    |Column   |Type     |Option                                       |
    |:--------|--------:|:-------------------------------------------:|
    |group_id |integer  |null: false , foreign_key: true              |
    |user_id  |integer  |null: false , foreign_key: true              |
    ### Association
    ・belongs_to :user
    ・belongs_to :group
