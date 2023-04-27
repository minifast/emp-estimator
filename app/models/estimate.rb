class Estimate < ApplicationRecord
  belongs_to :metal, inverse_of: :estimates

  validates :name, :file, :length, :width, :height, :units, presence: true

  def cut_price
    Money.new(cut_time * configuration[:cut_price_cents], configuration[:cut_price_currency])
  end

  def cut_time
    (configuration[:cut_speed] * length).seconds
  end

  def metal_price
    metal.price * width * height
  end

  def total_price
    cut_price + metal_price
  end

  def configuration
    Rails.application.config_for(:estimates)
  end
end
