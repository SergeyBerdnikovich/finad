class AddColumnsToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :education, :text
    add_column :advisers, :years_of_experience, :integer
  end
end
