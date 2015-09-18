class AddSlideshowModel < ActiveRecord::Migration
  def change
    create_table :slideshows do |t|
      t.string :picture
      t.string :url
    end
  end
end
