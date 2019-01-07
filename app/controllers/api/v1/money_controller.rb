class Api::V1::MoneyController < ApplicationController
  before_action :set_money, only: [:show, :update]

  def index
    render json: Money.all.order(:id),
      each_serializer: MoneySerializer,
      scope: {params: params[:machine_id]}
  end

  def show
    render json: @money,
      each_serializer: MoneySerializer,
      scope: {params: params[:machine_id]}
  end

  def update
    machine_cash = @money.machine_cashes.find_by(machine_id: params[:machine_id].to_i)
    p machine_cash
    machine_cash.quantity = params[:attributes][:quantity]
    machine_cash.save!
    render json: @money,
      each_serializer: MoneySerializer,
      scope: {params: params[:machine_id]}
  end

  private

  def set_money
    @money = Money.find(params[:id])
  end

end
