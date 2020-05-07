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

def player_array 
  all_players = [];
  game_hash.each_pair { |h_or_a, info|
    info[:players].map { |player|
      player[:location] = h_or_a.to_s;
      player[:team_name] = game_hash[h_or_a][:team_name];
      player[:team_colors] = game_hash[h_or_a][:colors];
      all_players << player;
    }
  }
  all_players;
end

def num_points_scored (player_name)
  player_array.map { |player|
    if player[:player_name] === player_name
      return player[:points];
    end
  }
end
=begin
def num_points_scored (player_name)
  not_found = "Sorry, could not find #{player_name}. Please try again."
  game_hash.each_key { |location| 
    game_hash[location][:players].map { |player|
      if player[:player_name] == player_name 
        return player[:points];
      end
    }
  }
  not_found; 
end
=end 

def shoe_size (player_name)
  player_array.map { |player|
    if player[:player_name] === player_name
      return player[:shoe];
    end 
  }
end
=begin
def shoe_size (player_name)
  game_hash.each_key { |location| 
    game_hash[location][:players].map { |player|
      if player[:player_name] == player_name
        return player[:shoe];
      end
    }
  }
  #a not found entry. 
end
=end

def team_colors (team_name)
  game_hash.each_pair { |location, team_info|
    if team_info[:team_name] === team_name
      return team_info[:colors];
    end
  }
end
=begin
def team_colors (team_name)
  game_hash.each_key { |location|
    if game_hash[location][:team_name] == team_name
      return game_hash[location][:colors];
    end
  }
end
=end

=begin
def team_names
  trial = [];
  game_hash.each_value.select{ |key, value|
    binding.pry; 
  }
end
puts team_names;
=end
def team_names
  all_teams = [];
  game_hash.map { |key, value|
    value.map { |key, value| 
      if key === :team_name then all_teams << value end 
    }
  }
  all_teams;
end
=begin
def team_names
  all_teams = [];
  game_hash.each_key { |location|
    all_teams << game_hash[location][:team_name];
  }
  all_teams;
end
=end

def player_numbers (team_name)
  all_jersies = [];
  game_hash.each_key { |location|
    if game_hash[location][:team_name] == team_name
      game_hash[location][:players].length.times { |player_index|
        all_jersies << game_hash[location][:players][player_index][:number];
      }
    end
  }
  all_jersies; 
end

def player_stats (player_name)
  game_hash.each_key { |location| 
    game_hash[location][:players].map { |player|
      if player[:player_name] == player_name 
        return player; 
      end
    }
  }
end

def big_shoe_rebounds
  big_shoe = 0;
  rebounds = 0; 
  game_hash.each_key { |location|
    game_hash[location][:players].map { |player|
      if big_shoe == 0
        big_shoe = player[:shoe];
        rebounds = player[:rebounds];
      elsif big_shoe < player[:shoe]
        big_shoe = player[:shoe];
        rebounds = player[:rebounds];
      end
    }
  }
  rebounds; 
end

#1. Which player has the most points? Call the method `most_points_scored`.

#2. Which team has the most points? Call the method `winning_team`.

#3. Which player has the longest name? Call the method `player_with_longest_name`.

#**Super Bonus:**

#1. Write a method that returns true if the player with the longest name had the
#   most steals. Call the method `long_name_steals_a_ton?`.

def most_points_scored
  points = 0;
  player_name = ""; 
  game_hash.each_key { |location|
    game_hash[location][:players].map { |player|
      if points == 0
        points = player[:points];
        player_name = player[:player_name];
      elsif points < player[:points]
        points = player[:points];
        player_name = player[:player_name];
      end
    }
  }
  player_name; 
end #=> "Ben Gordon"

def winning_team
  points_home = 0;
  points_away = 0; 
  game_hash.each_key { |location|
    game_hash[location][:players].map { |player|
      if location == :home
        points_home = points_home + player[:points];
      elsif location == :away
        points_away = points_away + player[:points];
      end
    }
  }
  case
    when points_home > points_away
      return game_hash[:home][:team_name];
    when points_away > points_home
      return game_hash[:away][:team_name];
    when points_home == points_away
      "It's a tie!"
  end
end #=> "Brooklyn Nets"

def player_with_longest_name
  name_length = 0;
  player_name = ""; 
  game_hash.each_key { |location|
    game_hash[location][:players].map { |player|
      if name_length == 0
        name_length = player[:player_name].length;
        player_name = player[:player_name];
      elsif name_length < player[:player_name].length
        name_length = player[:player_name].length;
        player_name = player[:player_name];
      end
    }
  }
  player_name; 
end #=> "Bismack Biyombo"

def long_name_steals_a_ton 
  name_length = 0;
  steals = 0; 
  most_steals = 0;
  player_name_long = ""; 
  player_name_steals = "";
  game_hash.each_key { |location|
    game_hash[location][:players].map { |player|
      if name_length == 0
        name_length = player[:player_name].length;
        player_name_long = player[:player_name];
        steals = player[:steals];
      elsif name_length < player[:player_name].length
        name_length = player[:player_name].length;
        player_name_long = player[:player_name];
        steals = player[:steals];
      end
    }
  }
  game_hash.each_key { |location|
    game_hash[location][:players].map { |player|
      if most_steals == 0
        most_steals = player[:steals];
        player_name_steals = player[:player_name];
      elsif most_steals < player[:steals]
        most_steals = player[:steals];
        player_name_steals = player[:player_name];
      end
    }
  }
  player_name_long == player_name_steals ? true : false;   
end #=> true

