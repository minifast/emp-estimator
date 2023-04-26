class EstimatesController < ApplicationController
  before_action :set_estimate, only: %i[ show destroy ]

  class EstimateForm
    include ActiveModel::Model

    attr_accessor :file

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

    def length
      @length ||= DxfEstimator.new(content: content).length
    end

    def persist
      Estimate.create!(file: content, name: original_filename, length: length)
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
    @estimate = EstimateForm.new(file: estimate_params[:file])

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
      params.require(:estimate).permit(:file)
    end
end
