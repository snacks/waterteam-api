class Device < ApplicationRecord
  belongs_to :project
  has_many :notes
end
