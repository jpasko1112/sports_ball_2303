class Team
  attr_reader :name, :city, :roster, :player_count
  
  def initialize(name, city)
    @name = name
    @city = city
    @roster = []
    @player_count = 0
  end

  def add_player(player)
    @roster << player
    @player_count += 1
  end

  def long_term_players
    @roster.select do |player|
      player.contract_length >24
    end
  end

  def short_term_players
    @roster.select do |player|
      player.contract_length <= 24
    end
  end

  def total_value
    @roster.sum do |player|
      player.total_cost
    end
  end

  def details
    {"total_value" => total_value, "player_count"=> @player_count}
  end
end

