module CoinBase
  COINBASE_PRO_URL = 'https://api.coinbase.com/v2/prices/%s-%s/%s'

  BUY = 'buy'.freeze
  SELL = 'sell'.freeze
  SPOT = 'spot'.freeze

  def sell(token, fiat)
    COINBASE_PRO_URL % [token, fiat, SELL]
  end

  def buy(token, fiat)
    COINBASE_PRO_URL % [token, fiat, BUY]
  end

  def spot(token, fiat)
    COINBASE_PRO_URL % [token, fiat, SPOT]
  end

  module_function :sell, :buy, :spot
end