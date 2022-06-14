class CreateVolunteers < ActiveRecord::Migration[7.0]
  def change
    create_table :volunteers do |t|
      t.string :org_name
      t.string :org_email
      t.string :org_phone
      t.string :org_address
      t.string :org_pass

      t.timestamps
    end
  end
end
