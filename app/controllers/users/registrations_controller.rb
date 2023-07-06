module Users
  class RegistrationsController < Devise::RegistrationsController
    after_create :current_user  
    byebug
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(sign_up_params) 
      session[:user_id]  = @user.id 
      if @user.save
        redirect_to root_path 
      end
    end

    def destroy 
      @user = User.find(@current_user.id)
      session[:user_id] = nil 
      redirect_to root_path, notice: "sign out successuffully" 
    end 
  
    private 
    def sign_up_params 
      params.permit(:email,:password, :password_confirmation)
    end 

    def current_user
      current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
  end
end