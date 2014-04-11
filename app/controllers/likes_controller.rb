class LikesController < ApplicationController

  # def index

  # end
  def create
    # @user = User.find(params[:user_id])
    @upload = Upload.find(params[:upload_id])
    @like = Like.create({ user_id: current_user.id, upload_id: params[:upload_id]})

    redirect_to '/'
  end

end
