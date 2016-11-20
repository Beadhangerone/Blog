class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.belongs_to :user
      t.text :follower
      t.timestamps
    end
    add_index :friends, :follower
  end
end
