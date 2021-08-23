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

  def render_coins(coin_entries)
    rows = []
    headings = ['Coin Amount'.green, 'Buy Rate'.green, 'CB Fees'.green, 'Token'.green, 'Fiat'.green]
    coin_entries.sort_by { |c| c[3] }.each_with_index do |coin, index|
      if index % 2 == 0
        rows << coin.map { |c| c.to_s.light_red }
      else
        rows << coin.map { |c| c.to_s.light_blue }
      end
    end
    table = Terminal::Table.new :rows => rows, :headings => headings, :style => { :border_top => false,
                                                                                  :border_left => false,
                                                                                  :border_right => false,
                                                                                  :border_bottom => false }

    system("clear")
    puts table
  end

  module_function :print, :render_coins
end