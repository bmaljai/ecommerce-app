class OrdersController < ApplicationController

  def new
  end

  def create
    @sub_quant = params[:subtotal_mult]
    @tax_quant = params[:tax_mult]
    @total_quant = params[:total_mult]
    @quantity = params[:quantity].to_i

    @subtotal = @sub_quant * @quantity
    @tax = @tax_quant * @quantity
    @total = @total_quant * @quantity

    #@total = @subtotal + @tax
    #order = Order.create
    Order.create(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], subtotal: @subtotal, tax: @tax, total: @total)
   
      flash[:success] ="Product Ordered"
      redirect_to "/orders/#{Order.last.id}"
    # /orders/#{order.id}
    

  end

  def show
    @current_order = Order.find_by(id: params[:id])


  end



end
