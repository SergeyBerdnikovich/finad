class AddShortDescriptionToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :short_description, :text
  end
end
