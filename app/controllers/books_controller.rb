class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy]
  NUMBER_OF_ITEMS = 5

  # GET /books
  def index
    @books = Book.all.page(params[:page]).per(NUMBER_OF_ITEMS)
  end

  # GET /books/1
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = current_user.books.new(book_params)

    if @book.save
      redirect_to @book, notice: t('Book was successfully created')
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: t('Book was successfully updated')
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: t('Book was successfully destroyed')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = current_user.books.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :memo, :author, :picture)
  end
end
