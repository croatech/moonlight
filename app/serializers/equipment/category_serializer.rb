# == Schema Information
#
# Table name: equipment_categories
#
#  id   :integer          not null, primary key
#  name :string
#  slug :string
#

class Equipment::CategorySerializer < ActiveModel::Serializer
  attributes :name

  has_many :items
end
