class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :phone
      t.string :string

      t.timestamps
    end
  end
end
