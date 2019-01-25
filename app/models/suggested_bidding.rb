class SuggestedBidding < ApplicationRecord

  def self.rescue_suggested_biddings
    market = Api::MercadoPublico.new
    biddings = market.select_biddings_with_key_words
    biddings.each do |bidding|
      SuggestedBidding.create(data: bidding)
    end
  end
end
