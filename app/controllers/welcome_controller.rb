class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to user_dramas_path(user_id: current_user.id)
    end
  end
end
