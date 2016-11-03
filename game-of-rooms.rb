require 'pry'
require 'colorize'

# https://github.com/marianmartinez/ironhack-game-of-rooms/blob/master/game_of_rooms.rb
# https://github.com/mikelgarciaurbina/week-1/tree/master/Exercise%20-%20A%20game%20of%20rooms

class Game

	def initialize
		@player_name = ""
		@position = [0,0]   # start position
		@saved_position = [[0,0]]
		@game_board = [
		[0,0], [0,1], [0,2],
		[1,0], [1,1] 
		]
	end

	def start
		puts "What´s your name?"
		player_name = gets.chomp
		# 0.upto(2) do
  # 			STDOUT.print "\rHi #{player_name}, welcome to Game of Rooms."
  # 			sleep 0.5
  # 			STDOUT.print "\r                                            " # Send return and six spaces
  # 			sleep 0.5
		# end
		puts "Hi #{player_name}, welcome to Game of Rooms."
		puts "\n"
		puts "I hope you finish alive"	
		define_doors
	end

	def define_doors
		
		puts "Which door will you open?"

		if @position == [0,0]
			puts "Avalaible doors at East(E) and South(S)"

		end

		if @position == [0,1]
			puts "Avalaible doors at East(E),South(S) and West(W)"
		end

		if @position == [0,2]
			puts "Your are safe!".colorize(:green)
			exit
		end

		if @position == [1,0]
			puts "Avalaible doors at North(N) and East(E)"
		end

		if @position == [1,1]
			puts "Avalaible doors at North(N) and West(W)"
		end
	
		movement
	end

	def movement
		@sum_position = [1,1]
		new_position = gets.chomp.upcase
		@old_position = @position.clone #Clone in a new array our position before each movement.

		if new_position == "N"
			@position[0] -= @sum_position[0]

		elsif new_position == "E"
			@position[1] += @sum_position[1] 

		elsif new_position == "S"
	
			@position[0] += @sum_position[0]
		
		elsif new_position == "W"
			@position[1] -= @sum_position[1]
		else
			puts "Wrong direction!!!".colorize(:red)
			define_doors
		end
		
		validate
	end

	def validate
		if @game_board.include?(@position)
			puts "#{@player_name} you are in the room #{@position}"
			define_doors
		else
			puts "There´s no door in this direction"
			@position = @old_position.clone #get back from the saved position the last position.
			puts "#{@player_name} you are in the room #{@position}"
			define_doors

		end
	end
end




class Player
end

game = Game.new
game.start


