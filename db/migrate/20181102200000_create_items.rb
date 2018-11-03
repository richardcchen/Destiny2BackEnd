class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :itemHash
      t.string :itemInstanceId
      t.string :bucketHash

      t.timestamps
    end
  end
end
