require 'open-uri'
require 'resolv-replace'

puts "Adding episodes..."
# sources: https://en.wikipedia.org/wiki/List_of_Star_Trek:_Discovery_episodes

epi = [
  {
    name: "The Vulcan Hello",
    air_date: "Septembre 24, 2017",
    episode: "S01E01",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/1"
  },
  {
    name: "Battle at the Binary Stars",
    air_date: "Septembre 24, 2017",
    episode: "S01E02",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/2"
  },
  {
    name: "Context Is for Kings",
    air_date: "October 1, 2017",
    episode: "S01E03",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/3"
  },
  {
    name: "The Butcher's Knife Cares Not for the Lamb's Cry",
    air_date: "October 8, 2017",
    episode: "S01E04",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/4"
  },
  {
    name: "Choose Your Pain",
    air_date: "October 15, 2017",
    episode: "S01E05",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/5"
  },
  {
    name: "Lethe",
    air_date: "October 22, 2017",
    episode: "S01E06",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/6"
  },
  {
    name: "Magic to Make the Sanest Man Go Mad",
    air_date: "October 29, 2017",
    episode: "S01E07",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/7"
  },
  {
    name: "Si Vis Pacem, Para Bellum",
    air_date: "November 5, 2017",
    episode: "S01E08",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/8"
  },
  {
    name: "Into the Forest I Go",
    air_date: "November 12, 2017",
    episode: "S01E09",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/9"
  },
  {
    name: "Despite Yourself",
    air_date: "January 7, 2018",
    episode: "S01E10",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/10"
  },
  {
    name: "The Wolf Inside",
    air_date: "January 14, 2018",
    episode: "S01E11",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/11"
  },
  {
    name: "Vaulting Ambition",
    air_date: "January 21, 2018",
    episode: "S01E12",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/12"
  },
  {
    name: "What's Past Is Prologue",
    air_date: "January 28, 2018",
    episode: "S01E13",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/13"
  },
  {
    name: "The War Without, The War Within",
    air_date: "February 4, 2018",
    episode: "S01E14",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/14"
  },
  {
    name: "Will You Take My Hand?",
    air_date: "February 11, 2018",
    episode: "S01E14",
    characters: [
      "http://localhost:3000/api/character/1",
      "http://localhost:3000/api/character/2"
    ],
    url: "http://localhost:3000/api/episode/15"
  }
]

epi.each do |attributes|
  epi = Episode.create!(attributes)
    puts "Episode : #{epi.name} added"
end

sleep(1)
puts "Finished!"


