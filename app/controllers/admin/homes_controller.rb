class Admin::HomesController < ApplicationController
  
 def top
    @orders = Order.all.page(params[:page]).reverse_order.per(10)
  
 end
end
