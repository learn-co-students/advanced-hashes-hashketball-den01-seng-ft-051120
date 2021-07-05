require "pry"

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

def guys_hash(name)
  guys_hash = game_hash[:home][:players].select { |guy|
    guy[:player_name] == name 
  }
  if guys_hash == []
    guys_hash = game_hash[:away][:players].select { |guy|
      guy[:player_name] == name
    }
  end 
  guys_hash
end 

def num_points_scored(name)
  guys_hash(name)[0][:points]
end

def shoe_size(name)
  guys_hash(name)[0][:shoe]
end 

def team_colors(team)
  if game_hash[:home][:team_name] == team
    colorss = game_hash[:home][:colors]
  else 
    colorss = game_hash[:away][:colors]
  end 
  colorss
end 

def team_names
  teams = [
    game_hash[:home][:team_name],
    game_hash[:away][:team_name]
    ]
end 

def player_numbers(team)
  numbers = []
  i = 0 
  if game_hash[:home][:team_name] == team 
    while i < 5 
      numbers << game_hash[:home][:players][i][:number]
      i += 1 
    end 
  else 
    while i < 5 
      numbers << game_hash[:away][:players][i][:number]
      i += 1 
    end 
  end 
  numbers 
end 

def player_stats(name)
  guys_hash(name)[0]
end 

def big_shoe_rebounds
  big_home = game_hash[:home][:players].reduce(0) { |memo, guy|
    if guy[:shoe] > memo
      memo = guy[:shoe]
    end 
    memo
  }
  big_away = game_hash[:away][:players].reduce(0) { |memo, guy|
    if guy[:shoe] > memo
      memo = guy[:shoe]
    end 
    memo
  }
  if big_away > big_home
    guys_hash = game_hash[:away][:players].select { |guy|
      guy[:shoe] == big_away
    }
  else 
    guys_hash = game_hash[:home][:players].select { |guy|
      guy[:shoe] == big_home 
    }
  end 
  guys_hash[0][:rebounds]
end 

def most_points_scored
  most_home = game_hash[:home][:players].reduce(0) { |guy|
    if guy[:points] > memo
      memo = guy[:points]
    end
    memo
  }
  most_away = game_hash[:away][:players].reduce(0) { |guy|
    if guy[:points] > memo
      memo = guy[:points]
    end
    memo
  }
  if most_away > most_home
     guys_hash = game_hash[:away][:players].select { |guy|
      guy[:points] == most_away
    }
  else 
    guys_hash = game_hash[:home][:players].select { |guy|
      guy[:points] == most_home 
    }
  end 
  guys_hash[0][:player_name]
end 




