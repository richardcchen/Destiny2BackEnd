class CreateManifestInventoryitems < ActiveRecord::Migration[5.2]
  def change
    create_table :manifest_inventoryitems do |t|
      t.string :hashVal
      t.string :name
      t.string :description
      t.string :icon
      t.string :screenshot
      t.string :itemTypeDisplayName
      t.string :itemTypeAndTierDisplayName
      t.string :tierTypeHash
      t.string :recoveryBucketTypeHash
      t.string :isInstanceItem

      t.timestamps
    end
  end
end
