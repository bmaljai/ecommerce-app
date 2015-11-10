class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :description
      t.string :image
      t.string :stock

      t.timestamps null: false
    end
  end
end
