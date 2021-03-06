class User < ActiveRecord::Base
  validates :name,  presence: true, length: { maximum: 255 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, case_sensitive: false
    
  before_save { self.email = email.downcase }  
    
  has_secure_password  
  
  validates :password, length: { minimum: 6 }
    
  #validates_confirmation_of :password, if: lambda { |m| m.password.present? }
    
end

