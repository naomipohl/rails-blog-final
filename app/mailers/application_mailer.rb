class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def reset_password_instructions(admin)
    @admin = admin
    mail( :to => @admin.email,
    :subject => 'Reset password instructions' )
  end
end
