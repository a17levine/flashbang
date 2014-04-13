class AddPostForeignKeyToOffers < ActiveRecord::Migration
  def change
    add_reference :offers, :post, index: true
  end
end
