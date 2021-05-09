class CitizensController < ApplicationController
  before_action :authenticate_user!
  before_action :set_citizen, only: %i[ show edit update destroy ]
  layout 'citizen_layout'

  def index
    @search = Citizen.ransack(params[:q])
    @pagy, @citizens = pagy(@search.result())
  end

  def show
  end

  def new
    @citizen = Citizen.new
    @citizen.build_address
  end

  def edit
  end

  def create
    @citizen = Citizen.new(citizen_params)

    if @citizen.save
      redirect_to @citizen, notice: t('notice.title.new')
      SendNotificationWelcome.new(@citizen).execute
    else
      render :new, status: :unprocessable_entity
    end

  end

  def update
    if @citizen.update(citizen_params)
      redirect_to @citizen, notice: t('notice.title.edit')
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
      params.require(:citizen).permit(:full_name, :cpf, :email, :birth_date, :telephone, :image, :status,
                                      address_attributes: [:id, :zip_code, :street, :complement, :district, :city, :ibge, :UF])
    end
end
