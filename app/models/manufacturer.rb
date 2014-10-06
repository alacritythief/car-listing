class Manufacturer < ActiveRecord::Base
  has_many :cars, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :country, presence: true
end
