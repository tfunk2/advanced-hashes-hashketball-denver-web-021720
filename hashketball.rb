require 'pry'
require 'pp'
def game_hash
  
  our_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },
        {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        },
        {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },
        {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },
        {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }],
    },    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },
        {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
        },
        {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },
        {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },
        {
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }]
    }
  }
end

# # -This is the passing method I originally created with a while loop-

# def num_points_scored (name)
#   i = 0
#   away_players_list = game_hash[:away][:players]
#   home_players_list = game_hash[:home][:players]
  
#   while i < (away_players_list.length)
    
#     if name == away_players_list[i][:player_name]
#       return away_players_list[i][:points]
#     elsif name == home_players_list[i][:player_name]
#       return home_players_list[i][:points]
#     end
#     i += 1
#   end
# end


def num_points_scored (player_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            return player[:points]
          end
        end
      end
    end
  end
end


def shoe_size (player_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            return player[:shoe]
          end
        end
      end
    end
  end
end


def team_colors (team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end


def team_names
  game_hash.map do |place, team|
     team[:team_name]
  end
end


def player_numbers(team_name)
  new_array = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            new_array << player[:number]
          end
        end
      end
    end
  end
  new_array
end


def player_stats(player_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            return player.reject {|stat| stat == :player_name }
          end
        end
      end
    end
  end
end


def name_to_stats_pairs
# {"name" => :shoe, ... "name" => :shoe}
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          new_hash["#{player[:player_name]}"] = player
        end
      end
    end
  end
 new_hash 
end


def name_to_shoe_pairs
# {"name" => :shoe, ... "name" => :shoe}
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          new_hash["#{player[:player_name]}"] = shoe_size(player[:player_name])
        end
      end
    end
  end
 new_hash 
end


def big_shoe_rebounds
  name_for_biggest_shoe = name_to_shoe_pairs.key(name_to_shoe_pairs.values.max)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == name_for_biggest_shoe
            return player[:rebounds]
          end
        end
      end
    end
  end
end

def most_points_scored
  name_to_points_pair.key(name_to_points_pair.values.max)
end

def name_to_points_pair
# {"name" => :shoe, ... "name" => :shoe}
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          new_hash["#{player[:player_name]}"] = num_points_scored(player[:player_name])
        end
      end
    end
  end
 new_hash 
end



def winning_team

  top_team = {}
  game_hash.values.each do |team_info|
    team_points = 0
    team_info[:players].each do |player|
      team_points += player[:points]
    end
    top_team[team_info[:team_name]] = team_points
  end
  top_team.key(top_team.values.max) 
end



def player_with_longest_name
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          new_hash[player[:player_name]] = player[:player_name].length
        end
      end
    end
  end
  new_hash.key(new_hash.values.max)
end


def name_to_steals_pairs
# {"name" => :shoe, ... "name" => :shoe}
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          new_hash["#{player[:player_name]}"] = player[:steals]
        end
      end
    end
  end
 new_hash 
end


def long_name_steals_a_ton?
  if name_to_steals_pairs.key(name_to_steals_pairs.values.max) == player_with_longest_name
    return true
  end
end
















