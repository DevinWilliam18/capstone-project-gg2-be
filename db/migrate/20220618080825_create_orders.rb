class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :order_time
      t.string :status
      t.datetime :finished_time
      t.references :volunteer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
