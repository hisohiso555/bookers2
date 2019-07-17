class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
  	@book = Book.new
  	@books = Book.all
  end
  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book), notice: "You have creatad book successfully."
     else
     @user = current_user
     @books = Book.all
     render :action => "index"
  end
  end
  def show
  	@book = Book.find(params[:id])
  	@book_form = Book.new
    @book_comment = BookComment.new
  end

  def edit
  	@book = Book.find(params[:id])
  	if @book.user.id != current_user.id
  		redirect_to books_path
  	end
  end

  def update
  	@book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice: "You have updated book successfully."
    else
    render action: :edit
    end
  end

  def destroy
  	@book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
  end

 private
 def book_params
 	params.require(:book).permit(:title, :body)
 end

end
