class CreateConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :conditions do |t|
      t.string :condition_type
      t.date :expiration_date

      t.timestamps
    end
  end
end
