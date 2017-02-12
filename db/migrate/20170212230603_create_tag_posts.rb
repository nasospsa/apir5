class CreateTagPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_posts do |t|
      t.references :post, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
