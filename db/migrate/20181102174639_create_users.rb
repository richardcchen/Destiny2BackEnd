class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :displayName
      t.string :membershipId
      t.string :charId1
      t.string :charId2
      t.string :charId3
      t.string :membershipType

      t.timestamps
    end
  end
end
