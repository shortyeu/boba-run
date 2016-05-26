# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.find_or_create_by(username: "HappyLou",
			first_name: "Louis",
			last_name: "Troung",
			password: "poop",
			email: "happy@lou.com",
			image: "peace")

User.find_or_create_by(username: "Unknown2Ray",
			first_name: "Raymond",
			last_name: "Glassey",
			password: "noob",
			email: "raymond@classy.com",
			image: "love")

User.find_or_create_by(username: "TheVK",
			first_name: "Vincent",
			last_name: "Kong",
			password: "vincentric",
			email: "onetrueVK@world.com",
			image: "patience")

User.find_or_create_by(username: "BotOuyand",
			first_name: "Lawrence",
			last_name: "Ouyang",
			password: "test123",
			email: "lawrence@robots.com",
			image: "selfcontrol")


Friend.find_or_create_by(user_id: 1,
			friend_id: 2)

Friend.find_or_create_by(user_id: 2,
			friend_id: 1)

Friend.find_or_create_by(user_id: 1,
			friend_id: 3)

Friend.find_or_create_by(user_id: 3,
			friend_id: 1)

Friend.find_or_create_by(user_id: 1,
			friend_id: 4)

Friend.find_or_create_by(user_id: 4,
			friend_id: 1)


Group.find_or_create_by(owner_username: "HappyLou",
						group_name: "Cool Kidz",
						image: "joy",
						g_id: "HappyLou_0")

Group.find_or_create_by(owner_username: "HappyLou",
						)

GroupMember.find_or_create_by(g_id: "HappyLou_0",
							member_username: "Unknown2Ray")

GroupMember.find_or_create_by(g_id: "HappyLou_0",
							member_username: "TheVK")

Room.find_or_create_by(room_id: "HappyLou_0",
						runner_id: 1,
						room_name: "My First Boba Run!")

RoomMember.find_or_create_by(room_id: "HappyLou_0",
							room_members_id: 2,
							drink: "Rose Milk Tea, less ice, less sugar",
							price: 3.5,
							runner_paid: false)

Room.find_or_create_by(room_id: "TheVK_0",
						runner_id: 3,
						room_name: "CoCo Westwood Boba Fun")

RoomMember.find_or_create_by(room_id: "TheVK_0",
							room_members_id: 1,
							drink: "Rose Milk Tea, less ice, less sugar",
							price: 3.5,
							runner_paid: false)


# CoCo Menu
Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Toppings", 
			name: "Pearl",
			price: 0.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Toppings", 
			name: "Pudding",
			price: 0.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Toppings", 
			name: "Coconut Jelly",
			price: 0.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Toppings", 
			name: "Red Bean",
			price: 0.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Toppings", 
			name: "Grass Jelly",
			price: 0.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Toppings", 
			name: "Sago",
			price: 0.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Toppings", 
			name: "Cream",
			price: 1.00)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "CoCo Black Tea",
			price: 2.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "Jasmine Green Tea",
			price: 2.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "House Milk Tea",
			price: 2.75)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "Bubble Tea (Pearl Milk Tea)",
			price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "Pudding Milk Tea",
			price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "Sago Milk Tea",
			price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "Grass Jelly Milk Tea",
			price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "Jasmine Milk Tea",
			price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "Taro Milk Tea",
			price: 3.00)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "Cake Taro Milk Tea",
			price: 4.00)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "Caramel Milk Tea",
			price: 3.25)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "Vanilla Milk Tea",
			price: 3.25)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "2 Ladies",
			price: 3.75)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Tea & Milk Tea", 
			name: "3 Buddies",
			price: 4.00)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Fresh Fruit", 
			name: "Grapefruit Green Tea",
			price: 4.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Fresh Fruit", 
			name: "Grapefruit Juice",
			price: 5.00)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Fresh Fruit", 
			name: "Fresh Lemonade",
			price: 5.00)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Fresh Fruit", 
			name: "Lemon Green Tea",
			price: 4.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Fresh Fruit", 
			name: "Lemon Black Tea",
			price: 4.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Fresh Fruit", 
			name: "Lemon Dunk",
			price: 5.25)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Fresh Fruit", 
			name: "Orange Green Tea",
			price: 4.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Fresh Fruit", 
			name: "Orange Juice",
			price: 5.00)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Fresh Fruit", 
			name: "Lemon Winter Melon Tea",
			price: 4.50)

 Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Yakult", 
			name: "Green Tea Yogurt",
			price: 4.00)

  Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Yakult", 
			name: "Mango Yogurt",
			price: 4.00)

   Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Yakult", 
			name: "Grapefruit Yogurt",
			price: 4.50)

    Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
			category: "Yakult", 
			name: "Lemon Yogurt",
			price: 5.00)

# Mixed Juice : 8
Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Mixed Juice", 
	name: "Mango Green Tea",
	price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Mixed Juice", 
	name: "Passion Fruit Green Tea",
	price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Mixed Juice", 
	name: "Passion Fruit Black Tea",
	price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Mixed Juice", 
	name: "Tropical Special",
	price: 4.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Mixed Juice", 
	name: "Sago Winter Melon Tea",
	price: 3.25)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Mixed Juice", 
	name: "Honey Black/Green Tea",
	price: 2.75)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Mixed Juice", 
	name: "Honey Lemon Juice",
	price: 4.50)	

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Mixed Juice", 
	name: "Honey Lemon Juice with Sago",
	price: 3.50)

# Whipped Cream: 2

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Whipped Cream", 
	name: "Cream Black Tea",
	price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Whipped Cream", 
	name: "Cream Green Tea",
	price: 3.50)

# Tea Latte: 3
Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Tea Latte", 
	name: "Tea Latte",
	price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Tea Latte", 
	name: "Matcha Latte",
	price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Tea Latte", 
	name: "Matcha Latte w/ Red Bean",
	price: 4.00)

# Slush & Smoothie: 6
Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Slush & Smoothie", 
	name: "Passion Mango Slush",
	price: 4.00)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Slush & Smoothie", 
	name: "Mango Slush",
	price: 4.00)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Slush & Smoothie", 
	name: "Mango Yogurt Slush",
	price: 4.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Slush & Smoothie", 
	name: "Taro Slush",
	price: 4.00)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Slush & Smoothie", 
	name: "Chocolate Slush",
	price: 4.00)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Slush & Smoothie", 
	name: "Matcha Smoothie",
	price: 4.50)

# Chocolate: 3
Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Chocolate", 
	name: "CoCo Chocolate",
	price: 3.00)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Chocolate", 
	name: "Caramel Chocolate",
	price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Chocolate", 
	name: "Vanilla Chocolate",
	price: 3.50)

# Fresh Milk: 2
Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Fresh Milk", 
	name: "Milk w/ Pearl",
	price: 3.50)

Menu.find_or_create_by(yelp_id: "CoCo Westwood", 
	category: "Fresh Milk", 
	name: "Milk w/ Red Bean & Pearl",
	price: 3.50)

Conversion.find_or_create_by(yelp_id: "CoCo Westwood", 
	medium_to_large: 0.75, 
	tax_included: true,
	tax_rate: 0.09)










