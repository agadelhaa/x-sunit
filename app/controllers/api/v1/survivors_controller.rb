class Api::V1::SurvivorsController < Api::V1::BaseController
  before_action :set_survivor, only: %i[show update]

  def index
    @survivors = Survivor.all.order("name ASC")
  end

  def show
  end

  def update
    if @survivor.update(survivor_params)
      render :show
    else
      render_error
    end
  end

  def create
    @survivor = Survivor.new(survivor_params)
    if @survivor.save
      render :show
    else
      render_error
    end
  end

  def percentage_of_abducted
    total = Survivor.all.count
    abducted = Survivor.where(abducted: true).count
    result = (abducted / total.to_f) * 100
    @percentage = "#{result.to_i}%"
  end

  def percentage_of_non_abducted
    total = Survivor.all.count
    non_abducted = Survivor.where(abducted: false).count
    result = (non_abducted / total.to_f) * 100
    @percentage = "#{result.to_i}%"
  end

  private

  def set_survivor
    @survivor = Survivor.find(params[:id])
  end

  def survivor_params
    params.require(:survivor).permit(:name, :age, :gender, :location)
  end

  def render_error
    render json: { errors: @survivor.errors.full_messages }, status: :unprocessable_entity
  end
end
