class Api::V1::MachinesController < ApplicationController
  before_action :set_machine, only: [:show]
  include GiveChange

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
    render json: {change: @change, snacks: ActiveModel::Serializer::CollectionSerializer.new(@snacks, each_serializer: SnackSerializer,
      scope: {params: params[:id]})}
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
    create_change(total_due)
    return @all_coins
  end
end
