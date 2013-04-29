class AddHashstrToUsers < ActiveRecord::Migration
  def change
#  	remove_column :users, :hash
    add_column :users, :hashstr, :string

  end
end
