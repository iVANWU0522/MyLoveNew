class RemoveCoverFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :cover, :integer
  end
end
