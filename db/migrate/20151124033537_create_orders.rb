class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :subtotal, precision: 10, scale: 2
      t.decimal :tax, precision: 7, scale: 2
      t.decimal :total, precision: 14, scale: 2

      t.timestamps null: false
    end
  end
end
