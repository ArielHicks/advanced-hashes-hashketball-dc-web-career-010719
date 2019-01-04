require 'pry'

def game_hash
# we start off by defining game_hash which we'll refer back to during the entire lab
# then we go through and start plugging in key/value pairs for the home team
  game_hash = {home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {"Alan Anderson" => {
      number: 0,
      shoe: 16,
      points: 22,
      rebounds: 12,
      assists: 12,
      steals: 3,
      blocks: 1,
      slam_dunks: 1,
      },
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7,
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15,
          },
          "Mason Plumlee" => {
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 12,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5,
            },
            "Jason Terry" => {
              number: 31,
              shoe: 15,
              points: 19,
              rebounds: 2,
              assists: 2,
              steals: 4,
              blocks: 11,
              slam_dunks: 1,
              }}
  },
  # then there are more key/value pairs for the away team
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {"Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2,
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10,
          },
          "DeSagna Diop" => {
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5,
            },
            "Ben Gordon" => {
              number: 8,
              shoe: 15,
              points: 33,
              rebounds: 3,
              assists: 2,
              steals: 1,
              blocks: 1,
              slam_dunks: 0,
              },
              "Brendan Haywood" => {
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 22,
                blocks: 5,
                slam_dunks: 12,
                }}
      }
    }

end

# once all the key/value pairs are passing, the lab asks for me to build a series of methods
# that operate on the above to return certain information about the teams and players.
# I'll use game_hash like a variable that points to the hash and operates on it inside the methods I build


# num_points_scored takes an argument of a players name and returns the number of points scored for that player
# by pulling from the nested hash I've built above ^
def num_points_scored(player_name)
# we use .each do |team, random| to iterate over each piece of data to expose specific data, in this case number of points scored by each player, within the above hash
# and we use symbols (with one object id) to take up less memory
  game_hash.each do |team, random|
    game_hash[team][:players].each do |name, stats|
     if player_name == name
       binding.pry
       return stats[:points]
# then we want to return the number of points scored for each player if player_name is equal to the key of name

      end
    end
  end

end

# i am not really understanding why the heck we need so many end statements?? Ha.

# shoe_size takes in an argument of a players name and returns the shoe size for that player
def shoe_size(player_name)
  # using .each do |location, team_data| to iterate over each piece of data to expose specific data, in this case the team_players
  game_hash.each do |location, team_data|
    # goes through all of the players and then a name and its value
    team_data[:players].each do |name, data|
    # if the key "name" is equal to player_name then the value of shoe should be returned
      if name == player_name
        return data[:shoe]
      end
    end
  end
end

# team_colors takes in an argument of the team name and returns an array of that teams colors
def team_colors(name_of_team)
  # using .each do |team, random| game_hash[team].each do |name, random| to iterate over each piece of data
  # then, if the name_of_team is equal to random, we'll get a return value of the colors of each team.
  game_hash.each do |team, random|
    game_hash[team].each do |name, random|
        if name_of_team == random
          return game_hash[team][:colors]
        end
    end
  end
end

# team_names operates on the game hash to return an array of team names
def team_names
  # built an empty array called teams
  teams = []
  # game_hash.each do |team, random| iterates over the hash to return all of the team_names
  game_hash.each do |team, random|
      teams.push(game_hash[team][:team_name])
  end
  return teams
end

# player_numbers takes an argument of a team name and returns an array of the jersey number's for that team
def player_numbers(name_of_team)
  #built an empty array called numbers
  numbers = []
  # game_hash.each do |team, random| iterates over the hash to return all player numbers
  game_hash.each do |team, random|
    if name_of_team == game_hash[team][:team_name]
      game_hash[team][:players].each do |name, stats|
        numbers.push(stats[:number])
      end
    end
  end
  return numbers
end

# player_stats takes in an argument of a player's name and returns a hash of that palyer's stats
def player_stats(name)
# player_stats start at nil (nothing)
  player_stats = nil
# game_hash.each do |home_away, team_info| iterates over the hash to return all player_stats
  game_hash.each do |home_away, team_info|
    team_info.each do |data_label, data|
      if data_label == :players
        data.each do |player_name, stats|
          if player_name == name
            player_stats = stats
          end
        end
      end
    end
  end
  player_stats
end


# big_shoe_rebounds returns the number of rebounds associated with the player that has the largest shoe size
def big_shoe_rebounds
  # built an empty array called names
  names = []
  # built an empty array called shoe_sizes
  shoe_sizes = []
  # game_hash.each do |team, random| iterates over the hash
  game_hash.each do |team, random|
    game_hash[team][:players].each do |name,stats|
      names.push(name)
      shoe_sizes.push(stats[:shoe])
    end
  end
  # finds the player with largest shoes size
  largest = 0
  shoe_sizes.each do |x|
    if x > largest
      largest = x
    end
  end

  # we want to add to player_with_largest the actual largest shoe size and we can do that by adding a key with an array as a value
  player_with_largest = names[shoe_sizes.index(largest)]

  game_hash.each do |team, random|
    game_hash[team][:players].each do |name, stats|
     if player_with_largest == name
       return stats[:rebounds]
  # once we've found the player with the largest shoe size
  # we've returned that player's number of rebounds by first accessing their stats and then going into the value of rebounds

      end
    end
  end
end

big_shoe_rebounds
