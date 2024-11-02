def stock_picker (stocks_array)
  best_days = [0, 0]
  max_profit = 0
  stocks_array.each_with_index do |buy_price, buy_day|
    stocks_array.each_with_index do |sell_price, sell_day|
      if buy_day < sell_day
        profit = sell_price - buy_price
        if profit > max_profit
          max_profit = profit
          best_days = [buy_day, sell_day]
        end
      end
    end
  end
  best_days
end

p stock_picker([10, 9, 45])
