class Url < ActiveRecord::Base
	validates :longurl, uniqueness: true, presence: true, format: {with: /(http)(.*)(:\/\/)(.*)/}
	# This is Sinatra! Remember to create a migration!
	def shorten
		#first two lines generate a random string for that is 6 characters in length
		o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
		string = (0...6).map { o[rand(o.length)] }.join
		self.shorturl = string #assign to shorturl
	end

	# def generate
	# end
end

#Url.shorten(www.google.com)