class AddExperienceToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :experience, :string
  end
end
