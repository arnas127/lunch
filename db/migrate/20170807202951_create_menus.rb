class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.text :meals, null: false
      t.date :date, null: false
      t.references :restaurant, index: true, null: false

      t.timestamps
    end
  end
end
