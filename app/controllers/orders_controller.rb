class OrdersController < ApplicationController
  def index
    market = Api::MercadoPublico.new
    @orders = market.orders.deep_symbolize_keys[:Listado]
  end
end
