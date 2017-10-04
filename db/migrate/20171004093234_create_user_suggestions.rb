class CreateUserSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_suggestions do |t|
      t.string :product_name
      t.text :reason

      t.timestamps
    end
  end
end
