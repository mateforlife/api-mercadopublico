# frozen_string_literal: true

module Market
  # class to manage biddings from mercadopublico API
  class BiddingsController < ApplicationController
    require 'will_paginate/array'
    before_action :authenticate
    before_action :set_market, only: %i[index more_info show]
    before_action :set_date, only: :index

    def index
      if params[:date].blank? && params[:term].blank?
        result = json_response(@market.select_biddings_with_key_words)
      elsif params[:date].present? && params[:term].blank?
        result = json_response(@market.select_biddings_with_key_words(@market.biddings_by_date(params[:date].to_date.strftime('%d%m%Y'))))
      elsif params[:date].present? && params[:term].present?
        # debo hacer que la fecha no quede blanca despues de seleccionarla
        result = json_response(@market.search_by_text(@market.biddings_by_date(params[:date].to_date.strftime('%d%m%Y')), params[:term]))
      elsif params[:date].blank? && params[:term].present?
        result = json_response(@market.search_by_text(@market.select_biddings_with_key_words, params[:term]))
      end
      @biddings_count = result.count
      @biddings = result.paginate(page: params[:page], per_page: 15)
    end

    def show
      @bidding = json_response(@market.bidding_detail(params[:id]))[0]
    end

    private

    def search_by_text(biddings)
      arr = []
      biddings.each do |bidding|
        arr << bidding if I18n.transliterate(bidding[:Nombre].downcase).include?(params[:term].downcase)
      end
      arr
    end

    def set_date
      date = params[:date]
      @date = date.present? ? date : Date.today
    end

    def set_biddings
      @biddings = json_response(@market.select_biddings_with_key_words)
    end

    def set_market
      @market = Api::MercadoPublico.new
    end
  end
end
