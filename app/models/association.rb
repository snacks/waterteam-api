class Association < ApplicationRecord
  before_validation :set_user_id, if: :email?

  belongs_to :user, required: true
  belongs_to :project, required: true

  # for inviting users to a project
  def set_user_id
    p "searching for user with email #{email}"
    existing_user = User.find_by(email: email)
    self.user = if existing_user.present?
                  # existing_user.destroy  # testing purposes
                  existing_user
                else
                  User.invite!({email: email}, Current.user) # this last part sets the .invited_by_id attribute
                end
  end
end
