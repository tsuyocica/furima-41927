class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :redirect_if_not_author, only: [:edit, :update]

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

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :description, :category_id,
      :condition_id, :delivery_fee_id, :region_id,
      :shipping_time_id, :price
    ).merge(user_id: current_user.id).compact_blank
  end

  def set_item
    @item = Item.find_by(id: params[:id])
    redirect_to root_path if @item.nil?
  end

  def redirect_if_not_author
    redirect_to root_path unless current_user == @item.user
  end
end
