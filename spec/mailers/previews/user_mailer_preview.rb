# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/singup_confirmation
  def singup_confirmation
    UserMailerMailer.singup_confirmation
  end

end
