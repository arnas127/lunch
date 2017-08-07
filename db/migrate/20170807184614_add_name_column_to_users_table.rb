class AddNameColumnToUsersTable < ActiveRecord::Migration[5.1]
  def change
    # name will be usefull for restaurant type users
    add_column :users, :name, :string
  end
end
