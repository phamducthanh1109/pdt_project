class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: Settings.name.maximum}
  validates :email, format: {with: VALID_EMAIL_REGEX},
    presence: true, uniqueness: {case_sensitive: false}, length: {maximum: Settings.email.maximum}
  validates :password, presence: true, length: {minimum: Settings.password.minimum}

  before_save :emaildowncase

  has_secure_password

  private

  def emaildowncase
    email.downcase!
  end
end
