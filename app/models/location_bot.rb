# == Schema Information
#
# Table name: location_bots
#
#  id          :integer          not null, primary key
#  location_id :integer
#  bot_id      :integer
#

class LocationBot < ApplicationRecord

  validates :location_id, uniqueness: { scope: :bot_id }

  belongs_to :location
  belongs_to :bot
end
