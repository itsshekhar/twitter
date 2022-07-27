class RegistrationsController < Devise::RegistrationsController
    def after_sign_up_path_for(resource)
      root_path(resource)
    end
    def after_inactive_sign_up_path_for(resource)
        root_path(resource)
    end
   
    private 
    def sign_up_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

    def sign_update_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

    def account_update_params 
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
     
  end
  