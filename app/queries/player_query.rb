module PlayerQuery
  def self.call(id)
    Player.includes(equipment_items: :category)
      .includes(tool_items: :category)
      .includes(:resources)
      .find(id)
  end
end