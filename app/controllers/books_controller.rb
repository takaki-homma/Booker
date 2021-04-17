class BooksController < ApplicationController
    def index #indexアクション
        @books=Book.all #Bookモデルから全てのデータを取得し、変数@booksに入れている
        @book=Book.new #Bookモデルへ新規ファイル
    end
    
    def create #createアクション
        book = Book.new(book_params) #title,bodyを新しく取得するための変数
        book.save
        if book.save
            flash[:notice]="Book was successfully created."
        end
        if book.save
            redirect_to book_path(book)
        else
            @book=book #空白の投稿をしてしまうと、indexビューの@bookの中身が空っぽになってしまうので、空になっても@bookにbookを入れておけばdbの表示が可能になる
            render :index
        end
        
    end
    
    def show
        @book=Book.find(params[:id])
    end
    
    def edit
        @book=Book.find(params[:id])
        
    end
    
    def update
        book = Book.find(params[:id])
        book.update(book_params)
        if book.update(book_params)
            flash[:notice]="Book was successfully updated."
        end
        if book.update(book_params)
            redirect_to book_path(book.id)
        else
            @book=book
            render :index
        end
    end
    
    def destroy
        book = Book.find(params[:id])
        book.destroy
        if book.destroy
            flash[:notice]="Book was successfully destroyed."
        end
        redirect_to books_path
    end
    
    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
