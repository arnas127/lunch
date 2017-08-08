class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :employee, index: true, null: false
      t.references :menu, index: true, null: false

      t.timestamps
    end
  end
end
