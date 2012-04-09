class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description, :null => false
      t.string :image_url
      t.decimal :price, :precision => 8
      t.timestamps
    end
  end
end
