class BooksController < ApplicationController
before_action :authenticate_user!
  def index
  	@books = Book.all
  	@book = Book.new
    @user = current_user
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
    flash[:notice] = "Book was successfully destroyed."
    redirect_to book_path(@book.id)
  else
  	@books = Book.all
  	render 'index'
  end
  end

  def show
  	@book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def destroy
  	@book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def book_destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully destroyed."
    redirect_to @book
    else
      render 'edit'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end