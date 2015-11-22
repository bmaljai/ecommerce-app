class ChangeImageFields < ActiveRecord::Migration
  def change
    rename_column :images, :image1, :url
    rename_column :images, :image2, :name
    rename_column :images, :image3, :description
    rename_column :images, :image4, :dimensions
    add_column :images, :size, :integer
  end
end
