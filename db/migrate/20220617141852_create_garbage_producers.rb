class CreateGarbageProducers < ActiveRecord::Migration[7.0]
  def change
    create_table :garbage_producers do |t|
      t.string :producer_name
      t.string :producer_pass
      t.string :email_producer
      t.text :address
      t.time :opening_time
      t.time :closing_time
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end

    #add_index :table_name, :column_name, options: "custom_index_name"
    #Ex:- add_index("admin_users", "username")
  end
end
