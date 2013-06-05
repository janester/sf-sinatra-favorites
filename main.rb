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


get "/new_book" do
  erb :new_book
end


post "/new_book" do

end