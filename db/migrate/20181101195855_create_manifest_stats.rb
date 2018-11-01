class CreateManifestStats < ActiveRecord::Migration[5.2]
  def change
    create_table :manifest_stats do |t|
      t.string :hashVal
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
