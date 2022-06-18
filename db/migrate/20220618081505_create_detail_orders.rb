class CreateDetailOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :detail_orders do |t|
      t.references :foods, null: false, foreign_key: true
      t.references :orders, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
