class CreateUserBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_blogs do |t|
      t.string :title, null: false
      t.string :category, null: false
      t.string :description, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
