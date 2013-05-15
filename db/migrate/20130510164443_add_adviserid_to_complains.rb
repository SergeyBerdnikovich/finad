class AddAdviseridToComplains < ActiveRecord::Migration
  def change
    add_column :complaints, :adviser_id, :integer
  end
end
