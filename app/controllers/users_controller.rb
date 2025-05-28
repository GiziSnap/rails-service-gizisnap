class UsersController < ApplicationController
  allow_unauthenticated_access

  def index
    respond_to do |format|
      format.json { render json: { userinformation: @current_user, userfoodshistory: @current_user.foods  } }
    end
  end
end
