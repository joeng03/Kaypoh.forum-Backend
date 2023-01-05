class AddPostsCountToTopics < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :posts_count, :integer, default: 0
  end
end
