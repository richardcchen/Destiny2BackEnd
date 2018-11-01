class CreateManifestDamageTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :manifest_damage_types do |t|
      t.string :hashVal
      t.string :name
      t.string :description
      t.string :icon
      t.string :icontrans

      t.timestamps
    end
  end
end
