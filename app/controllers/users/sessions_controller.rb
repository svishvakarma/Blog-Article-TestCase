module Users
  class SessionsController < DeviseTokenAuth::ApplicationController
    def create
      @user = User.new(log_in_params) 
      if @user.save
        redirect_to root_path 
      end
    end
 
    def destroy 
    byebug
    @user = User.find(params[:id])
    @user.destroy
    
    redirect_to root_path
    end 

    private

    def log_in_params
      params.permit(:email, :password)
      end 
  end
end 