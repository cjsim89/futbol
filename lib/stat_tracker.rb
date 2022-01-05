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


end
