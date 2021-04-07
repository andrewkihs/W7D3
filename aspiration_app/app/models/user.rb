class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, uniqueness: true, presence: true


  def password=(pw)
    self.password_digest = BCrypt::Password.create(pw)
    @password = pw
  end

  def password
    @password
  end
    
end