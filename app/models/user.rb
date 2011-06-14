class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  ROLES = ['admin', 'moderator']

  attr_accessible :first_name, :last_name, 
                  :email, :password, :password_confirmation, :remember_me
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :role, :presence => true, :inclusion => { :in => ROLES }
  
  def role?(role)
    self.role == role.to_s
  end
  
  private
  
  def mass_assignment_authorizer
    if accessible == 'admin'
      super + [:role]
    else
      super
    end
  end
end
