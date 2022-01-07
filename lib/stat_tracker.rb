require 'pry'
require_relative 'game_statistics'
class StatTracker
  attr_reader :game_statistics

  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  def initialize(file)
    @game_statistics = GameStatistics.new(file[:games])
  end

  def highest_total_score
    @game_statistics.highest_total_score
  end

  def lowest_total_score
    @game_statistics.lowest_total_score
  end

  def percentage_home_wins
    @game_statistics.percentage_home_wins
  end

  def percentage_visitor_wins
    @game_statistics.percentage_visitor_wins
  end

end
