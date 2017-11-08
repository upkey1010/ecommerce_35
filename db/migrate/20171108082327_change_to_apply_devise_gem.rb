class ChangeToApplyDeviseGem < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :encrypted_password, :string, null: false, default: ""

    # Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :string

    # Rememberable
    add_column :users, :remember_created_at, :datetime

    # Trackable
    add_column :users, :sign_in_count, :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string

    remove_column :users, :password_digest
    remove_column :users, :remember_digest
  end
end
