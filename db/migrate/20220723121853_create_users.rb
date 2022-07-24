class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :initials
      t.string :firstname
      t.string :middlename
      t.string :surname
      t.string :display_name
      t.string :email
      t.string :timezone
      t.string :language

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end