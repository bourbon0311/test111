class UsersController < ApplicationController
before_action :authenticate_user!
def index
    @users = User.all
    @user = User.new
    @user = current_user
    @book = Book.new
  end

  def create
  	@user = User.new(User.params)
  	@user.user_id = current_user.id
  	@user.save
  	redirect_to books_path
  end

  def show
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to books_path
  end

private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
