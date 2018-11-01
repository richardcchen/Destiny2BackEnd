class CreateManifestClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :manifest_classes do |t|
      t.string :hashVal
      t.string :name

      t.timestamps
    end
  end
end
