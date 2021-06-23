class HomesController < ApplicationController

  def top
    @items = Item.all.order(created_at: :desc).limit(4)  #:desc 新しい順に並べる
  end

  def about
  end

end
