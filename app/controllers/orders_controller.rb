class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_invalid_access

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(
      :postal_code, :region_id, :city, :address_line, :building_name, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find_by(id: params[:item_id])
    if @item.nil?
      return redirect_to root_path
    end

    def redirect_if_invalid_access
      if current_user == @item.user || @item.order.present?
        redirect_to root_path
      end
    end

    def pay_item
      Payjp.api_key = "sk_test_c105f76b9125f27fd0c368b9"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

  end
end
