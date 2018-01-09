def welcome
  # puts out a welcome message here!
  puts "Hi there, and may the force be with you, Star Wars fan!"
end

def get_character_from_user
  puts "Please enter the character's name:"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp.downcase
  input
  # binding.pry
end
