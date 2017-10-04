class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.integer :status
      t.string :phone
      t.text :address
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
