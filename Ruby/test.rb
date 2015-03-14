keepGoing = true
foundNumber = false
numberToGuess = rand(10)
response = ''
while keepGoing
	puts 'Find the magic number between O and 9'
	proposedN = gets.chomp.to_i
	if proposedN == numberToGuess
		puts "You found the correct number : #{numberToGuess}"
		puts 'Another try ? (Y/N)'
		numberToGuess = rand(10)
		response = gets.chomp
		while response != 'N' and response != 'Y'
			puts 'Please fill in either Y or N'
			response = gets.chomp
		end
	else
		puts 'Not correct. Please, try again'
	end

	if response == 'N'
		keepGoing = false
	else
		keepGoing = true
	end
end