class AddRgbToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :rgb, :string
  end
end
