class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #ActiveHashのアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship
  has_one    :purchase

  #その他のアソシエーション
  belongs_to :user

  #ファイル添付
  has_one_attached :image

  #バリデーション
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

  #ActiveHashのバリデーション
  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship
  end
end
