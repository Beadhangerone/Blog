class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.belongs_to :post, index: true
      t.integer :author_id
      t.timestamps
    end
  end
end
