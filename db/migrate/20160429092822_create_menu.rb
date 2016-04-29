class CreateMenu < ActiveRecord::Migration
def change
  	create_table :menus do |t|
  	  t.string :yelp_id
      t.string :category
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end