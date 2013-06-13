class AddYoutubeurlToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :youtube_url, :string
  end
end
