class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.text :content
      t.integer :score
      t.references :user, foreign_key: true
      t.references :product

      t.timestamps
    end
  end
end
