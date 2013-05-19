class AddBlogUrlToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :blog_url, :string
  end
end
