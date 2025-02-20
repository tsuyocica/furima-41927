class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # アソシエーション
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は英字と数字の両方を含む必要があります' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナで入力してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナで入力してください' }
    validates :birth_date
  end
end
