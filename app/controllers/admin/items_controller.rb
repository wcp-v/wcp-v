class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!  #ログイン済のユーザのみアクセスを許可

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)   #notice: "商品を追加しました" フラッシュメッセージについては相談
    else
      render :new
    end
  end

  def index
    @items = Item.all
    # @items = Item.all.page(params[:page]).per(10)    kaminari導入後にコメントアウト消して、一行上の記述を消す
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item) #notice: "商品を更新しました。" フラッシュメッセージについては相談
    else
      render :edit
    end 
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :genre_id, :is_active)
  end

end