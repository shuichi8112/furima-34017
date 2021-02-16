class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, create]

  # def index
  #   @items = Item.all
  # end
  #一覧機能実装時使用

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
