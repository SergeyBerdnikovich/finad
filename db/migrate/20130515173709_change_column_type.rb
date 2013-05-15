class ChangeColumnType < ActiveRecord::Migration
  def up
    add_column :advisers, :rating_id, :integer
    add_index :advisers, :rating_id
    remove_column :advisers, :rating
  end

  def down
  end
end
