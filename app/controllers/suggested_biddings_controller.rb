class SuggestedBiddingsController < ApplicationController

  def index
    biddings = SuggestedBidding.all.latest
    result = params[:term].present? ? SuggestedBidding.search(params[:term]) : biddings
    @suggested_biddings = result.paginate(page: params[:page], per_page: 15)
  end

  def show
  end
end
