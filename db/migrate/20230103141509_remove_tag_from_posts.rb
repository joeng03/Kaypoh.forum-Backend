class RemoveTagFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :tag, :string
  end
end
