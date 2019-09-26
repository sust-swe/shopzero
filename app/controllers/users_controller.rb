class UsersController < ApplicationController
<<<<<<< Updated upstream
  skip_before_action :verify_authenticity_token
=======
	skip_before_action :verify_authenticity_token

>>>>>>> Stashed changes
  def new
  end

  def create
    @user = User.new(user_params)
<<<<<<< Updated upstream
    if @user.save
      render json: @user
    end
  end

  def show
  end

  def update
  end

=======
    if @user.save 
      render json: @user
    end
  end
  
  def show
  end
  
  def update
  end
  
>>>>>>> Stashed changes
  def destroy
  end

  private
<<<<<<< Updated upstream
    def user_params
      params.require(:user).permit(:name,:password,:password_confirmation)
    end
=======

    def user_params
      params.require(:user).permit(:name,:password,:password_confirmation)
    end

>>>>>>> Stashed changes
end
