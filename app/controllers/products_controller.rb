class ProductsController < ApplicationController
  def productpage
    @allproducts = Product.all
  end
end
