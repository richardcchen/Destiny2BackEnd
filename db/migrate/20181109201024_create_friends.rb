class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.string :membershipId
      t.string :displayName
      t.string :system

      t.timestamps
    end
  end
end
