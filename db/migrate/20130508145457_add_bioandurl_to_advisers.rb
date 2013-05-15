class AddBioandurlToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :bio, :text
    add_column :advisers, :url1, :string
  end
end
