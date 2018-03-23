class RemoveImageFromPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :image, :string
  end
end
