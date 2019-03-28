class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :show
  protect_from_forgery with: :exception
  respond_to :html
end
