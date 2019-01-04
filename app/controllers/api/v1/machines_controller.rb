class Api::V1::MachinesController < ApplicationController
  before_action :set_machine, only: [:show]

  def show
    render json: @machine
  end

  def update
    @machine = params[:id].to_i
    @sale = Sale.create(value: params[:total], machine_id: @machine)
    updateSnacks(params[:selectedSnacks])
    updateCoins(params[:insertedCoins])
  end

  private

  def set_machine
    @machine = Machine.find(params[:id])
  end

  def updateSnacks(snacks)
    snacks.each do |snack|
      s = Snack.find(snack[:id])
      q = s.quantity(@machine)
      q.quantity -= 1
      q.save!
      p q
      Receipt.create(snack: s, sale: @sale)
    end
  end

  def updateCoins(coins)
    coins.each do |coin|
     c = MachineCash.find(coin[:id])
     c.quantity += 1
     c.save
   end
  end
end
