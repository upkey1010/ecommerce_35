class CreateParameters < ActiveRecord::Migration[5.1]
  def change
    create_table :parameters do |t|
      t.text :screen
      t.string :os
      t.string :camera_front
      t.string :camera_back
      t.string :ram
      t.string :memory_storage

      t.timestamps
    end
  end
end
