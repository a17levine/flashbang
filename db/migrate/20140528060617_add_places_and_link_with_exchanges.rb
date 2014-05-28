class AddPlacesAndLinkWithExchanges < ActiveRecord::Migration
  def change
  	create_table :places do |t|
      t.belongs_to :exchange
      t.string :name
      t.string :url
      t.string :address
      t.timestamps
    end
  end
end
