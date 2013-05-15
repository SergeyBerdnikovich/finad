class AddSlugToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :slug, :string
    add_index :advisers, :slug, unique: true
  end
end
