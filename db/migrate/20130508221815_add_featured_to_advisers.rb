class AddFeaturedToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :featured, :boolean
    add_index :advisers, :featured
  end
end
