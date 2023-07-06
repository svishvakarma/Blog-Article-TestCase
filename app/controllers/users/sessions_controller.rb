module Users
  class SessionsController < Devise::SessionsController
    def create
      @user = User.new(log_in_params) 
      session[:user_id]  = @user.id 
      if @user.save
        redirect_to root_path 
      end
    end
 
    def resource_name
      :user
    end
  
    def destroy 
      @user = User.find(@current_user.id)
      session[:user_id] = nil 
      redirect_to root_path, notice: "logout successuffully" 
    end 
  
    private

    def log_in_params
      params.permit(:email, :password)
    end 

  end
end 