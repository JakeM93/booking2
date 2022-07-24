class AddActiveSessionUsersReferances < ActiveRecord::Migration[7.0]
  def change
    add_reference :active_sessions, :user, null: false, foreign_key: true
  end
end
