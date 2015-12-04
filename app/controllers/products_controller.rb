class ProductsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :authenticate_admin!, only: [:new, :create, :update, :destroy]


  def index
    @search = Product.find_by(name: params[:search])
    @showall = params[:showall]
    @images = Image.all
    
    @index = "active"
    @discountproducts = []

    @categories = Category.all
    
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

    if params[:category]
      @allproducts = Category.find_by(name: params[:category]).products
    end



  end
  
  def new
    @create = "active"
    @new_product = Product.new
    
  end

  def create
    Supplier.create(name: params[:supplier])
    @supplier_id = Supplier.last.id
    
    @new_product = Product.new(name: params[:name], price: params[:price], description: params[:description], stock: params[:stock], rating: params[:rating], supplier_id: @supplier_id, user_id: current_user.id)
    Image.create(name: "default", url: "https://git.reviewboard.kde.org/media/uploaded/files/2015/07/18/a70d8ab6-1bbf-4dcc-b11f-524c2f56b14a__picture_default_cover.jpg", product_id: Product.last.id)
    if @new_product.save
      flash[:success] ="Product Created"
      redirect_to "/products/#{@new_product.id}"
    else
      render :new
    end

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

