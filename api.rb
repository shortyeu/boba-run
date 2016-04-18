require 'sinatra'
require 'sinatra/base'
require 'json'
require './config/environment'
require './app/models/widget'
require "active_record"
require "sinatra/activerecord"

before do
  request.body.rewind
  @request_payload = JSON.parse request.body.read
end

class API < Sinatra::Base
  get '/' do
  	content_type :json
  	@users = User.all
  	{:result => [@users]}.to_json
  end

  get '/sushi.json' do
    content_type :json
    
    {:sushi => ["Maguro", "Hamachi", "Uni", "Saba", "Ebi", "Sake", "Tai"]}.to_json
  end

  def widget_params
      params.require(:widget).permit(:name, :description, :stock)
  end

  post '/submit' do
  	params['name']
 	@widget = Widget.new
 	@widget.name = params['name']
 	@widget.description = params['description']
 	@widget.stock = params['stock']
	@widget.save
  end

  post '/edit' do
  end

  post '/login' do
  	content_type :json
  	@result_user = User.find_by username: params['username']
  	if @result_user.password === params['password'] 
  		{:result => [@result_user.id, "success"]}.to_json
  	else
  		{:result => ["failure"]}.to_json
  	end

  end

  post '/new_user' do
  	@user = User.new
  	@user.username = params['username']
  	@user.password = params['password']
  	@user.save
  end

  post '/edit_user/venmo_id' do

  end

  post '/edit_user' do
  	@results = User.find_by username: params['username']
  	@results.password = params['password']
  	@results.venmo_id = params['venmo_id']
  	@results.email = params['email']
  	@results.save
  end

  post  '/get_user/username' do
  	content_type :json
  	@results = User.find_by username: params['username']
  	{:result => [@results]}.to_json
  end

  post  '/get_user/venmo_id' do
  	content_type :json
  	@results = User.find_by venmo_id: params['venmo_id']
  	{:result => [@results]}.to_json
  end

  post  '/get_user/id' do
  	content_type :json
  	@results = User.find_by id: params['id']
  	{:result => [@results]}.to_json
  end

  post '/get_friends' do
  	content_type :json
  	@results = Friend.all.where(user_id: params['id'])
  	@ids = Array.new
  	@results.each do |id|
  		@ids.push(id.friend_id)
  	end
  	@friends = User.all.where(id: @ids)
  	{:results => [@friends]}.to_json
  end

  post '/add_friend' do
  	@friend = Friend.new
  	@friend.user_id = params['id']
  	@friend.friend_id = params['friend_id']
  	@friend.save

  	@friend_reciprocate = Friend.new
  	@friend_reciprocate.user_id = params['friend_id']
  	@friend_reciprocate.friend_id = params['id']
  	@friend_reciprocate.save
  end
end


