class CitizensController < ApplicationController
  before_action :authenticate_user!
  before_action :set_citizen, only: %i[ show edit update destroy ]

  def index
    @citizens = Citizen.all
  end

  def show
  end

  def new
    @citizen = Citizen.new
  end

  def edit
  end

  def create
    @citizen = Citizen.new(citizen_params)

    if @citizen.save
      redirect_to @citizen, notice: "Citizen was successfully created."
    else
      render :new, status: :unprocessable_entity
    end

  end

  def update
    if @citizen.update(citizen_params)
      redirect_to @citizen, notice: "Citizen was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citizen
      @citizen = Citizen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def citizen_params
      params.require(:citizen).permit(:full_name, :cpf, :email, :birth_date, :telephone, :photograph, :status)
    end
end
