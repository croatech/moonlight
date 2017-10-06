# == Schema Information
#
# Table name: equipment_categories
#
#  id   :integer          not null, primary key
#  name :string
#  type :string
#

class Equipment::CategorySerializer < ActiveModel::Serializer
  attributes :name

  has_many :items, include: false
end
