class AddSystemToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :system, :string
  end
end
