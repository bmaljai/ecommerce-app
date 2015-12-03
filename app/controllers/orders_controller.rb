class OrdersController < ApplicationController

  def new
  end

  def create
    @user_cart_order = current_user.carted_products.where(status:"carted")
    @subtotal = 0
    @tax = 0
   
    @user_cart_order.each do |order_item|
      @subtotal += (order_item.product.price * order_item.quantity)
      @tax += (order_item.product.tax * order_item.quantity)
    end
    
    @total = @subtotal + @tax

    # @sub_quant = params[:subtotal_mult]
    # @tax_quant = params[:tax_mult]
    # @total_quant = params[:total_mult]
    # @quantity = params[:quantity].to_i

    # @subtotal = @sub_quant * @quantity
    # @tax = @tax_quant * @quantity
    # @total = @total_quant * @quantity

    #@total = @subtotal + @tax
    #order = Order.create
    Order.create(user_id: current_user.id, subtotal: @subtotal, tax: @tax, total: @total)

    @order_id_for_cart = Order.last.id

    @user_cart_order.each do |order_item|
      order_item.update(status: "purchased", order_id: @order_id_for_cart)
    end

   
      flash[:success] ="Product Ordered"
      redirect_to "/orders/#{@order_id_for_cart}"
    # /orders/#{order.id}
    

  end

  def show
    @current_order = Order.find_by(id: params[:id])


  end



end
