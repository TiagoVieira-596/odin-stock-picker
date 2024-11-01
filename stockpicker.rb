def stock_picker (stocks_array)
  days_in_comparision = [0, 0]
  best_days_found = false
  max_profit = 0

  until best_days_found == true or max_profit == (stocks_array.max - stocks_array.min)
    min_value = stocks_array.filter {|stock| stock > days_in_comparision[0]}.min
    if min_value == nil
      best_days_found = true
      break
    end
    max_value_after_min = stocks_array.filter {|stock| stocks_array.find_index(stock) > stocks_array.find_index(min_value)}.max
    if max_value_after_min == nil or min_value == nil
      best_days_found = true
      break
    else
      days_in_comparision = [min_value, max_value_after_min]
    end
    if days_in_comparision[1] - days_in_comparision[0] > max_profit
      max_profit = days_in_comparision[1] - days_in_comparision[0]
      current_best_days = days_in_comparision
    end
    days_in_comparision
  end
  days_chosen = [stocks_array.find_index(current_best_days[0]), stocks_array.find_index(current_best_days[1])]
  if days_chosen[0] > days_chosen[1]
    return "Not possible to get any profit"
  end
  days_chosen
end

p stock_picker([1, 100, 80])
