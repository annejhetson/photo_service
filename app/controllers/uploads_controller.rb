class UploadsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @upload = @user.uploads.new(params.require(:upload).permit(:photo))

    if @upload.save
      flash[:notice] = 'Image uploaded'
      redirect_to user_path(@user.id)
    else
      @user = User.find(params[:id])
      @upload = Upload.new
      redirect_to user_path(@user.id)
    end
  end

  def show
    @upload = Upload.find(params[:id])
    @users = User.all
  end
end
