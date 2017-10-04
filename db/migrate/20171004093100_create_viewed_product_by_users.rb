class CreateViewedProductByUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :viewed_product_by_users do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
