class ChangeUsersIdTable < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.remove :user_id
  	end
  end
end