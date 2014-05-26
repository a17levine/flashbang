class AddPostReferenceToExchanges < ActiveRecord::Migration
  def change
    add_reference :exchanges, :post, index: true
  end
end
