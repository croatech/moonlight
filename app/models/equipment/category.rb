# == Schema Information
#
# Table name: equipment_categories
#
#  id   :integer          not null, primary key
#  name :string
#  slug :string
#

class Equipment::Category < ApplicationRecord

  has_many :items, class_name: 'Equipment::Item', foreign_key: 'equipment_category_id'

  validates :name, presence: true
end
