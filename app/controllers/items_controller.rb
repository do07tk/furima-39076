class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_items, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

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

  def show
  end

  def edit
    if current_user.id != @item.user.id
       redirect_to root_path
    elsif (current_user.id == @item.user.id) && @item.order.present?
       redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item.id)
    else
       render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if (user_signed_in? && current_user.id == item.user.id)
      item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name,:content,:category_id,:situation_id,:load_id,:prefecture_id,:deliveryday_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end

end
