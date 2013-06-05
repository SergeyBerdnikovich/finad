class AddOpenhoursToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :open_hours, :text
  end
end
