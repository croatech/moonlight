class Equipment::Items::PutOnService
  include Interactor

  def call
    pre_initialize

    if player_has_an_item? && level_required?
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

  attr_reader :player, :equipment, :item, :current_item, :slot

  def pre_initialize
    @player = context.player
    @equipment = player.equipment
    @item = context.item
    @slot = "#{item.category.slug}_slot"
    @current_item = Equipment::Item.find(player[slot])
  end

  def player_has_an_item?
    player.has_an_item?(item)
  end

  def level_required?
    player.level >= item.required_level
  end

  def slot_is_busy?
    current_item.present?
  end

  def remove_item_from_the_inventory
    player.stuff_item(item).delete
  end

  def put_the_current_item_to_the_inventory
    player.equipment_items << current_item
  end

  def put_the_item_in_the_slot
    player[slot] = item.id.to_i
    player.save
  end

  def update_stats
    Equipment::Items::RecalculateStatsService.increase(player, item)
  end

  def start_restore_hp
    Player::RestoreHpService.new(player).call
  end
end
