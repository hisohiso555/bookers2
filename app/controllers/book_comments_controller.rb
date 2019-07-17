class BookCommentsController < ApplicationController

 def create
 	book = Book.find(params[:book_id])
  	comment = BookComment.new(comment_params)
  	comment.user_id = current_user.id
  	comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
end

def edit
	@comment = BookComment.find(params[:id])
end

def update
	comment = BookComment.find(params[:id])
	comment.update(comment_params)
    redirect_to book_path(comment.book)
end

def destroy
	comment = BookComment.find(params[:id])
	comment.destroy
	redirect_to book_path(comment.book)
end

private
 def comment_params
 	params.require(:book_comment).permit(:user_id,:book_id,:comment)
 end

end
