class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.integer :manifest_inventoryitem_id
      t.string :hashVal
      t.string :value
      t.string :min
      t.string :max
      t.timestamps
    end
  end
end
