class AddAttributesToPost < ActiveRecord::Migration
  def change
    add_column :posts, :price, :integer
    add_column :posts, :description, :text
    add_reference :posts, :user, index: true
  end
end
