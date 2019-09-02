#? https://wilburhimself.github.io/using-service-objects-in-ruby-on-rails/
#? need a way to replace apiKey keys (48 char length string)
#* SecureRandom.hex(24)
#* look into .uuid too
require 'faraday'
require 'json'

module Eatstreet
	class Restaurants
		attr_accessor :address, :restaurants

		def self.restaurants
			conn = Faraday.new(url: 'https://eatstreet.com/publicapi/v1')
			response =
				conn.get('restaurant/search') do |req|
					req.headers['Content-Type'] = 'application/json'
					req.headers['X-Access-Token'] = ENV['EATSTREET_KEY']
					req.params['street-address'] = '80012'
					req.params['method'] = 'both'
				end

			#! Error handling what if response fails???
			#! Look into caching strategies
			#! Test the feature => what does the user expect when they take this action
			#? How are you going to save restaurants into db efficiently???
			# parse json response
			data = JSON.parse(response.body)
			# access array of restaurant objects
			data['restaurants']
		end
	end
end
