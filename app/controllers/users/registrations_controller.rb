class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!, only: [:create]
  before_filter :configure_sign_up_params, only: [:create]
  respond_to :html, :js, :json

  # PUT /resource
  def update
    if @user.update(user_params)
      redirect_to projects_path, notice: t('application.modificacionOk')
    else
      render action: 'edit'
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :attribute
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:user) { |u| u.permit(:password, :password_confirmation) }
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
