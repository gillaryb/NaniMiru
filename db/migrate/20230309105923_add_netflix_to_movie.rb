class AddNetflixToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :netflix_url, :string
  end
end
