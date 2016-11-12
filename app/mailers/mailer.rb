class Mailer < ApplicationMailer
  helper :text_with_links
  helper :mailer
  helper :users

 

  def email_verification(user, recipient, token, document_type, document_number)
    debugger
    @user = user
    @recipient = recipient
    @token = token
    @document_type = document_type
    @document_number = document_number
    mail(to: @recipient, subject: t('mailers.email_verification.subject'))
  end

end
