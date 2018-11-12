class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :commenter_id
      t.string :itemName
      t.string :itemUrl
      t.string :itemType
      t.string :commenterName
      t.string :instanceId

      t.timestamps
    end
  end
end
