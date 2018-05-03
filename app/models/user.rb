class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :associations
  has_many :projects, through: :associations
  has_many :created_projects, class_name: "Project", foreign_key: "creator_id"
end
