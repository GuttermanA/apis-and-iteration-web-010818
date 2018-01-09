require 'rest-client'
require 'json'
require 'pry'
require_relative "../lib/command_line_interface.rb"

# def get_films_url_for_character(character,characters_array)
#   characters_array.select do |individual_character|
#     individual_character["name"].downcase == character
#     films_array = individual_character["films"]
#   end
# end
#
# def get_films_hash(films_array)
#   films_hash_array = []
#   films_array.each do |url|
#    film_string = RestClient.get(url)
#    film_hash = JSON.parse(film_string)
#    films_hash_array << film_hash
#  end
#  films_hash_array
# end


def get_character_movies_from_api(character)
  #make the web request
  # url = "http://www.swapi.co/api/people/?page=#{page_n}"

  # all_characters = RestClient.get("http://www.swapi.co/api/people/?page=#{page_n}")
  # character_hash = JSON.parse(all_characters)
  next_url = "http://www.swapi.co/api/people/?page=#{1}"
  page_n = 1
  # all_characters = nil
  # until next_url == nil
  #   all_characters += RestClient.get("http://www.swapi.co/api/people/?page=#{page_n}")
  #   page_n += 1
  # end






  films_array = []
  films_hash_array = []

    # characters = []
  page_n = 1
  until films_array.length > 0 || next_url == nil
    all_characters = RestClient.get("http://www.swapi.co/api/people/?page=#{page_n}")
    character_hash = JSON.parse(all_characters)
    characters_array = character_hash["results"]
    characters_array.each do |individual_character|
      if individual_character["name"].downcase == character
        films_array = individual_character["films"]
      end
    end

    # binding.pry

    films_array.each do |url|
     film_string = RestClient.get(url)
     film_hash = JSON.parse(film_string)
     films_hash_array << film_hash
   end
   next_url = character_hash["next"]
   page_n += 1
  end

 if films_hash_array.length == 0
   puts "Character not found."
   []
 else
   films_hash_array
 end



 # binding.pry

 # films_array = get_films_url_for_character(character, characters_array)
 # get_films_hash(films_array)
end

#WE KNOW OUR NAMES FOR THINGS SUCK. WILL REVISIT.

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.


def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |film|
    # binding.pry
    puts "#{film["title"]}"
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)

end


# def run
#   welcome
#   character = get_character_from_user
#   show_character_movies(character)
# end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

# Pry.start
