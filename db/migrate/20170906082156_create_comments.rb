class CreateComments < ActiveRecord::Migration[5.1]
  def change
	create_table :comments do |t|
  		t.text :username
  		t.text :comment
  		t.timestamp
  	end
  end
end
