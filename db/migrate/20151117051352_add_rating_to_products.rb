class AddRatingToProducts < ActiveRecord::Migration
  def change
    add_column :products, :rating, :integer
    change_column :products, :price, :decimal, precision: 6, scale: 2
    change_column :products, :description, :text
  end
end
