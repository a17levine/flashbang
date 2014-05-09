class AddActiveStatusToPost < ActiveRecord::Migration
  def change
    add_column :posts, :active, :boolean
  end
end
