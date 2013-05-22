class AddVerifiedToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :verified, :boolean
  end
end
