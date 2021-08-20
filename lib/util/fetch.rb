require 'httparty'
require_relative 'urls'

module FetchPrice
  def fetch(token, fiat, action)
    case action
    when CoinBase::BUY
      buy_url = CoinBase.buy token, fiat
      buy_response = HTTParty.get buy_url
      return JSON.parse buy_response.body if buy_response.code == 200
    when CoinBase::SELL
      sell_url = CoinBase.sell token, fiat
      sell_response = HTTParty.get sell_url
      return JSON.parse sell_response.body if sell_response.code == 200
    when CoinBase::SPOT
      spot_url = CoinBase.spot token, fiat
      spot_response = HTTParty.get spot_url
      return JSON.parse spot_response.body if spot_response.code == 200
    else
      puts 'coinbase supports only buy, sell and spot actions on price.'
    end
  end

  module_function :fetch
end