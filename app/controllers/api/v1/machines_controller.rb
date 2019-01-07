class Api::V1::MachinesController < ApplicationController
  before_action :set_machine, only: [:show]

  def show
    render json: @machine
  end

  def update
    @machine = params[:id].to_i
    @sale = Sale.create(value: params[:total], machine_id: @machine)
    @snacks = update_snacks(params[:selectedSnacks])
    update_coins(params[:insertedCoins])
    @change = return_change(params[:paid] - params[:total])
    p @change
    render json: {change: @change, snacks: @snacks}
  end

  private

  def set_machine
    @machine = Machine.find(params[:id])
  end

  def update_snacks(snacks)
    snacks.each do |snack|
      s = Snack.find(snack[:id])
      q = s.quantity(@machine)
      q.quantity -= 1
      q.save
      p q
      Receipt.create(snack: s, sale: @sale)
    end
    snacks = Snack.all.select do |snack|
      snack.stocks[0].quantity > 0
    end
    return snacks
  end

  def update_coins(coins)
    coins.each do |coin|
     c = MachineCash.find(coin[:id])
     c.quantity += 1
     c.save
   end
  end

  def return_change(total_due)
    @all_coins = {}
    @cash_avail = MachineCash.where('machine_id = ? AND quantity > ?', 1, 0)
    def create_change(change_due)
      # p "total due 1 #{change_due}"
      if change_due == 0
        @all_coins
      else
        cash_array = @cash_avail.sort_by{|coin| coin.quantity}.reverse!
        counter = 0
        cash_array.each do |coin_cash|
          coin = coin_cash.money.value
          # p "coin = #{coin}"
          if change_due == 0 || counter == cash_array.length
            return
          elsif coin > change_due
            counter += 1
          elsif change_due % coin == 0 && change_due != 0
            # puts "total due"
            # p change_due
            change_due -= coin
            coin_cash.quantity -= 1
            coin_cash.save
            @all_coins[coin] ? @all_coins[coin] += 1 : @all_coins[coin] = 1
            # puts "total due at end"
            # p change_due
            create_change(change_due) if change_due > 0
            return
          else
            counter += 1
          end
        end
        return @all_coins
      end
      return @all_coins
    end
    create_change(total_due)
    return @all_coins
  end
end
