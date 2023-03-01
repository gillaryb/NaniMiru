class AddColumnsToMovie < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :synopsis, :overview
    add_column :movies, :year, :string
    add_column :movies, :poster_url, :string
    remove_column :movies, :cast
    remove_column :movies, :genre
  end
end
