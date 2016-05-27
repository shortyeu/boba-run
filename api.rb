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
  	content_type :json
  	@users = User.all
  	{:message => "HELLO, THIS IS BOBA-RUN BACKEND", :result => @users}.to_json
  end

  # ================
  # USER
  # ================
  get '/user/show_all' do 
    {:message => User.all}.to_json
  end

  post '/login' do
  	content_type :json
  	@result_user = User.find_by username: params['username']
  	if @result_user and @result_user.password === params['password'] 
  		{:error => "false", :result => [@result_user], :message => "success"}.to_json
  	else
  		{:error => "true", :message => "Incorrect password or username."}.to_json
  	end
  end

  post '/user/create' do
    @results = User.find_by username: params['username']
    if @results 
        {:error => "true", :message => "Username already exists."}.to_json
    else
    	@user = User.new
      @user.first_name = params['first_name']
      @user.first_name = params['last_name']
    	@user.username = params['username']
    	@user.password = params['password']
      @user.email = params['email']
      @user.number = params['number']
    	@user.save
      {:error => "false", :result => [@user], :message => "success"}.to_json
    end
  end

  post '/user/edit' do
  	@results = User.find_by username: params['username']
    if params['password']
  	   @results.password = params['password']
    end
  	if params['email']
       @results.email = params['email']
    end
  	@results.save
    {:error => "false", :result => [@results], :message => "success"}.to_json
  end

  post '/user/show/username' do
  	content_type :json
    @results = User.find_by(username: params['username'])
  	{:error => "false", :result => [@results], :message => "success"}.to_json
  end

  post  '/user/show/id' do
  	content_type :json
  	@results = User.find_by id: params['id']
  	{:error => "false", :result => [@results], :message => "success"}.to_json
  end
  
  post '/user/show/number' do
    content_type :json
    @results = User.find_by (username: params['username']).select("numbers")
    

  post '/user/delete' do 
    @user = User.find_by username: params['username']
    if @user
      User.delete(@user)
      {:error => "false", :message => "success"}.to_json
    else
      {:error => "true", :message => "failure"}.to_json
    end

  end
  post '/user/show/numbers' do
    @users = User.all.where(username: params['username'])

    @numbers = Array.new
    @users.each do |m|
    @numbers.push(m.number)

    {:error => "false", :result => @numbers.select("numbers") :message => "success"}.to_json
  end


  # ================
  # FRIENDS
  # ================
  post '/friend/show_all' do
    {:result => Friend.all}.to_json
  end

  post '/friend/show/id' do
  	content_type :json
  	@results = Friend.all.where(user_id: params['id'])
  	@ids = Array.new
  	@results.each do |id|
  	   @ids.push(id.friend_id)
  	end
  	@friends = User.all.where(id: @ids)
  	{:error => "false", :result => @friends, :message => "success"}.to_json
  end

  post '/friend/show/username' do
    content_type :json
    @id = User.find_by(username: params['username'])
    @results = Friend.all.where(user_id: @id.id)
    @ids = Array.new
    @results.each do |id|
       @ids.push(id.friend_id)
    end
    @friends = User.all.where(id: @ids)
    {:error => "false", :result => @friends, :message => "success"}.to_json
  end

  post '/friend/create' do
  	@friend = Friend.new
  	@friend.user_id = params['id']
  	@friend.friend_id = params['friend_id']
  	@friend.save

  	@friend_reciprocate = Friend.new
  	@friend_reciprocate.user_id = params['friend_id']
  	@friend_reciprocate.friend_id = params['id']
  	@friend_reciprocate.save

    {:error => "false", :result => [@friend.user_id, @friend_reciprocate.user_id], :message => "success"}.to_json
  end

  post '/friend/create/username' do
    @id = User.find_by(username: params['username']).id
    @friend_id = User.find_by(username: params['friend_username']).id
    if @friend_id
      @friend = Friend.new
      @friend.user_id = @id
      @friend.friend_id = @friend_id
      @friend.save

      @friend_reciprocate = Friend.new
      @friend_reciprocate.user_id = @friend_id
      @friend_reciprocate.friend_id = @id
      @friend_reciprocate.save

      {:error => "false", :result => [@friend], :message => "success"}.to_json
    else
      {:error => "true", :message => "invalid friend id"}
    end
  end

  post '/friend/delete' do
    # takes in user_id and friend_id
    @friend = Friend.all.where(user_id: params['id']).where(friend_id: params['friend_id'])
    @friend_reciprocate = Friend.all.where(user_id: params['friend_id']).where(friend_id: params['id'])
    Friend.delete(@friend)
    Friend.delete(@friend_reciprocate)

    {:error => "false", :message => "success"}.to_json
  end

  # ================
  # GROUPS
  # ================
  post '/group/create' do
    # create new group using owner's username
    @group = Group.new
    @group.owner_username = params['owner_username']

    @count = Group.all.where(owner_username: params['owner_username']).count
    @group.g_id = "#{params['owner_username']}_#{@count}"

    @group.group_name = params['name']
    @group.save
    {:error => "false", :result => [@group], :message => "success"}.to_json
  end

  post '/group/show/username' do
    # retrieve all groups with given username
    @groups = Group.all.where(owner_username: params['owner_username'])
    {:error => "false", :result => @groups}.to_json
  end

  get '/group/show_all' do
    # dump all groups created
    {:error => "false", :result => Group.all}.to_json
  end

  post '/group_member/create' do
    # given g_id, add member
    @group_member = GroupMember.new
    @group_member.g_id = params['g_id']
    @group_member.member_username = params['username']
    @group_member.save

    {:error => "false", :message => "success"}.to_json
  end

  post '/group_member/show/g_id' do
    # return all members with given g_id
    # add a check to see if g_id exists?
    @members = GroupMember.all.where(g_id: params['g_id'])
    @usernames = Array.new
    @members.each do |m|
      @usernames.push(m.member_username)
    end

    {:error => "false", :result => User.all.where(username: @usernames)}.to_json

  end

  post '/group_member/show_all' do
    {:error => "false", :result => GroupMember.all}.to_json
  end

  # ================
  # ROOMS
  # ================
  get '/room/show_all' do
    {:error => "false", :result => Room.all}.to_json
  end

  post '/room/create' do
    # takes in runner id
    @room = Room.new
    @room.runner_id = params['runner_id']

    @count = Room.all.where(runner_id: params['runner_id']).count
    @room.room_id = "#{params['runner_id']}_#{@count}"
    @room.room_name = params['room_name']
    @room.save

    # returns the room number back to the client
    {:error => "false", :result => "#{@room.room_id}", :message => "success" }.to_json
  end

  post '/room/delete' do
    # takes in room id
    # delete this room.
    # go to room_member and delete all entries with this room number

    @room = Room.find_by(room_id: params['room_id'])
    Room.delete(@room)
    RoomMember.delete_all(room_id: params['room_id'])

    {:error => "false", :message => "success"}.to_json

  end

  post '/room/show' do
    # takes in a room number (id)
    @room = Room.find_by(room_id: params['room_id'])
    # returns runner_id
    {:error => "false", :result => @room}.to_json
  end

  post '/room/show/member' do 
    # get all rooms that contain a particular user, given the user's id
    # get all rooms where user is the runner
    @runner_rooms = Room.all.where(runner_id: params['id'])

    # get all rooms where the user is a member
    @member_rooms = RoomMember.all.where(room_members_id: params['id'])

    @room_ids = Array.new
    @member_rooms.each do |m|
      @room_ids.push(m.room_id)
    end

    @total_rooms = @runner_rooms.push(*(Room.all.where(room_id: @room_ids)))

    {:error => "false", :result => @total_rooms}.to_json
  end

  post '/room/show/member/username' do 
    # get all rooms that contain a particular user, given the user's id
    # get all rooms where user is the runner
    @user = User.find_by(username: params['username'])

    @runner_rooms = Room.all.where(runner_id: @user.id)

    # get all rooms where the user is a member
    @member_rooms = RoomMember.all.where(room_members_id: @user.id)

    @room_ids = Array.new
    @member_rooms.each do |m|
      @room_ids.push(m.room_id)
    end

    @total_rooms = @runner_rooms.push(*(Room.all.where(room_id: @room_ids)))

    {:error => "false", :result => @total_rooms}.to_json

  end

  # ================
  # ROOM MEMBERS
  # ================

  post '/room_member/create' do
    # takes in room id
    # member id
    # drink
    # price

    @member = RoomMember.new
    @member.room_id = params['room_id']
    @member.room_members_id = params['member_id']

    # adds member id and drink entry to room table
    @member.drink = params['drink']
    @member.price = params['price']

    @member.drink_purchased = false
    @member.runner_paid = false
    @member.save

    # returns success/ failure
    {:error => "false", :message => "success"}.to_json
  end

  post '/room_member/edit/price' do
  # takes in roomid, memberid, price

    @drink = RoomMember.all.where(room_members_id: params['member_id']).where(room_id: params['room_id'])
    @drink.price = params['price']
    @drink.save

    {:error => "false", :message => "success" }

  end  

  post '/room_member/edit/drink' do
    # takes in room number
    # takes in member id (drink owner)
    # takes in JSON of drink information
    @drink = RoomMember.all.where(room_members_id: params['member_id']).where(room_id: params['room_id'])
    @drink.drink = params['drink']

    # returns success or failure to add
    {:error => "false", :message => "success"}.to_json
  end

  post '/room_member/edit/runner_paid' do
  # takes in room number
  # takes in member id (drink owner)
  # update runner_paid field

    @drink = RoomMember.all.where(room_members_id: params['member_id']).where(room_id: params['room_id'])
    @drink.runner_paid = params['runner_paid']

    # returns success or failure to add
    {:error => "false", :message => "success"}.to_json
  end

  post '/room_member/delete/member' do
    # takes in room id and member id
    @member = RoomMember.all.where(room_id: params['room_id']).where(room_members_id: params['member_id'])
    RoomMember.delete(@member)
    {:error => "false", :message => "success"}.to_json
  end

  get '/room_member/show_all' do
    {:error => "false", :result => RoomMember.all}.to_json
  end


  # ================
  # MENU
  # ================
  # Have some way of retrieving cost from our database of restaurants?
  # have restaurant id, drink name, price of base, price of topping
  post '/menu/create/drink' do
    # add a menu item to a restaurant
  end

  post '/menu/edit/drink' do
    # edit menu item
  end

  post '/menu/show' do
    # takes in yelp id
    # returns menu items with that ID

    {:error => "false", :result => Menu.all.where(yelp_id: params['yelp_id'])}.to_json
  end

  post '/menu/show/category' do
    # takes in yelp_id
    # takes in category

    # returns menu items with that ID and category
    {:error => "false", :result => Menu.all.where(yelp_id: params['yelp_id']).where(category: params['category'])}.to_json
  end
end


