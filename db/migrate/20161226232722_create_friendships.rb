class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      # this will create a table with a friend ID and a user ID
      t.belongs_to :user
      t.belongs_to :friend, class: "User"
      t.timestamps
    end
  end
end
