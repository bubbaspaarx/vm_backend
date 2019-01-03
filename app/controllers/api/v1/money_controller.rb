class Api::V1::MoneyController < ApplicationController
  before_action :set_money, only: [:show]

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

  private

  def set_money
    @money = Money.find(params[:id])
  end

end
