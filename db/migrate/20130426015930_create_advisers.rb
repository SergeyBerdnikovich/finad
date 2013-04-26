class CreateAdvisers < ActiveRecord::Migration
  def change
    create_table :advisers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :url
      t.integer :stars

      t.timestamps
    end
  end
end
