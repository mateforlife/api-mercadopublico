class SuggestedBiddingsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    SuggestedBidding.rescue_suggested_biddings
  end
end
