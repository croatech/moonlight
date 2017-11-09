class Locations::CheckForShopLocationService
  include Interactor

  def call
    pre_initialize

    context.fail!(error: "You can sell this item in the #{shop_names.join(', ')}") if !shop_names.include?(player.location.name)
  end

  private

  def pre_initialize
    @player = context.player
  end

  def shop_names
    Location.where("name LIKE ?", "%Shop%").pluck(:name)
  end

  attr_reader :player
end
