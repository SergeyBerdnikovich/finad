class AddEmailToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :email, :string
  end
end
