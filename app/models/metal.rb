class Metal < ApplicationRecord
  has_many :estimates, inverse_of: :metal

  validates :name, :price_cents, presence: true

  monetize :price_cents

  def full_name
    "#{name} (#{price.format}/mm^2)"
  end
end
