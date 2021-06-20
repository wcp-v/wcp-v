class Admin::OrdersController < ApplicationController
    
    before_action :customer_shut_out
    
  
  
  def show
     @order = Order.find(params[:id])
  end 
  
  def update
      @order = Order.find(params[:id])
    order_items = @order.order_items
    @order.update(order_params)
    if @order.order_status === "入金確認"
      order_items.each do |order_item|
        order_item.update(order_item_params)
      end
    end
    @orders = Order.page(params[:page]).per(10)
    redirect_to admin_orders_path
  end      
  
  private

    def order_item_params
      params.permit(:maiking_status).merge(maiking_status: 1)
    end

    def order_params
      params.require(:order).permit(:order_status).merge(order_status: params[:order][:order_status].to_i)
    end
  
end