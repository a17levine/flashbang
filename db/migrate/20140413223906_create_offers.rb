class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :amount
      t.boolean :accepted

      t.timestamps
    end
  end
end
