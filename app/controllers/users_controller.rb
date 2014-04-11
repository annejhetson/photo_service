class UsersController < ApplicationController

  def index
    @like = Like.new

    if @users = User.where(['name LIKE ?', "%#{params[:search]}%"])
      @uploads = Upload.all

      if @users.first == nil
        flash.now[:notice] = "No search results found"
        render 'index'
      end


    else
      @uploads = Upload.all

    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Thank you for signing up'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @upload = Upload.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to ("/users/#{@user.id}")
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to :root
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation, :avatar)
    end
end
