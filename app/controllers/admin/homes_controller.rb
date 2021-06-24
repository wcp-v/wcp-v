class Admin::HomesController < ApplicationController
  
 def top
    @orders = Order.page(params[:page]).reverse_order.per(10)
  
 end
end
