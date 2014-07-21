class ChangeExchangesIdToMeetingIdOnTimeBlocks < ActiveRecord::Migration
  def change
  	rename_column :time_blocks, :exchanges_id, :meeting_id
  end
end
