# frozen_string_literal: true

# class to manage biddings from mercadopublico API
class BiddingsController < ApplicationController
  before_action :set_market, only: %i[index more_info show]

  def index
    @biddings = json_response(@market.select_biddings_with_key_words)
  end

  def more_info
    @biddings = @market.process_biddings
  end

  def show
    @bidding = json_response(@market.bidding_detail(params[:id]))[0]
  end

  private

  def set_market
    @market = Api::MercadoPublico.new
  end
end
