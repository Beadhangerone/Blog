class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.belongs_to :post, index: true
      t.text :author
      t.timestamps
    end
  end
end
