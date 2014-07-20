class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
  	puts "Doing hard work on #{name} with count #{count}"
  end
end