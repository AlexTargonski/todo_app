class UserMailer < ApplicationMailer
default from: "from@example.com"

  def registration_confirmation(user)
    @user = user

   mail(:to => "#{user.full_name} <#{user.email}>", :subject => "Registration Confirmation")
  end
end
