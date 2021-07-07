# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: ["Brooklyn Nets"],
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
      team_name: ["Charlotte Hornets"],
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

def get_player_helper(player_name)
  game_hash.each do |home_away, team|
    team[:players].each do |each_player|
      if each_player[:player_name] == player_name
        return each_player
      end
    end
  end
end

def roster_help(team_name)
  team_roster = {}
  if game_hash[:home][:team_name][0] == team_name
    team_roster = game_hash[:home][:players]
  elsif game_hash[:away][:team_name][0] == team_name
    team_roster = game_hash[:away][:players]
  end
  team_roster
end

def num_points_scored(player_name)
  player_stats = get_player_helper(player_name)
  points_scored = ''
  player_stats.each do |stats_title, stats|
    if stats_title == :points
      points_scored = stats
    end
  end
  points_scored
end

def shoe_size(player_name)
  player_stats = get_player_helper(player_name)
  player_shoe = ''
  player_stats.each do |stats_title, stats|
    if stats_title == :shoe
      player_shoe = stats
    end
  end
  player_shoe
end


def team_colors(team_name)
  if game_hash[:home][:team_name][0] == team_name
    team_color = game_hash[:home][:colors]
  elsif game_hash[:away][:team_name][0] == team_name
    team_color = game_hash[:away][:colors]
  end
  team_color
end

def team_names
  team_names = []
  game_hash.each do |home_away, team_stats|
     team_names << team_stats[:team_name][0]
  end
  team_names
end

def player_numbers(team_name)
  player_numbers = []
  roster = roster_help(team_name)
  roster.each do |players|
    players.each do |category, stats|
      if category == :number
        player_numbers.push(stats)
      end
    end
  end
  player_numbers
end



def player_stats(player_name)
  stats_by_name = {}
  full_player = get_player_helper(player_name)
   full_player.each do |category, stats|
     puts category

     #if category != :player_name
    stats_by_name[category] = stats
     #end

     end
   stats_by_name
end

puts player_stats('Alan Anderson')

def big_shoe_rebounds
  largest = 0
  rebounds = 0
  game_hash.each do |home_away, team|
    team[:players].each do |each_player|
      #puts each_player[:shoe]
      if each_player[:shoe] > largest
        largest = each_player[:shoe]
      end
      if each_player[:shoe] == largest
         rebounds = each_player[:rebounds]
      end
    end
  end
  rebounds
end
