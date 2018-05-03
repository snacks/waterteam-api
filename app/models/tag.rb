class Tag < ApplicationRecord
  has_many :projects, through: :tag_uses
end
