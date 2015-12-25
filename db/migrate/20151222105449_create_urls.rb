# require_relative '../../config/database'

class CreateUrls < ActiveRecord::Migration
	def change
		create_table :urls do|t|
			t.string :longurl
			t.string :shorturl

			t.timestamps null: false
		end
	end
end
