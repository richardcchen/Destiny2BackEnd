class CreateManifestPerks < ActiveRecord::Migration[5.2]
  def change
    create_table :manifest_perks do |t|
      t.string :hashVal
      t.string :name
      t.string :description
      t.string :icon

      t.timestamps
    end
  end
end
