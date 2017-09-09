# == Schema Information
#
# Table name: equipment_categories
#
#  id   :integer          not null, primary key
#  name :string
#  slug :string
#

class Equipment::Category < ApplicationRecord

  has_many :items, class_name: 'Equipment::Item', foreign_key: 'category_id'

  validates :name, presence: true

  ARTIFACT_CATEGORIES = %w(Sapphire
                           Berserker
                           Mad Knight
                           Barbed
                           Moon
                           Winged God
                           Amber Phoenix
                           Amethyst
                           Demon Warrior
                           Lone Druid
                           Ancient Serpent
                           Crystal
                           Ruby)
end
