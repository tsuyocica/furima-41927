class AddConstraintsToItems < ActiveRecord::Migration[7.0]
  def change
    change_column_null :items, :name, false
    change_column_null :items, :description, false
    change_column_null :items, :category_id, false
    change_column_null :items, :condition_id, false
    change_column_null :items, :delivery_fee_id, false
    change_column_null :items, :region_id, false
    change_column_null :items, :shipping_time_id, false
    change_column_null :items, :price, false
  end
end
