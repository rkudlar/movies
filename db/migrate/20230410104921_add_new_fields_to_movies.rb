class AddNewFieldsToMovies < ActiveRecord::Migration[7.0]
  def change
    change_table :movies, bulk: true do |t|
      t.integer :runtime
      t.date :released
      t.string :genre
      t.string :actors
      t.string :director
      t.float :imdb_rating
      t.references :user
    end
  end
end
