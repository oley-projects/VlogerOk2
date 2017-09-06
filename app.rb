require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:vlogerok.db"

class Post < ActiveRecord::Base
	validates :username, 	presence: true, length: { in: 3..25 }
	validates :content, 	presence: true, length: { in: 3..2500 }
end

class Comment < ActiveRecord::Base
	validates :username, 	presence: true, length: { in: 3..25 }
	validates :content, 	presence: true, length: { in: 3..300 }
end

before do
	@posts = Post.all
	@comments = Comment.all
end

get '/' do
	@posts = Post.order "created_at DESC"
	erb :index
end

get '/new' do
	@p = Post.new
	erb :new
end

post '/new' do
 	@p = Post.new params[:post]
 	if @p.save
		redirect to('/')
	else
		@error = @p.errors.full_messages.first
		erb :new
	end
end

get '/post-:id' do
	@c = Comment.new
	@p = Post.new
	@post = Post.find(params[:id])
	@comments = Comment.order "created_at DESC"
	erb :post

end

post '/post-:id' do
	@p = Post.new params[:post]
	@c = Comment.new params[:comment]

	if @c.save
		redirect to('/post-:id')
	else
		@error = @c.errors.full_messages.first
		erb :post
	end	
end