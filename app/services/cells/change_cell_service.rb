class Cells::ChangeCellService
  include Interactor

  def call
    pre_initialize

    context.fail!(error: 'You\'re already wakling') if active_movement_in_progress?
    context.fail!(error: 'You\'re already here') if current_location_chosen?
    context.fail!(error: 'You can\'t go to uncharted lands') if inactive_location?

    Movements::CreateService.new(player, location).call
  end

  private

  attr_reader :player, :location

  def pre_initialize
    @player = context.player
    @location = context.location
  end

  def active_movement_in_progress?
    player.active_movement.present?
  end

  def current_location_chosen?
    player.location_id == location.id
  end

  def inactive_location?
    location.inactive?
  end
end
