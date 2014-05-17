class CreateFollowedTags < ActiveRecord::Migration
  def change
    create_table :followed_tags do |t|
      t.belongs_to :user
      t.belongs_to :tag
      t.timestamps
    end
  end
end
