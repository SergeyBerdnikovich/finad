class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :city
      t.string :state
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :info
      t.string :service
      t.string :portfolio
      t.integer :zip

      t.timestamps
    end
  end
end
