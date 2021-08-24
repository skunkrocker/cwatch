module ROI

  def calculate_for(token, fiat, portfolio_tokens)
    sell = FetchPrice.fetch token, fiat, CoinBase::SELL
    sell_price = sell['data']['amount'].to_f
    roi_list = []
    portfolio_tokens.each do |single_buy|
      amount = single_buy[0]
      original_price = single_buy[1]
      coin_base_fee = single_buy[2]

      initial_invest = (amount * original_price) + coin_base_fee
      current_invest = amount * sell_price

      difference = current_invest - initial_invest
      roi = difference / initial_invest

      roi_list << [amount, original_price, sell_price, difference.ceil(2), (roi * 100).ceil(2), token, fiat]
    end

    roi_list
  end

  module_function :calculate_for
end