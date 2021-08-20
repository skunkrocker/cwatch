require 'terminal-table'

module Table

  def print(buy, sell, spot)
    rows = []
    heads = ['Buy €', 'Sell €', 'Spot €']

    buy_price = buy['data']['amount']
    sell_price = sell['data']['amount']
    spot_price = spot['data']['amount']

    rows << [buy_price, sell_price, spot_price]
    table = Terminal::Table.new :rows => rows, :headings => heads, :style => { :border_x => "-", :border_i => "°" }

    system("clear")
    puts table
    #puts 'each 30s'
  end

  module_function :print
end