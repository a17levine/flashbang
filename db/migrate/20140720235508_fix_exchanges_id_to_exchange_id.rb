class FixExchangesIdToExchangeId < ActiveRecord::Migration
  def change
  	rename_column :meetings, :exchanges_id, :exchange_id
  end
end
