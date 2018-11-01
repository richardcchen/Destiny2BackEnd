class CreateManifestItemTierTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :manifest_item_tier_types do |t|
      t.string :hashVal
      t.string :name

      t.timestamps
    end
  end
end
