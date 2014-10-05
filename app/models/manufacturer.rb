class Manufacturer < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :country, presence: true
end
