class Stuff::PutOnService
  include Interactor

  def call
    pre_initialize

    if player_has_an_item? && level_or_skill_available?
      ActiveRecord::Base.transaction do
        remove_item_from_the_inventory
        put_the_current_item_to_the_inventory if slot_is_busy?
        put_the_item_in_the_slot
        update_stats
      end

      start_restore_hp
    else
      context.fail!
    end
  end

  private

  attr_reader :player, :item, :current_item

  def pre_initialize
    @player = context.player
    @item = context.item
    @current_item = item.class.find(player[item.slot_name])
  end

  def player_has_an_item?
    player.has_an_item?(item)
  end

  def level_or_skill_available?
    item.available_for_player?(player)
  end

  def slot_is_busy?
    current_item.present?
  end

  def remove_item_from_the_inventory
    player.stuff_item(item).delete
  end

  def put_the_current_item_to_the_inventory
    player.stuffs.create(stuffable: current_item)
  end

  def put_the_item_in_the_slot
    player[item.slot_name] = item.id.to_i
    player.save
  end

  def update_stats
    return unless item.is_a?(Equipment::Item)
    Equipment::Items::RecalculateStatsService.new(player, current_item).decrease
    Equipment::Items::RecalculateStatsService.new(player, item).increase
  end

  def start_restore_hp
    Player::RestoreHpService.new(player).call
  end
end
