class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :text
      t.integer :author_id
      t.timestamps
    end
  end
end
