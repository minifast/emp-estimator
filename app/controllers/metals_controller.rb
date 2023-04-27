class MetalsController < ApplicationController
  before_action :set_metal, only: %i[ show edit update destroy ]

  # GET /metals
  def index
    @metals = Metal.all
  end

  # GET /metals/1
  def show
  end

  # GET /metals/new
  def new
    @metal = Metal.new
  end

  # GET /metals/1/edit
  def edit
  end

  # POST /metals
  def create
    @metal = Metal.new(metal_params)

    if @metal.save
      redirect_to @metal, notice: "Metal was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /metals/1
  def update
    if @metal.update(metal_params)
      redirect_to @metal, notice: "Metal was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /metals/1
  def destroy
    @metal.destroy
    redirect_to metals_url, notice: "Metal was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metal
      @metal = Metal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def metal_params
      params.require(:metal).permit(:name, :price)
    end
end
