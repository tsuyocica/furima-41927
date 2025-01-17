class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_author, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :description, :category_id,:condition_id,
      :delivery_fee_id, :region_id,:shipping_time_id, :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find_by(id: params[:id])
    if @item.nil?
      redirect_to root_path and return
    end
  end

  def redirect_if_not_author
    redirect_to root_path unless current_user == @item.user
  end
end
