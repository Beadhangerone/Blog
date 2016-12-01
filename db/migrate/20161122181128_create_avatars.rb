class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.string :image_uid
      t.string :image_name
      t.belongs_to :user
      t.timestamps
    end
  end
end
