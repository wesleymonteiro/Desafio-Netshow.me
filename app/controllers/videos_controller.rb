class VideosController < ApplicationController
  expose(:videos) {  (current_user.admin? ? Video.all : Video.where(user_id: current_user.id)).includes(:user) }
  expose(:video)

  def index
  end

  def new
  end

  def create
    video.attributes = video_attributes
    if video.save
      flash[:notice] = "The video #{video.title} has been created!"
      respond_with video, location: videos_path
    else
      show_error
    end
  end

  def edit
  end

  def update
    if video.update(video_attributes)
      flash[:notice] = "The video #{video.title} has been updated!"
      respond_with video, location: videos_path
    else
      show_error
    end
  end

  def show
  end

  def destroy
    flash[:notice] = "The video #{video.title} has been deleted!"
    video.destroy
    respond_with video, location: videos_path
  end

  private

  def video_attributes
    params.require(:video).permit(%i[id user_id title url])
  end
end
