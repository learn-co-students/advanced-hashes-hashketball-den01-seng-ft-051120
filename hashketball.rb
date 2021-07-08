# Write your code here!def game_hash
# require 'pry'

def game_hash()
    game_stat =  {
    away: { team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: [
        { player_name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2 },
        { player_name: 'Bismack Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
        { player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
        { player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
        { player_name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
      players: [
        { player_name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 },
        { player_name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 },
        { player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
        { player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 },
        { player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 }
      ] }
  }
  return game_stat

end



def num_points_scored(player_name_want)

  game_info = game_hash
  game_info.each do |location_played, team_info|
    team_info[:players].each do|player_infos|
      if player_infos[:player_name] == player_name_want
        return player_infos[:points]
      end
    end

  end

end

def shoe_size(player_name_want)

  game_info = game_hash
  game_info.each do |location_played, team_info|
    team_info[:players].each do|player_infos|
      if player_infos[:player_name] == player_name_want
        return player_infos[:shoe]
      end
    end

  end

end
def team_colors(team_colors_wanted)

  game_info = game_hash
  game_info.each do |location_played, team_info|
    if team_info[:team_name] == team_colors_wanted
      return team_info[:colors]
    end


  end

end
def team_names
  game_info = game_hash
  team_stack = []
  game_info.map do |team, team_name_wanted|
    team_stack.push( team_name_wanted[:team_name])
  end
  return team_stack
end

def player_numbers(team_name_wanted)
  game_info = game_hash
  player_number_stack = []
  game_info.map do |team, team_name_looking|
    if team_name_looking[:team_name] == team_name_wanted
      team_name_looking.each do |p_name, p_numbers|
          if p_name == :players
              p_numbers.each do |team_players|

                player_number_stack.push(team_players[:number])
            end
        end

      end
    end


  end
  return player_number_stack
end

def player_stats(player_stat_want)
  game_info = game_hash
  game_info.each do |location_played, team_on|
      team_on.each do|p_name, p_stat|
            if p_name == :players
                p_stat.each do |p_info|
                    if player_stat_want == p_info[:player_name]

                        return p_info
                    end
                end
            end
        end

  end
end

def big_shoe_rebounds
  largest_siz = 0
  rebound = 0
  game_info = game_hash
  game_info.each do |location_played, teams_info|
    teams_info[:players].each do |player_on_deck|
      if player_on_deck[:shoe] > largest_siz
        largest_siz = player_on_deck[:shoe]
        rebound = player_on_deck[:rebounds]
      end
    end
  end
  return rebound
end


# binding.pry
