class Users::PasswordsController < Devise::PasswordsController


  def new

  end

  # GET /volunteers/1/edit
  def edit
  end

  # POST /volunteers
  # POST /volunteers.json
  def create
    SMSApi.new.sms_deliver('661622199', 'prueba')
  end

end
