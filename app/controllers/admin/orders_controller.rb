class Admin::OrdersController < ApplicationController

    before_action :authenticate_admin!

  def show
     @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order.update(order_params)
    if @order.status == "入金確認"
	     @order_items.update_all(status: 1)
	  end
    redirect_to admin_root_path
  end


  private

    # def order_item_params
    #   params.permit(:status).merge(status: 1)
    # end

    def order_params
      params.require(:order).permit(:status, order_item_attributes:[:id, :status])
    end

end