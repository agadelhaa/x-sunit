class Api::V1::SurvivorsController < Api::V1::BaseController
  before_action :set_survivor, only: %i[show update]

  def index
    @survivors = Survivor.all
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
