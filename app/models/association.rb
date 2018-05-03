class Association < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :project, required: true
end
