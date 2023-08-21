# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    @section = params[:section]
    @path = "/users/edit?section=#{@section}"
    super
  end

  # PUT /resource
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    
    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      flash[:notice] = "ユーザー情報が更新されました"
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?
      redirect_to user_url(id:current_user.id, section:"account")
    else
      flash.now[:alert] = "入力内容に不備があります"
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource, locals: {section: params[:section]}
    end
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

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduce, :icon, :section])
  end

  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      if params[:icon]
        image = params[:icon].tempfile.read
        File.binwrite("public/icon_images/#{current_user.id}.png", image)
        params[:icon] = "/icon_images/#{current_user.id}.png"
      end
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  # The path used after sign up.
  def after_update_path_for(resource)
    user_path(id:current_user.id, section:"account")
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
