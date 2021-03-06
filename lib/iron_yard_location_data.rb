require 'pry'

class IronScrape

	def run(hash)
		@hash = hash
	  greeting
	  main_menu
	  response = gets.chomp
	  until response == "exit"
	    if response == 'list'
	  	  locations
	  	  space
	  	  main_menu
	  	  response = gets.chomp
	  	elsif city_matcher_array.include?(response)
	  		puts "You choose #{response}!"
	  		space
	  		city_exploration(response)
	  		space
	  		main_menu
	  		response = gets.chomp
	  	else
	  		no_match
	  		space
	  		main_menu
	  		response = gets.chomp
	  	end
	  end
	  space
	  goodbye
	end

	def greeting
		puts "Welcome to Garett's first self-designed programming project. This interface scrapes off the Iron Yard website. Please choose from the following commands:"
	end

	def main_menu
		puts "1. Type 'list' to see all the locations of Iron Yard Bootcamps."
		puts "2. Type the name of the location that you wish to explore (as it appears in the list)."
		puts "3. Type 'exit' to leave the program."
		space
	end

	def no_match
		puts "Sorry! I don't recognize your request. Try again"
	end

	def locations
		@hash.keys.each do |city|
			puts city
		end
	end

	def goodbye
		puts "Thanks for using this program! Bye!"
	end

	def city_matcher_array
		@hash.keys
	end

	def space
		puts ''
	end

	def city_exploration(city_key)
		city_hash = @hash[city_key]
		subprogram = CityInfo.new(city_hash)
		subprogram.run
	end


end

class CityInfo

	def initialize(city_hash)
		@city_hash = city_hash
	end

	def run
		city_menu
		response = gets.chomp.downcase
		until response == 'exit'
			case response 
			when 'offerings'
				@city_hash[offerings].each do |offering|
					puts offering
				end
				space
				puts "What's next?"
				space
				city_menu
				response = gets.chomp.downcase
			when 'team'
				#todo - action
			else
				no_match
				space
				city_menu
				response = gets.chomp.downcase
			end
		end
	end

	def city_menu
		puts "Please choose from the following options:"
		puts "1. Type 'offerings' to view what classes are offered at this location."
		puts "2. Type 'team' to review who works at the Iron Yard at this location."
		puts "3. Type 'exit' to return to the main menu."
		space
	end

	def space
		puts ''
	end

	def no_match
		puts "Sorry! I don't recognize your request. Try again"
	end

end
























