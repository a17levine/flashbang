class Meeting < ActiveRecord::Base
  belongs_to :exchange
  has_many :time_blocks
end
