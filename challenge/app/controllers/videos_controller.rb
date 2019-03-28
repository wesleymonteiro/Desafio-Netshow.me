class VideosController < ApplicationController

  before_action :video_attributes, only: %i[create update]

  expose(:videos) {  (current_user.admin? ? Video.all : Video.where(user_id: current_user.id)).includes(:user) }
  expose(:video)

  def index
  end

  def new
  end

  def create
    if video.save
      respond_with video, location: videos_path
    else
      flash[:danger] = "Errrow"
      render :new
    end
  end

  def edit
    
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
  def video_attributes
    video.attributes = params.require(:video).permit(%i[id user_id title video_url])
  end
end
