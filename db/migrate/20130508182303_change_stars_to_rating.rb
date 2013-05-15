class ChangeStarsToRating < ActiveRecord::Migration
  def up
  	rename_column :advisers, :stars, :rating
  end

  def down
  end
end
