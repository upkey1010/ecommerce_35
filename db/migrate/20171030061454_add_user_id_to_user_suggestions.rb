class AddUserIdToUserSuggestions < ActiveRecord::Migration[5.1]
  def change
    add_column :user_suggestions, :user_id, :integer
  end
end
