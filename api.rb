require 'sinatra'
require 'sinatra/base'
require 'json'
require './config/environment'
require "active_record"
require "sinatra/activerecord"

before do
  request.body.rewind
  @request_payload = JSON.parse request.body.read
end

class API < Sinatra::Base
  get '/' do
  	"HELLO"
  	# content_type :json
  	# @users = User.all
  	# {:result => [@users]}.to_json
  end

  get '/sushi.json' do
    content_type :json
    
    {:sushi => ["Maguro", "Hamachi", "Uni", "Saba", "Ebi", "Sake", "Tai"]}.to_json
  end
  # ================
  # USER
  # ================
  post '/login' do
  	content_type :json
  	@result_user = User.find_by username: params['username']
  	if @result_user.password === params['password'] 
  		{:id => @result_user.id, :message => "success"}.to_json
  	else
  		{:message => "failure"}.to_json
  	end

  end

  post '/new_user' do
    @results = User.find_by username: params['username']
    if @results 
        {:error => "true", :message => "Username already exists."}.to_json
    else
    	@user = User.new
    	@user.username = params['username']
    	@user.password = params['password']
    	@user.save
      {:id => @user.id, :message => "success"}.to_json
    end
  end

  post '/edit_user/venmo_id' do

  end

  post '/edit_user' do
  	@results = User.find_by username: params['username']
  	@results.password = params['password']
  	@results.venmo_id = params['venmo_id']
  	@results.email = params['email']
  	@results.save
    {:result => [@results]}.to_json
  end

  post '/get_user/username' do
  	content_type :json
    @results = User.all.where(username: params['username'])
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

  # ================
  # FRIENDS
  # ================
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

  # ================
  # DRINKS
  # ================
  get '/get_all' do

  { :results => Room.all}.to_json
  end

  post '/create_room' do
  # takes in runner id
  @room = Room.new
  @room.runner_id = params['runner_id']

  @count = Room.all.where(runner_id: params['runner_id']).count
  @room.room_id = "#{params['runner_id']}_#{@count}"

  @room.save

  # returns the room number back to the client
  { :results => "#{@room.room_id}", :message => "success" }.to_json
  end

  post '/add_member_to_room' do
  # takes in room number
  # @room = Room.find_by(room_id: params['room_id'])
  @room = Room.new

  # adds member id and drink entry to room table

  # returns success/ failure
  end

  post '/edit_room/add_member' do 
  # this is after client has confirmed member joining

  # takes in room number, and member id(s) to add
  # assume room number is valid

  # checks if member is already in the room
  # if not, adds member_id to room
  end

  post '/edit_room/add_drink' do
  # takes in room number
  # takes in member id (drink owner)
  # takes in JSON of drink information

  # returns success or failure to add
  end

  post '/edit_room/edit_drink' do 
  # ?? not sure of use case for this, but
  # if a member needs to edit his/her drink

  # takes in room number 
  # takes in member id (drink owner)
  # takes in JSON of drink information

  # return success or failure
  end

  post '/edit_room/confirm_payment' do
  # takes in room number
  # takes in member id (drink owner)
  # update runner_paid field

  # return success
  end

  post '/get_room_info' do
  # takes in a room number (id)

  # return all room info
  end

  post '/get_room_info/runner_id' do

  end


  # ================
  # PRICES
  # ================
  # Have some way of retrieving cost from our database of restaurants?

  # restaurant id?
  # 
end


