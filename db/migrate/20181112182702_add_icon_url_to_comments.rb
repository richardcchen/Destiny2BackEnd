class AddIconUrlToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :iconUrl, :string
  end
end
