class UsersController < ApplicationController
    helper_method :logged_in?, :current_user
    layout "static"
  
    def new
      if logged_in?
        redirect_to user_watchlists_path(current_user)
      else
        @user = User.new
      end
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_watchlists_path(@user)
      else
        render :new
      end
    end
  
    def show
      @user = current_user
      if logged_in?
        if @user == User.find_by(id: params[:id])
          render :layout => "application"
        else
          flash[:danger] = "You don't have access to view that user's settings!"
          redirect_to user_watchlists_path(@user)
        end
      else
        redirect_to login_path
      end
    end
  
   

    def facebook_login

      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['name']
    
        u.image = auth['info']['image']
        u.password = SecureRandom.hex 
        #u.email = "noemailgiven@random.com"
        u.email = auth['info']['email']
      end
     
      if @user.persisted?
        
      session[:user_id] = @user.id
      
      redirect_to user_watchlists_path(@user)

      else

        render :new
        
      end

    end

    def create_google
      @user = User.find_by(email: auth[:info][:email])
  
      if @user.nil?
        @user = User.new(
          email: auth[:info][:email],
          username: auth[:info][:name],
          password: SecureRandom.urlsafe_base64
        )
      end
  
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_watchlists_path(@user)
      else
        render :new
      end
    end

    
    private
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
  
    def auth
      request.env['omniauth.auth']

    end

  end

