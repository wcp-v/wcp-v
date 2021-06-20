class Admin::ItemsController < ApplicationController
  # before_action :set_item, only: [:show, :edit, :update]
  # before_action :set_genres, only: [:new, :edit, :index, :create, :update]
  before_action :authenticate_admin!  #ログイン済のユーザのみアクセスを許可

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :genre_id, :is_active)
  end

end
