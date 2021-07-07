# Write your code below game_hash

require "pry";

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

# Write code here

#DRY Attempt - Returns hash of player given a name, so that other methods can return specific player info
def lookup_by_player (player_name) 
  game_hash.each_pair { |h_or_a, team_info|
    team_info[:players].map { |player|
      if player[:player_name] === player_name
#        player[:location] = h_or_a;
 #       player[:team_name] = game_hash[h_or_a][:team_name];
  #      player[:team_colors] = game_hash[h_or_a][:colors];
        return player;
      end
    }
  }
  #Could add error message here if player could not be found. N/A for lab. 
end

#DRY Attempt - Returns hash of team info when looking for a specific team
def lookup_by_team (team_name)
  game_hash.map { |home_or_away, team_info|
   if team_name === team_info[:team_name] 
     team_info[:location] = home_or_away;
     return team_info;
   end
  }
end

#DRY Attempt - Returns a AoH of all players 
def player_collection 
  all_players = [];
  game_hash.each_pair { |h_or_a, team_info|
    team_info[:players].map { |player|
      player[:location] = h_or_a;
      player[:team_name] = game_hash[h_or_a][:team_name];
      player[:team_colors] = game_hash[h_or_a][:colors];
      all_players << player;
    }
  }
  all_players;  
end

#Returns the points scored by player
def num_points_scored (player_name)
  lookup_by_player(player_name)[:points]; 
end

#Returns the shoe size of player
def shoe_size (player_name)
  lookup_by_player(player_name)[:shoe]; 
end

#Returns the colors of team 
def team_colors (team_name)
  lookup_by_team(team_name)[:colors];
end

#Returns both team names. 
#Not dynamic, but does it need to be? Teams are always home and away, could be adapted into another method for tournaments
def team_names
  [
    game_hash.dig(:home, :team_name),
    game_hash.dig(:away, :team_name)
  ]
end

#Returns array of jersey numbers for team
def player_numbers (team_name)
  all_jersies = [];
  lookup_by_team(team_name)[:players].map { |player|
    all_jersies << player[:number];
  }
  all_jersies; 
end

#Returns a players stats. Basically is my lookup_by_player method. 
def player_stats (player_name)
  lookup_by_player(player_name);
end

#Returns the rebounds of player with the biggest shoe
def big_shoe_rebounds
  big_shoe_player = player_collection.reduce { |memo, next_player|
    memo[:shoe] > next_player[:shoe] ? memo : next_player; 
  }
  big_shoe_player[:rebounds];
end

#3. Which player has the longest name? Call the method `player_with_longest_name`.

#**Super Bonus:**

#1. Write a method that returns true if the player with the longest name had the
#   most steals. Call the method `long_name_steals_a_ton?`.

#Returns player with the most points scored 
def most_points_scored
  big_score_player = player_collection.reduce { |memo, next_player|
    memo[:points] > next_player[:points] ? memo : next_player; 
  }
  big_score_player[:player_name];
end #=> "Ben Gordon"

#Returns team name which scored the most cumulative points 
def winning_team
  final_scores = player_collection.reduce(home: 0, away: 0) { |teams_points, next_player|
    case 
      when next_player[:location] === :away
        teams_points[:away] += next_player[:points];
      when next_player[:location] === :home
        teams_points[:home] += next_player[:points];
    end
    teams_points; 
  }
  winner = final_scores.reduce { |highest_points, team_points| 
    highest_points[1] > team_points[1] ? highest_points : team_points;  
  }
  game_hash[winner[0]][:team_name]; 
end #=> "Brooklyn Nets"

puts winning_team;

#Returns name of player with the most characters 
def player_with_longest_name
  player_collection.reduce { |longest_name, next_player|
    longest_name[:player_name].length > next_player[:player_name].length ? longest_name : next_player; 
  }[:player_name]; 
  #probably easier to read to declare variable, however, good to know this works. 
end #=> "Bismack Biyombo"

puts player_with_longest_name;

#Returns true if the player with the longest name, steals a lot. 
def long_name_steals_a_ton 
  long_name_player = player_collection.reduce { |longest_name, next_player|
    longest_name[:player_name].length > next_player[:player_name].length ? longest_name : next_player; 
  }
  most_steals_player = player_collection.reduce { |most_steals, next_player|
    most_steals[:steals] > next_player[:steals] ? most_steals : next_player; 
  }
  long_name_player === most_steals_player; 
end #=> true

puts long_name_steals_a_ton;
