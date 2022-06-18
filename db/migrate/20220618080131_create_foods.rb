class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :food_name
      t.integer :food_quantity
      t.text :food_desc
      t.references :conditions, null: false, foreign_key: true
      t.references :producers, null: false, foreign_key: true

      t.timestamps
    end
  end
end