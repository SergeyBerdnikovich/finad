class CreateAdvisers < ActiveRecord::Migration
  def change
    create_table :advisers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.string :url
      t.integer :stars

      t.timestamps
    end

    add_index :advisers, :name
    add_index :advisers, :zip
    add_index :advisers, :stars
    add_index :advisers, :address
  end
end
