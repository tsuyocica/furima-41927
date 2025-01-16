class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #ActiveHashのアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :region
  belongs_to :shipping_time

  #その他のアソシエーション
  belongs_to :user

  #ファイル添付
  has_one_attached :image

  #バリデーション
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

  #ActiveHashのバリデーション
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :region_id
    validates :shipping_time_id
  end
end
