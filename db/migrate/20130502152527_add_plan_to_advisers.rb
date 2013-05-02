class AddPlanToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :plan, :string
  end
end
