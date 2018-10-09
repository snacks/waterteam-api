class Sensor < ApplicationRecord
  belongs_to :project
  has_many :timeseries
end
