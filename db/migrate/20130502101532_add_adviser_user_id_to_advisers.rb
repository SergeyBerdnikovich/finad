class AddAdviserUserIdToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :adviser_user_id, :integer

    add_index :advisers, :adviser_user_id
  end
end
