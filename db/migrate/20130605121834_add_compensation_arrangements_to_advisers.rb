class AddCompensationArrangementsToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :compensation_arrangements, :string
  end
end
