# == Schema Information
#
# Table name: tool_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tool::CategorySerializer < ActiveModel::Serializer
  attributes :name

  has_many :items
end
