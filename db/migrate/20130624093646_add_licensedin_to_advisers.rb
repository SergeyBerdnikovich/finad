class AddLicensedinToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :licensed_in, :text
  end
end
