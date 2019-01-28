namespace :biddings do
  desc 'to save suggested biddings'
  task :save_suggested => :environment do
    puts 'running'
    SuggestedBidding.rescue_suggested_biddings
    puts 'sucess'
  end
end
