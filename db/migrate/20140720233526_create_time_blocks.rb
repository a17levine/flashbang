class CreateTimeBlocks < ActiveRecord::Migration
  def change
    create_table :time_blocks do |t|
      t.datetime :start_time
      t.references :exchanges, index: true

      t.timestamps
    end
  end
end
