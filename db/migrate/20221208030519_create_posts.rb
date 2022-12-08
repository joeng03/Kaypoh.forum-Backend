class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key:true
      t.string :title
      t.text :content
      t.integer :stars
      t.string :tag
      t.string :image

      t.timestamps
    end
  end
end
