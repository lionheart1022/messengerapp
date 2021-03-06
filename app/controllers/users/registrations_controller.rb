class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    build_resource({})

    @validatable = devise_mapping.validatable?
    if @validatable
      @minimum_password_length = resource_class.password_length.min
    end

    self.resource.build_contact
    respond_with self.resource
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  def configure_sign_up_params
    # params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, contact_attributes:[:phone, :address]]
    # params.require(:user).permit(:first_name, :last_name, contacts:[:phone, :address])
    #devise_parameter_sanitizer.for(:sign_up) << :first_name
  end

  # You can put the params you want to permit in the empty array.
  def configure_account_update_params
    # params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    # devise_parameter_sanitizer.sanitize(:account_update)
    # devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name]
    # params.require(:user).permit(:first_name, :last_name, contacts:[:phone, :address])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
