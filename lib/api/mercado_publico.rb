# frozen_string_literal: true

module Api
  # class to manage mercadopublico.cl API
  class MercadoPublico
    include HTTParty
    require 'i18n'

    base_uri 'http://api.mercadopublico.cl'

    def initialize
      @options = { query: { ticket: api_key } }
    end

    def api_key
      ENV['API_TICKET']
    end

    def base_path
      '/servicios/v1/publico/'
    end

    # to get purchase orders

    def orders
      url = "#{base_path}/ordenesdecompra.json"
      self.class.get(url, @options)
    end

    def biddings
      url = "#{base_path}/licitaciones.json?"
      self.class.get(url, @options)['Listado']
    end

    def bidding_detail(bidding_id)
      url = "#{base_path}/licitaciones.json?codigo=#{bidding_id}"
      self.class.get(url, @options)['Listado']
    end

    def select_biddings_with_key_words
      sleep 2
      arr = []
      biddings = Api::MercadoPublico.new.biddings
      biddings.each do |bidding|
        arr << bidding if key_words.any? { |word| I18n.transliterate(bidding['Nombre'].downcase).include?(word) }
      end
      arr
    end

    def key_words
      KeyWord.all.pluck(:name)
    end

    def items
      %w[
        43191500
        43191600
        43201400
        43201500
        43211500
        43221500
        43221600
        43221800
        43223200
        43231500
        43232300
        43232400
        43232700
        43232900
        43233000
        43233400
        55111500
        81111700
        83111600
        83121700
        86101700
        86111600
        86111700
        86111800
        86121500
        86121600
        86121800
        86131500
        86131600
        86131800
        86131900
        93131500
        94101600
        94111900
      ]
    end

    # we suggest you do not use this method, to much http requests :(
    def process_biddings
      instance = Api::MercadoPublico.new
      arr = []
      biddings = instance.biddings
      biddings.each do |bidding|
        sleep 2
        detail = instance.bidding_detail(bidding['CodigoExterno'])
        arr << detail['Listado'][0] if Api::MercadoPublico::ITEMS.include?(detail['Listado'][0]['Items']['Listado'][0]['CodigoCategoria'])
      end
      arr
    end
  end
end
