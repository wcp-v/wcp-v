class OrdersController < ApplicationController
      include ApplicationHelper
  
  before_action :to_confirm, only: [:show]
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @customer = current_customer
    @address = Address.all
    @orders = Order.all
  end

  def confirm
@cart_items = current_customer.cart_items
    @total = 0
    obj = address_params
    obj[:payment] = obj[:payment].to_i
    @order = Order.new(obj)
    if params[:order][:address_a] == "0"
      @order.post_address = current_customer.post_number
      @order.street_address = current_customer.street_address
      @order.address = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_a] == "1"
      @sta = params[:order][:order].to_i
      @order_address = Address.find(@sta)
      @order.postcode = @order_address.post_address
      @order.street_address  = @order_address.street_address
      @order.address  = @order_address.address
    elsif params[:order][:address_a] == "2"
      @order.post_address = params[:order][:postcode]
      @order.street_address = params[:order][:address]
      @order.address = params[:order][:address]
    end
  end
  
  def create
    @customer = current_customer
    obj = order_params
    obj[:payment] = obj[:payment].to_i
    @order = Order.new(obj)
    @order.customer_id = current_customer.id
    @order.save
    create_all_ordered_products(@order)
    redirect_to orders_complete_path
  end

  def complete
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.orders_items
  end
  
  private
  def order_params
    params.require(:order).permit(:shipping_cost, :payment, :postcode, :address, :destination)
  end
  
  def address_params
    params.require(:order).permit(:postcode, :address, :destination)
  end
  
  def to_confirm
    redirect_to customer_items_path if params[:id] == "confirm"
  end
end
