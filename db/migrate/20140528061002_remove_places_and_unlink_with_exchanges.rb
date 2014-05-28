class RemovePlacesAndUnlinkWithExchanges < ActiveRecord::Migration
  def change
  	drop_table :places
  end
end
