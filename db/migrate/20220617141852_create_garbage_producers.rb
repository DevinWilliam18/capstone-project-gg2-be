class CreateGarbageProducers < ActiveRecord::Migration[7.0]
  def change
    create_table :garbage_producers do |t|
      t.string :producer_name
      t.string :producer_pass
      t.string :email_producer
      t.text :address
      t.time :opening_time
      t.time :closing_time

      t.timestamps
    end
  end
end
