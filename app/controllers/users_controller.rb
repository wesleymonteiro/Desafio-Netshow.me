class UsersController < ApplicationController
  expose(:users) { User.all.includes(:videos) }
  expose(:user)

  def index
  end

  def edit
  end

  def update
    if user.update(user_attributes)
      flash[:notice] = "User has been updated!"
      respond_with user, location: users_path
    else
      show_error
    end
  end

  def show
  end

  def destroy
    flash[:notice] = "User has been deleted!"
    user.destroy
    respond_with user, location: users_path
  end

  private
  def user_attributes
    user.attributes = params.require(:user).permit(%i[id email])
  end
end
