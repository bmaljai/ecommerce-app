class ProductsController < ApplicationController
  
  def index
    @search = Product.find_by(name: params[:search])
    @showall = params[:showall]
    @images = Image.all
    
    @index = "active"
    @discountproducts = []
    
    if @showall == "no"
      Product.all.each do |product|
        if product.sale_message == "This item is on sale"
          @discountproducts << product
        end
      end
      @allproducts = @discountproducts
    else
      @allproducts = Product.all
    end
    

    if params[:lowtohigh] == 'true'
      @allproducts = Product.order(price: :asc)
    end
    if params[:hightolow] == 'true'
      @allproducts = Product.order(price: :desc)
    end

  end
  
  def new
    @create = "active"
    
  end

  def create
    
    Product.create(name: params[:name], price: params[:price], description: params[:description], image: params[:image], stock: params[:stock], rating: params[:rating])
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
    Product.find_by(id: params[:id]).update(id: params[:id], name: params[:name], price: params[:price], description: params[:description], image: params[:image], stock: params[:stock], rating: params[:rating])
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

  def search
    @search = Product.find_by(name: params[:search])
    redirect_to "/products/#{@search.id}"
  end


end

