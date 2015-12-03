class CartedProductsController < ApplicationController

  def index
    # @user_cart = CartedProduct.where(user_id: current_user.id).where(status: "carted")
    # @user_cart = current_user.carted_products.where(status:"carted")

    if current_user.carted_products.where(status:"carted").any?
         @user_cart = current_user.carted_products.where(status:"carted")
    else
      redirect_to "/products"
    end
  end



  def create
    CartedProduct.create(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "carted")

    redirect_to "/carted_products"


  end

  def destroy
    CartedProduct.find_by(id: params[:id]).update(status: "removed")
    redirect_to "/carted_products"
  end




end
