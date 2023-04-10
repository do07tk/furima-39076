class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    # @items = Item.all
    # @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
       redirect_to root_path
    else
       render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name,:content,:category_id,:situation_id,:load_id,:prefecture_id,:deliveryDay_id,:price,:image).merge(user_id: current_user.id)
  end
end
