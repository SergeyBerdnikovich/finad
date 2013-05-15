class Renameadvisor < ActiveRecord::Migration
  def up
  	rename_column :complaints, :advisor_name, :adviser_name
  	rename_column :complaints, :advisor_phone, :adviser_phone
  end
  def down
  end
end
