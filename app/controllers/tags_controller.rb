class TagsController < ApplicationController
  def create
    # @user = User.find(params[:user_id])
    @upload = Upload.find(params[:upload_id])
    @tag = Tag.create({ user_id: params[:user_id], upload_id: params[:upload_id]})

    redirect_to user_upload_path( @upload.user.id, params[:upload_id])
  end




end
