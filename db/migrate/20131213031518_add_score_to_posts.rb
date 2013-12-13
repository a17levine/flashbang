class AddScoreToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :score, :float
  end
end
