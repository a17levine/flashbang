class RemovePlacesFromExchanges < ActiveRecord::Migration
  def change
    remove_reference :exchanges, :place, index: true
  end
end
