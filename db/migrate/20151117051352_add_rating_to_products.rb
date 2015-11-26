class AddRatingToProducts < ActiveRecord::Migration
  def change
    add_column :products, :rating, :integer
    change_column :products, :price, 'numeric USING price::numeric(6,2)'
    change_column :products, :description, :text
  end
end
