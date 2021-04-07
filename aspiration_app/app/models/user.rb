class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, uniqueness: true, presence: true

  after_initialize :ensure_session_token

  def password=(pw)
    self.password_digest = BCrypt::Password.create(pw)
    @password = pw
  end

  def password
    @password
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def is_password?(pw)
    pw_obj = BCrypt::Password.new(self.password_digest)
    pw_obj.is_password?(pw)
  end
end