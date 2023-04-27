class EstimatesController < ApplicationController
  before_action :set_estimate, only: %i[ show destroy ]

  class EstimateForm
    include ActiveModel::Model

    attr_accessor :file, :metal_id

    delegate :original_filename, to: :file

    def self.model_name
      Estimate.model_name
    end

    def save
      return false unless valid?

      persist
      true
    end

    private

    def content
      @content ||= file.read
    end

    def estimator
      @estimator ||= DxfEstimator.new(content: content)
    end

    def persist
      Estimate.create!(metal_id: metal_id, file: content, name: original_filename, length: estimator.length, width: estimator.width, height: estimator.height, units: estimator.units)
    end
  end

  # GET /estimates
  def index
    @estimates = Estimate.all
  end

  # GET /estimates/1
  def show
  end

  # GET /estimates/new
  def new
    @estimate = Estimate.new
  end

  # POST /estimates
  def create
    @estimate = EstimateForm.new(file: estimate_params[:file], metal_id: estimate_params[:metal_id])

    if @estimate.save
      redirect_to @estimate, notice: "Estimate was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /estimates/1
  def destroy
    @estimate.destroy
    redirect_to estimates_url, notice: "Estimate was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimate
      @estimate = Estimate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estimate_params
      params.require(:estimate).permit(:file, :metal_id)
    end
end
