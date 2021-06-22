class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all  #同じ商品を異なるタイミングでカートに入れたとき個数が統合される。
      if @cart_item.count != nil
         @cart_items.each do |cart_item|
         if cart_item.item_id == @cart_item.item_id
            new_count= cart_item.count + @cart_item.count
            cart_item.update_attribute(:count, new_count)
            @cart_item.delete
         end
         end
      end
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:cart_item][:id])
    @cart_item.update(count: params[:cart_item][:count])
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:count,:item_id,:customer_id)
  end

end
