class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :show
  protect_from_forgery with: :exception
  respond_to :html

  def show_error
    flash[:alert] = "There's something wrong. Please, try again."
    render :new
  end
end
