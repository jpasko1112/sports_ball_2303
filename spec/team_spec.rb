require './lib/player'
require './lib/team'

RSpec.describe Team do
  before(:each) do
    @team = Team.new("Dodgers", "Los Angeles")
    @player_1 = Player.new("Michael Palledorous" , 1000000, 36)
    @player_2 = Player.new("Kenny DeNunez", 500000, 24)
    @player_3 = Player.new("Alan McClennan", 750000, 48)
    @player_4 = Player.new("Hamilton Porter", 100000, 12)
  end

  it 'exists' do
    expect(@team).to be_a Team
  end

  it "has a roster" do
    expect(@team.roster).to eq([])
  end

  it "has a player count" do
    expect(@team.player_count).to eq(0)
  end

  it "adds a player to the roster" do
    @team.add_player(@player_1)
    @team.add_player(@player_2)
    
    expect(@team.roster).to eq([@player_1, @player_2])
    expect(@team.player_count).to eq(2)
  end

  it "has long term players" do
    @team.add_player(@player_1)
    @team.add_player(@player_2)
    @team.add_player(@player_3)
    @team.add_player(@player_4)

    expect(@team.long_term_players).to eq([@player_1, @player_3])
  end

  it "has short term players" do
    @team.add_player(@player_1)
    @team.add_player(@player_2)
    @team.add_player(@player_3)
    @team.add_player(@player_4)

    expect(@team.short_term_players).to eq([@player_2, @player_4])
  end

  it "has a total value" do
    @team.add_player(@player_1)
    @team.add_player(@player_2)
    @team.add_player(@player_3)
    @team.add_player(@player_4)

    expect(@team.total_value).to eq(85200000)
  end

  it "has details" do
    @team.add_player(@player_1)
    @team.add_player(@player_2)
    @team.add_player(@player_3)
    @team.add_player(@player_4)

    expected = {"total_value" => 85200000, "player_count" => 4}
    expect(@team.details).to eq(expected)
  end
end