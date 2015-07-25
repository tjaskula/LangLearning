keepGoing = true
numberToGuess = rand(10)
firstRun = true
response = ''
while keepGoing
	if firstRun
		puts 'Find the magic number between O and 9'
		firstRun = false
	end
	proposedN = gets.chomp.to_i
	if proposedN == numberToGuess
		firstRun = true
		puts "You found the correct number : #{numberToGuess}"
		puts 'Another try ? (Y/N)'
		numberToGuess = rand(10)
		response = gets.chomp
		while response != 'N' and response != 'Y'
			puts 'Please fill in either Y or N'
			response = gets.chomp
		end
		response == 'N' ? keepGoing = false : keepGoing = true
		response = ''
	else
		if proposedN > numberToGuess 
			puts 'Too high'
		else
			puts 'Too low' 
		end
	end
end