class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        set_session_user_id(user.id)
        redirect_to root_url
      else
        #Notice Saying 'Failed Password'
        render 'new'
      end
    else
      #Notice saying 'Unable to find user'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
