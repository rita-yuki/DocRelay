# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      
      t.string :encrypted_password, null: false, default: ""
      t.string :employee_number, null: false, unique: true
      t.string :user_name
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :reset_password_token, unique: true
  end
end
