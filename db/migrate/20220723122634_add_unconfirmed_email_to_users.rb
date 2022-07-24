class AddUnconfirmedEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :unconfirmed_email, :string
    add_column :users, :theme, :string, null: false, default: 'light'
  end
end
