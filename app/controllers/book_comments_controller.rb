class BookCommentsController < ApplicationController

 def create
 	  book = Book.find(params[:book_id])
  	comment = current_user.book_comments.new(book_id: book.id)
    comment.save
    redirect_to book_path(book)
end

def edit
	@book = Book.find(params[:book_id])
    @comment = BookComment.find(params[:id])
    if @comment.user.id != current_user.id
  		redirect_to book_path(@book)
  	end
end

def update
	comment = BookComment.find(params[:id])
	comment.update(comment_params)
    redirect_to book_path(comment.book)
end

def destroy
	@comment = BookComment.find(params[:id])
	if @comment.user.id != current_user.id
		redirect_to book_path(@comment.book)
	else
	@comment.destroy
	redirect_to book_path(@comment.book)
    end

end

private
 def comment_params
 	params.require(:book_comment).permit(:user_id,:book_id,:comment)
 end

end
