class CreateBlogPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_posts do |t|
      t.string :title, null: false
      t.datetime :date_posted, null: false
      t.string :blog_text, null: false
      t.integer :user_blog_id, null: false
      t.timestamps
    end
  end
end
