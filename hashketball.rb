require 'pry'

#game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end


#num_points_scored  
def num_points_scored(player_name)
  points_scored = 0
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = (away_players + home_players)
  all_players.each do |element|
    element.each do |key, value|
      if element[key] == player_name
        points_scored = element[:points]
        return points_scored
      end
    end
  end
end 


#shoe_size
def shoe_size(player_name)
  shoe_size = 0
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = (away_players + home_players)
  all_players.each do |element|
    element.each do |key, value|
      if element[key] == player_name
        shoe_size = element[:shoe]
        return shoe_size
      end
    end
  end
end 


#team_colors
def team_colors(tc_team_name)
  result_team_colors = Array.new
  game_hash.each do |key, value|
    value.each do |key2, value2|
      if value2 == tc_team_name
        result_team_colors = game_hash[key][:colors]
        return result_team_colors
      end
    end
  end
end


#team_names
def team_names()
  team_array = []
  game_hash.each do |key, value|
    value.each do |key2, value2|
      if key2 == :team_name
        team_array.push(game_hash[key][key2])
      end 
    end 
  end 
  return team_array
end


#player_numbers
def player_numbers(tm_name)
  jersey_array = []
  if game_hash[:home][:team_name] == tm_name
    game_hash[:home][:players].each do |element|
      element.each do |key3, value3|
        if key3 == :number
          jersey_array.push(value3)
        else
        end
      end
    end
  else
    game_hash[:away][:team_name] == tm_name
    game_hash[:away][:players].each do |element|
      element.each do |key3, value3|
        if key3 == :number
          jersey_array.push(value3)
        else
        end
      end
    end
  end
  jersey_array
end
  

#player_stats
def player_stats(player_name)
  player_statistics = {}
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = (away_players + home_players)
  all_players.each do |element|
    element.each do |key, value|
      if element[key] == player_name
        player_statistics = element
      return player_statistics
      end
    end
  end
end


#big_shoe_rebounds
def big_shoe_rebounds
  largest_shoe = 0
  result = {}
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = (away_players + home_players)
  all_players.each do |element|
    element.each do |key, value|
      if key == :shoe
        if value > largest_shoe
          largest_shoe = value
          result = element
        else
        end
      else
      end
    end
  end
  return result[:rebounds]
end
