class Api::V1::MachinesController < ApplicationController
  before_action :set_machine, only: [:show]

  def show
    render json: @machine
  end

  private

  def set_machine
    @machine = Machine.find(params[:id])
  end
end
