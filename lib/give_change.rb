module GiveChange
  def create_change(change_due)
    if change_due == 0
      @all_coins
    else
      cash_array = @cash_avail.sort_by{|coin| coin.quantity}.reverse!
      counter = 0
      cash_array.each do |coin_cash|
        coin = coin_cash.money.value
        if change_due == 0 || counter == cash_array.length
          return
        elsif coin > change_due
          counter += 1
        elsif change_due / coin > 0 && change_due != 0
          change_due -= coin
          coin_cash.quantity -= 1
          coin_cash.save
          @all_coins[coin] ? @all_coins[coin] += 1 : @all_coins[coin] = 1
          create_change(change_due) if change_due > 0
          return
        else
          counter += 1
        end
      end
    end
  end
end
