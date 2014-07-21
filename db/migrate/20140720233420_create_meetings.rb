class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.references :exchanges, index: true
      t.references :time_block, index: true
      t.boolean :planned

      t.timestamps
    end
  end
end
