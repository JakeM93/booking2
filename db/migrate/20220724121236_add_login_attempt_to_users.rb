class AddLoginAttemptToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :login_attempts, :integer, null: false, default: 0
  end
end
