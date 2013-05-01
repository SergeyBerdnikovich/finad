class ChangeZipTypeInUsers < ActiveRecord::Migration
  def up
    change_column :users, :zip, :string
  end

  def down
    change_column :users, :zip, :integer
  end
end
