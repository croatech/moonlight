class Profile::Inventory::AllEquipmentService

  attr_reader :profile

  def initialize(profile)
    @profile = profile
  end

  def call
    item_ids = []
    
    slots.each do |slot_name|
      if @profile[slot_name].present?
        item_ids << @profile[slot_name]
      end
    end

    item_ids
  end

  private

  def slots
    Profile.const_get("SLOTS")
  end
end