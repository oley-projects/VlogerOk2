require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:vlogerok.db"

class Post < ActiveRecord::Base

end

class Commemt < ActiveRecord::Base

end

before do
	@posts = Post.all
	#@commemts = Commemt.all
end

get '/' do
	@posts = Post.order "created_at DESC"
	erb '-----'
end

get '/new' do
	erb :new
end
