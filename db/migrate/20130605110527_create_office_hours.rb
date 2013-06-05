class CreateOfficeHours < ActiveRecord::Migration
  def change
    create_table :office_hours do |t|
      t.string :day_of_the_week
      t.time :start
      t.time :end
      t.references :adviser

      t.timestamps
    end
    add_index :office_hours, :adviser_id
  end
end
