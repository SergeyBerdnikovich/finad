class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :adviser_id
      t.integer :user_id

      t.timestamps
    end
  end
end
