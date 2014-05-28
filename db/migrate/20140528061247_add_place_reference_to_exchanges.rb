class AddPlaceReferenceToExchanges < ActiveRecord::Migration
  def change
    add_reference :exchanges, :place, index: true
  end
end
