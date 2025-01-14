class RenameBirthdayToBirthDateInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :birthday, :birth_date
  end
end