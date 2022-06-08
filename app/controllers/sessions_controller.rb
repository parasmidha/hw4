class SessionsController < ApplicationController
  def new
  end

  def create
  # authenticate the user
  #As a non-logged-in user, I want to login with my email and password and be redirected to the "Places" page.
  #As a non-logged-in user, I want to be redirected to the login page if I don't provide the correct email and password combination.
    @user = User.find_by({ "email" => params["email"] })
    
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome, #{@user["username"]}."
        redirect_to "/places"
      else
        flash["notice"] = "Nope."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Nope."
      redirect_to "/login"
    end
  end

  def destroy
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/login"
  end
end