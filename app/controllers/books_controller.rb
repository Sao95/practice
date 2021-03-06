class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    # imageよりも前にトリミング時に使用する仮想属性(モデルで定義を記載する
    params.require(:book).permit(:title, :body, :image_x, :image_y, :image_w, :image_h, :image)
  end

end
