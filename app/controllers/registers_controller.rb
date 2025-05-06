class RegistersController < ApplicationController
  allow_unauthenticated_access
  skip_forgery_protection
  skip_before_action :authenticate_request

  def new
    @user = User.new
  end

  def create
    @user = User.new(userparams)

    if @user.save
      respond_to do |format|
        format.json do
          render json: { Success: true, Message: "Account Created Succesfully" }, status: :created
        end
        format.html do
          redirect_to session_path
        end
      end
    else
      respond_to do |format|
        format.json { render json: { Success: false, Message: "Email already used" }, status: :unauthorized }
        format.html do
          redirect_to new_session_path, alert: "Email already used, please use another email address"
        end
      end
    end
  end

  private

  def userparams
    params.permit(:email_address, :password)
  end
end
