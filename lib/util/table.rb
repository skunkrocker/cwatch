require 'colorize'
require 'terminal-table'

module Table

  def print(buy, sell, spot)
    rows = []
    heads = ['Buy €'.light_blue, 'Sell €'.light_red, 'Spot €'.light_blue]
    buy_price = buy['data']['amount']
    sell_price = sell['data']['amount']
    spot_price = spot['data']['amount']

    rows << [buy_price.light_blue, sell_price.light_red, spot_price.light_blue]
    table = Terminal::Table.new :rows => rows, :headings => heads, :style => { :border_top => false,
                                                                               :border_left => false,
                                                                               :border_right => false,
                                                                               :border_bottom => false }
    table.add_separator
    table.add_row ['Refresh'.yellow, { :value => '30s'.yellow, :colspan => 2, :alignment => :left }]

    system("clear")
    puts table
  end

  module_function :print
end