class SuggestedBiddingsController < ApplicationController

  def index
    @suggested_biddings = SuggestedBidding.all.paginate(page: params[:page], per_page: 15)
  end

  def show
  end
end
