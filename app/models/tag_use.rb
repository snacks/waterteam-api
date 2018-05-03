class TagUse < ApplicationRecord
  has_many :projects
  has_many :tags
end
