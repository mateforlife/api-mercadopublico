# frozen_string_literal: true

# class to manage biddings from mercadopublico API
class BiddingsController < ApplicationController
  before_action :set_market, only: %i[index more_info show]

  def index
    biddings = json_response(@market.biddings)
    @biddings = params[:term].blank? ? biddings : search(biddings)
  end

  # def more_info
  #   @biddings = @market.process_biddings
  # end

  def show
    @bidding = json_response(@market.bidding_detail(params[:id]))[0]
  end

  def search(biddings)
    arr = []
    biddings.each do |bidding|
      arr << bidding if I18n.transliterate(bidding[:Nombre].downcase).include?(params[:term].downcase)
    end
    arr
  end

  private

  def set_market
    @market = Api::MercadoPublico.new
  end
end
