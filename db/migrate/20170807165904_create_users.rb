class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :type
      t.string :token
      t.string :password_digest

      t.timestamps

      t.index :token, name: 'index_users_on_token'
    end
  end
end
