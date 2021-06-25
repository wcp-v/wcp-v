class Admin::OrdersController < ApplicationController

    before_action :authenticate_admin!

  def show
     @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
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