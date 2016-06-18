class Fights::StartService

  attr_reader :player_id, :enemy_id, :enemy_type, :fight

  def initialize(player_id, enemy_id, enemy_type)
    @player_id = player_id
    @enemy_id = enemy_id
    @enemy_type = enemy_type
  end

  def call
    fight_initialize
    fight.save
    first_round_create
  end

  private

  def fight_initialize
    if enemy_type == 'bot'
      @fight = Fight::VsBot.new(player_id: player_id, enemy_id: enemy_id)
    elsif enemy_type == 'player'
      @fight = Fight::VsPlayer.new(player_id: player_id, enemy_id: enemy_id)
    else
      false
    end
  end

  def first_round_create
    fight.rounds.create
  end
end