class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.belongs_to :post, index: true
      t.text :author
      t.timestamps
    end
  end
end
