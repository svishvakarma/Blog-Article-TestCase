module Users
  class SessionsController < Devise::SessionsController
    def create
      @user = User.new(log_in_params) 
      if @user.save
        redirect_to root_path 
      end
      session[:user_id]  = @user.id 
    end
 
    def resource_name
      :user
    end
  
    def destroy 
      @user = User.find(@current_user.id)
      Devise.sign_out(resource_name)
      redirect_to root_path
    end 
  
    private

    def log_in_params
      params.permit(:email, :password)
    end 

  end
end 