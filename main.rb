require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "janesternbach",
  :password => "",
  :database => "sinatra_favorites",
  :enconding => 'utf-8'
)

require_relative "book"

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
