# データベース設計

## テーブル一覧

- Users（ユーザー管理機能）
- Products（商品出品機能）
- Orders（商品購入機能）
- Addresses（配送先情報）

---

## Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### アソシエーション

- has_many :products
- has_many :orders

---

## Products テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false (ActiveHash)       |
| condition_id     | integer    | null: false (ActiveHash)       |
| delivery_fee_id  | integer    | null: false (ActiveHash)       |
| region_id        | integer    | null: false (ActiveHash)       |
| shipping_time_id | integer    | null: false (ActiveHash)       |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :user
- has_one :order

---

## Orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :user
- belongs_to :product
- has_one :address

---

## Addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order_id      | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| region_id     | integer    | null: false (ActiveHash)       |
| city          | string     | null: false                    |
| address_line  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### アソシエーション

- belongs_to :order

---

## ActiveHash を利用するデータ

- Products テーブル
  - category_id
  - condition_id
  - delivery_fee_id
  - region_id
  - shipping_time_id
- Addresses テーブル
  - region_id
