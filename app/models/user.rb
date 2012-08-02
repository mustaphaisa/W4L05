class User < ActiveRecord::Base
  attr_accessible :account, :email, :name, :username, :password, :password_confirmation

  has_many :narratives
  has_many :events, :through => :narratives

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  uniqueness: { case_sensitive: false }
  validates :username, presence: true, length: { minimum: 6, maximum: 15 }, 
  uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_secure_password

  before_save { |user| user.email = email.downcase }

end
