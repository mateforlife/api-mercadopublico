# frozen_string_literal: true

module Market
  # class to manage biddings from mercadopublico API
  class BiddingsController < ApplicationController
    require 'will_paginate/array'
    before_action :set_market, only: %i[index more_info show]

    def index
      biddings = json_response(@market.biddings)
      @biddings_count = biddings ? biddings.count : biddings
      if params['with_key_words'] == '1'
        result = json_response(@market.select_biddings_with_key_words)
      elsif params[:term]
        result = search(biddings)
      else
        result = biddings
      end
      @biddings = result.paginate(page: params[:page], per_page: 15)
    end

    def show
      @bidding = json_response(@market.bidding_detail(params[:id]))[0]
    end

    private

    def search(biddings)
      arr = []
      biddings.each do |bidding|
        arr << bidding if I18n.transliterate(bidding[:Nombre].downcase).include?(params[:term].downcase)
      end
      arr
    end

    def set_market
      @market = Api::MercadoPublico.new
    end
  end
end
