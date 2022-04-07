class Api::V1::BooksController < ApplicationController
    def index
        @books = Book.all
        render json: @books
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            render json: @book
        else
            render json: { errors: book.errors.full_messages }, status: 422
        end
    end

    def show
        @book = Book.find(params[:id])
        render json: @book
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            render json: @book
        else
            render json: { errors: book.errors.full_messages }, status: 422
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        render json: { message: "Book successfully destroyed" }
    end
end
