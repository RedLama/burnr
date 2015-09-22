class AddBlogArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.date :publish_date
      t.string :status
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
