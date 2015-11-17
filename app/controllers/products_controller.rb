class ProductsController < ApplicationController
  def index
    @index = "active"
    
    @allproducts = Product.all

  end
  
  def new
    @create = "active"
    
  end

  def create
    
    Product.create(name: params[:name], price: params[:price], description: params[:description], image: params[:image], stock: params[:stock])
    flash[:success] ="Product Created"
    redirect_to "/products"

  end

  def show
    @fetch_product = Product.find_by(id: params[:id])
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    Product.find_by(id: params[:id]).update(id: params[:id], name: params[:name], price: params[:price], description: params[:description], image: params[:image], stock: params[:stock])
    flash[:Warning] ="Product Updated"
    redirect_to "/products"

  end

  def destroy
      id = params[:id]
    product = Product.find_by(id: id)
    product.destroy
    flash[:warning] ="Product Deleted"
    redirect_to "/products"
  
  end


end

