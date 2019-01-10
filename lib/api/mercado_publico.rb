# frozen_string_literal: true

module Api
  module V1
    # class to manage mercadopublico.cl API
    class MercadoPublico
      require HTTParty

      base_uri 'http://api.mercadopublico.cl'

      def api_key
        ENV['API_TICKET']
      end

      def base_path
        '/servicios/v1/publico/'
      end

      def purchase_orders(options = {})
        puts options
      end
    end
  end
end
