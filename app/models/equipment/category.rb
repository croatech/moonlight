# == Schema Information
#
# Table name: equipment_categories
#
#  id   :integer          not null, primary key
#  name :string
#  type :string
#

class Equipment::Category < ApplicationRecord
  self.inheritance_column = nil

  has_many :items, class_name: 'Equipment::Item', foreign_key: 'equipment_category_id'

  validates :name, :type, presence: true
end
