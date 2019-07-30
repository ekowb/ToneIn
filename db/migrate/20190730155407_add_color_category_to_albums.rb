class AddColorCategoryToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :color_category, :string
  end
end
