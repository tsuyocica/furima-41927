
class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :region_id, :city, :address_line, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address_line
    validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input only number" },
                             length: { in: 10..11, message: "is too short (minimum is 10 characters)" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      order_id: order.id,
      postal_code: postal_code,
      region_id: region_id,
      city: city,
      address_line: address_line,
      building_name: building_name,
      phone_number: phone_number
    )
  end
end
