class CreateComplains < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :contact_time
      t.string :advisor_name
      t.string :advisor_phone
      t.text :complain

      t.timestamps
    end
  end
end
