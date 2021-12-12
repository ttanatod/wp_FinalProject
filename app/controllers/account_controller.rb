class AccountController < ApplicationController
  include MainConcern
  # before_action :set_current_user, only: %i[ main ]

  def login
    if session[:user_id]
      redirect_to main_path, flash: { notice: "you are already logged in"}  
    end
  end

  def check_login
    username = params[:login][:username]
    pass = params[:login][:password]
    @user = User.find_by(username: username).authenticate(pass) rescue nil
    # puts "------email #{email.class}---------"
    # puts "------pass #{pass.class}----------"
    if @user
      # puts '-----------found------------' 
      session[:user_id] = @user.id
      redirect_to main_path, flash:{success: "Log in successfully"}
    else
      # puts '-----------not found-----------'
      redirect_to main_path, flash:{alert: "Wrong email or password!"}
    end
  end

  def register
    session[:user_id] = nil
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, flash: {success: "User was successfully created." }}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :register, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to main_path, flash:{notice: "Log out successfully"}
  end 

  private

    def user_params
       params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :password_confirmation)
    end

end
