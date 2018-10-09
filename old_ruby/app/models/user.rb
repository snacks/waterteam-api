class User < ApplicationRecord
  attr_accessor :project_invited_to

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :associations, dependent: :destroy
  has_many :projects, through: :associations
  has_many :created_projects, class_name: "Project", foreign_key: "creator_id"
end
