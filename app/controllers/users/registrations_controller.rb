module Users
  class RegistrationsController < Devise::RegistrationsController
     
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(sign_up_params) 
      if @user.save
        redirect_to root_path 
      end
    end

    private 
    def sign_up_params 
      params.permit(:email,:password, :password_confirmation)
    end 

  end
end