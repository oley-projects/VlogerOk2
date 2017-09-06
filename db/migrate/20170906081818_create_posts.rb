class CreatePosts < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |t|
  		t.text :username
  		t.text :content
  		t.timestamp
  	end
  end
end
