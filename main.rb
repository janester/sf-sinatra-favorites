require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "pry"

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "janesternbach",
  :password => "",
  :database => "sinatra_favorites",
  :enconding => 'utf-8'
)

require_relative "book"

get "/" do
  @books = Book.all
  erb :index
end


get "/new_book" do
  erb :new_book
end


post "/new_book" do
  @book = Book.new(:name => params[:book_name], :genre => params[:book_genre])
  if @book.save
    redirect "/"
  else
    erb :new_book
  end
end


get "/edit_book/:book_id" do
  @book = Book.find(params[:book_id])
  erb :edit_book
end


post "/save_book/:book_id" do
  @book = Book.find(params[:book_id])
  if @book.update_attributes(:name => params[:book_name], :genre => params[:book_genre])
    redirect "/"
    else
      erb :edit_book
  end
end