class UsersController < ApplicationController
  allow_unauthenticated_access

  def index
    respond_to do |format|
      format.json { render json: { username: @current_user  } }
    end
  end
end
