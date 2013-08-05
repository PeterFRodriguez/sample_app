class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEZ = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,presence: true, format: {with: VALID_EMAIL_REGEZ}, uniqueness: {case_sentitive: false}
  has_secure_password
  validates :password, length: { minimum: 6 }
end
