class Project < ApplicationRecord
  has_many :associations, dependent: :destroy
  # the dependency could be .delete_all which would do it in one go (if multiple users were part)
  # but we might want to put a callback on an association to maybe email a user if a project they were associated with gets deleted
  has_many :users, through: :associations
  belongs_to :creator, class_name: "User" # the column creator_id 
  # maybe each project should have a deployment, which will then contain all the other stuff below
  has_many :devices
  has_many :notes, through: :devices
  has_many :sensors, through: :devices
  has_many :tags, through: :tag_uses
end
