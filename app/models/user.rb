class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 3 }, presence: true

  def self.authenticate_with_credentials(email, password)
    # new_email = email.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
