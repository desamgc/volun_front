class Users::PasswordsController < Devise::PasswordsController




  # POST /volunteers
  # POST /volunteers.json
  def create
    #SMSApi.new.sms_deliver('661622199', 'prueba')
    #redirect_to projects_path, notice: I18n.t('success_message_sending')
  end

end
