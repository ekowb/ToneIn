class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.string :image_url
      t.string :songs
      t.datetime :release_date
      t.string :genre
      t.string :color
      t.integer :like_count

      t.timestamps
    end
  end
end
