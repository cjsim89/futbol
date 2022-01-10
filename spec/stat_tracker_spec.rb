require './lib/stat_tracker'

RSpec.describe StatTracker do
  before :each do
    game_path = './data/test_games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }

    @stat_tracker = StatTracker.from_csv(locations)

  end

  it "exists" do
    expect(@stat_tracker).to be_instance_of(StatTracker)
  end

  describe GameStatistics do
    it "can get highest total score" do
      expect(@stat_tracker.highest_total_score).to eq(5)
    end
    it "can get lowest total score" do
      expect(@stat_tracker.lowest_total_score).to eq(1)
    end
    it "can get percentage_home_wins" do
      expect(@stat_tracker.percentage_home_wins).to eq(0.65)
    end
    it "can get percentage_visitor_wins" do
      expect(@stat_tracker.percentage_visitor_wins).to eq(0.29)
    end
    it "can get percentage ties" do
      expect(@stat_tracker.percentage_ties).to eq(0.06)
    end
    it "can get count of games by season" do
      expected = {"20122013" => 16, "20122014" => 1}
      expect(@stat_tracker.count_of_games_by_season).to be_instance_of(Hash)
      expect(@stat_tracker.count_of_games_by_season).to eq(expected)

    end
    it "can get average_goals_per_game" do
      expect(@stat_tracker.average_goals_per_game).to eq(3.47)
    end
    it "can get average_goals_by_season" do
      expected = {"20122013" => 3.56, "20122014" => 2.0}
      @stat_tracker.average_goals_by_season
      expect(@stat_tracker.average_goals_by_season).to be_instance_of(Hash)
      expect(@stat_tracker.average_goals_by_season).to eq(expected)
    end



  end


end
