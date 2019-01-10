# frozen_string_literal: true

module Api
  # class to manage mercadopublico.cl API
  class MercadoPublico
    include HTTParty

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
  end
end
