require 'pry'

class Api::V1::AbductionsController < Api::V1::BaseController
  before_action :set_survivor, only: [:show]
  after_action :abducted?

  def show
  end

  def create
    @abduction = Abduction.new(abduction_params)
    if @abduction.save
      render :show
    else
      render_error
    end
  end

  private

  def set_abduction
    @abduction = Abduction.find(params[:id])
  end

  def abduction_params
    params.require(:abduction).permit(:survivor_id, :abducted_id)
  end

  def render_error
    render json: { errors: @abduction.errors.full_messages }, status: :unprocessable_entity
  end

  def abducted?
    abductions = Abduction.where(abducted_id: abduction_params[:abducted_id])
    return unless abductions.count >= 3

    survivor = Survivor.find_by(id: abduction_params[:abducted_id])
    survivor.abducted = true
    survivor.save!
  end
end
