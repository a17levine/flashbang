class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.references :buyer, index: true
      t.references :seller, index: true

      t.timestamps
    end
  end
end
