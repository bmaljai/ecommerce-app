class AddFieldsToCategorizedProduct < ActiveRecord::Migration
  def change
    add_column :categorized_products, :product_id, :integer
    add_column :categorized_products, :category_id, :integer
  end
end
