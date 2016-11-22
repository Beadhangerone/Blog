class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.string :avatar_uid
      t.string :avatar_name
      t.belongs_to :user
      t.timestamps
    end
  end
end
