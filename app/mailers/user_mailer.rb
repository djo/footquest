class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def invitation_email(user)
    @user = user
    mail(:to => user.email, :subject => "Приглашение")
  end
end
