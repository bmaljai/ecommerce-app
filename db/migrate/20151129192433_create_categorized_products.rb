class CreateCategorizedProducts < ActiveRecord::Migration
  def change
    create_table :categorized_products do |t|

      t.timestamps null: false
    end
  end
end
