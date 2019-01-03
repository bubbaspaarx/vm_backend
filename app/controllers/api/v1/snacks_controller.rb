class Api::V1::SnacksController < ApplicationController
  before_action :set_snack, only: [:show]

  def index
    render json: Snack.all.order(:id),
      each_serializer: SnackSerializer,
      scope: {params: params[:machine_id]}
  end

  def show
    render json: @snack,
      each_serializer: SnackSerializer,
      scope: {params: params[:machine_id]}
  end

  private

  def set_snack
    @snack = Snack.find(params[:id])
  end

end
