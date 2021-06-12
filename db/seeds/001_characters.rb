require 'open-uri'
require 'resolv-replace'

puts "Reset database..."

Character.destroy_all
Episode.destroy_all

puts "Add new character..."

character = [
  {
    name: "Michael Burnham",
    status: "Alive",
    born: 2226,
    species: "human",
    planet: "Earth",
    occupations: [
    "First Officer - USS Shenzhou (2250s–2256)",
    "Science specialist - USS Discovery (2256)",
    "Captain (mirror universe) - USS Discovery",
    "Science officer  - USS Discovery (2257–3189)",
    "Captain (3189-) - USS Discovery"
    ],
    description: "Michael Burnham, Jr. was a female 23rd century Human Starfleet officer raised on Vulcan by Ambassador Sarek and Amanda Grayson following the death of her parents.",
    gender: "female",
    image: {
        io: URI.open('https://res.cloudinary.com/dgtxqlmt9/image/upload/v1623510050/michael-burnham_wmwbui.jpg'),
        filename: 'Michael_Burnham.jpg'
    },
    episode: [ 
        "http://localhost:3000/api/episode/1", 
        "http://localhost:3000/api/episode/2", 
        "http://localhost:3000/api/episode/3"
    ],
    url: "http://localhost:3000/api/character/1"
  },
  {
    name: "Saru",
    status: "Alive",
    born: nil,
    species: "kelpien",
    planet: "Kaminar",
    occupations: [
    "Lieutenant - USS Shenzhou (2249–2256)",
    "Lieutenant Commander - USS Shenzhou (2256)",
    "Capitain - USS Discovery (mirror universe)",
    "..."
    ],
    description: "Saru was a male Kelpien Starfleet officer from Kaminar who lived during the mid-23rd century. The first Kelpien to have voluntarily left his homeworld, and the first of his species to enter Starfleet service",
    gender: "Male",
    image: {
        io: URI.open('https://res.cloudinary.com/dgtxqlmt9/image/upload/v1623515070/saru_t6hhyo.jpg'),
        filename: 'Saru.jpg'
    },
    episode: [ 
        "http://localhost:3000/api/episode/1", 
        "http://localhost:3000/api/episode/2", 
        "http://localhost:3000/api/episode/3"
    ],
    url: "http://localhost:3000/api/character/2"
  }
]
 

character.each do |attributes|
    character = Character.create!(attributes)
    puts "Character : #{character.name} created !"
end

sleep(1)
puts "Finished!"
