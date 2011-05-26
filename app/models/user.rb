class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :invitable

  attr_accessible :first_name, :last_name, 
                  :email, :password, :password_confirmation, :remember_me
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
end
