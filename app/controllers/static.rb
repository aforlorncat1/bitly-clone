require_relative '../models/url'

get '/' do #if the console gets only a "/", this command will execute and will bring the browser to the home/index page.
	@url = Url.all
  erb :"static/index"
end

post '/urls' do #creates a new url that captures the current input of long_url in longurl
	x = Url.new(longurl:params[:long_url])
	x.shorten
	x.clickcount = 0
	x.save
	redirect to ('/')
end

get '/:short_url' do 
	y = Url.find_by(shorturl: params[:short_url])
	y.clickcount += 1
	y.save
	redirect y.longurl
end
