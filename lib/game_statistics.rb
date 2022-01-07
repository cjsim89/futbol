require 'csv'
require_relative 'game'
class GameStatistics
  attr_reader :games
  def initialize(file)
    @games = []
    CSV.foreach( file, { headers: true, header_converters: :symbol}) do |row|
      @games << Game.new(row)
    end
  end

  def add_all_scores
    all_scores = []
    @games.each do |game|
      all_scores << game.away_goals.to_i + game.home_goals.to_i
    end
    all_scores
  end

  def highest_total_score
    add_all_scores.max
  end

  def lowest_total_score
    add_all_scores.min
  end

  def percentage_home_wins
    counter = 0
    @games.each do |game|
      if (game.home_goals > game.away_goals)
        counter +=1
      end
    end
    return (counter.to_f / @games.length.to_f).round(2)
  end

  def percentage_visitor_wins
    counter = 0
    @games.each do |game|
      if (game.away_goals > game.home_goals)
        counter +=1
      end
    end
    return (counter.to_f / @games.length.to_f).round(2)
  end

end
