class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = current_user
    @user.id = current_user.id
    @book = Book.new
  end

  def show
    @book = Book.new
  	@user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	   redirect_to user_path(@user.id), notice: "You have updated user successfully."
  	else
  		render 'edit'
  	end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render "show_follow"
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render "show_follower"
  end
  
  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image, :id)
  end
end
