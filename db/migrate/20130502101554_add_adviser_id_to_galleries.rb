class AddAdviserIdToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :adviser_id, :integer

    add_index :galleries, :adviser_id
  end
end
