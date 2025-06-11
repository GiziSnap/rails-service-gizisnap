class UsersController < ApplicationController
  allow_unauthenticated_access

  def index
    respond_to do |format|
      format.json { render json: { userinformation: @current_user, user_avatar: url_for(@current_user.avatar), userfoodshistory: @current_user.foods  } }
    end
  end

  def update
  end

  def destroy
  end
end
