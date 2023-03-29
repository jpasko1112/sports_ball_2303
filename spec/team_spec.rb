require './lib/player'
require './lib/team'

RSpec.describe Team do
  it 'exists' do
    team = ("Dodgers", "Los Angeles")

    expect(team).to be_a Team
  end
end