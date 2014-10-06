class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer_id, :color, :mileage, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 1920 }, presence: true

  def manufacturer
    Manufacturer.find(manufacturer_id)
  end
end
