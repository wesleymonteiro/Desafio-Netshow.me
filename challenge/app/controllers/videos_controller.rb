class VideosController < ApplicationController
  def index
    @videos = (current_user.admin? ? Video.all : Video.where(user_id: current_user.id)).includes(:user)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
