class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.belongs_to :user
      t.integer :follower_id
      t.timestamps
    end
    add_index :followers, :follower_id
  end
end
