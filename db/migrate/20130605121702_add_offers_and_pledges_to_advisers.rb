class AddOffersAndPledgesToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :offers_and_pledges, :string
  end
end
