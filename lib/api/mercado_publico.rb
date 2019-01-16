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
      url = "#{base_path}/licitaciones.json?estado=publicada"
      self.class.get(url, @options)['Listado']
    end

    def bidding_detail(bidding_id)
      url = "#{base_path}/licitaciones.json?codigo=#{bidding_id}"
      self.class.get(url, @options)['Listado']
    end

    def bidding_states(state)
      case state
      when 5
        "<small class='label bg-green'>Publicada</small>".html_safe
      when 6
        "<small class='label bg-red'>Cerrada</small>".html_safe
      when 7
        "<small class='label bg-red'>Desierta</small>".html_safe
      when 18
        "<small class='label bg-red'>Adjudicada</small>".html_safe
      when 19
        "<small class='label bg-red'>Suspendida</small>".html_safe
      end
    end

    def select_biddings_with_key_words
      arr = []
      biddings = Api::MercadoPublico.new.biddings
      biddings.each do |bidding|
        arr << bidding if I18n.transliterate(bidding['Nombre'].downcase).include?(key_words.to_s)
      end
      arr
    end

    def key_words
      ['educación', 'sistema de gestion', 'escolar', 'escuela',
       'convivencia escolar', 'libro de clases', 'comunicaciones',
       'sms', 'comunicacion', 'mensaje de texto', 'plataforma escolar',
       'educacion', 'colegios', 'colegio', 'pedagogia', 'liceo',
       'liceos']
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
