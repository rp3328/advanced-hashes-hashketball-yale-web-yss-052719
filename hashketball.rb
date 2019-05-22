# Write your code here!
require "pry"

def game_hash
  {
    :home  => {:team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1},
        }
      },
    :away => {:team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        "Bismack Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
        }
      }
  }
end

def home_team_name
  game_hash[:home][:team_name]
end

def num_points_scored(name)
  game_hash.each do |team, data|
    data[:players].each do |pname,  pdata|
      if pname == name
        return pdata[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, data|
    data[:players].each do |pname,  pdata|
      if pname == name
        return pdata[:shoe]
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |team, data|
    if data[:team_name] == name
      return data[:colors]
    end
  end
end

def team_names
  game_hash.collect do |team, data|
     data[:team_name]
  end
end

def player_numbers(name)
  arr = []

  game_hash.each do |team, data|
    if data[:team_name] == name
      data[:players].each {
        |pname, val| arr << val[:number]
      }
    end
  end
  arr
end

def player_stats(name)
  game_hash.each do |team, data|
    data[:players].each do |pname, val|
      if pname == name
        return val
      end
    end
  end

end

def big_shoe_rebounds
  shoe = 0
  rebounds = 0

  game_hash.each do |team, data|
    data[:players].each do |pname, val|
      if val[:shoe] > shoe
        rebounds = val[:rebounds]
        shoe = val[:shoe]
      end
    end
  end
  rebounds
end

def most_points_scored
  points = 0
  bplayer = ""

  game_hash.each do |team, data|
    data[:players].each do |pname, val|
      if val[:points] > points
        points = val[:points]
        bplayer = pname
      end
    end
  end
  bplayer
end

def winning_team
  home = 0
  away = 0

  game_hash[:home][:players].each do |pname, val|
    home += val[:points]
  end

  game_hash[:away][:players].each do |pname, val|
    away += val[:points]
  end

  if home > away
    game_hash[:home][:team_name]
  elsif away > home
    game_hash[:away][:team_name]
  else
    "tie"
  end
end

def player_with_longest_name
  long = 0
  name = nil

  game_hash.each do |team, data|
    data[:players].each do |pname, val|
      if pname.length > long
        name = pname
        long = pname.length
      end
    end
  end
  name
end

def long_name_steals_a_ton
  steals = 0
  playername = nil

  game_hash.each do |team, data|
    data[:players].each do |pname, val|
      if val[:steals] > steals
        steals = val[:steals]
        playername = pname
      end
    end
  end
  playername
end
