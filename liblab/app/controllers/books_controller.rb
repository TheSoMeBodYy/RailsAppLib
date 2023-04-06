class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def create
    book = @library.books.create! params.required(:book).permit(:authors, :genres)
    redirect_to @library
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_book
      @library = Library.find(params[:library_id])
    end
end
