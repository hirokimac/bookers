class BooksController < ApplicationController
    def index
        @user = User.find(current_user.id)
        @book = Book.new
    end

    def show
        @user = User.find(params[:id])
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            redirect_to book_path
        else
            @user = User.find(params[:id])
            render :user
        end
    end

    def edit
    end

    def destroy
    end

    private
    def book_params
        params.require(:book).permit(:title, :opinion)
    end

end
