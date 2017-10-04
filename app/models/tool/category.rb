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

class Tool::Category < ApplicationRecord
  self.inheritance_column = nil

  has_many :items, class_name: 'Tool::Item', foreign_key: 'tool_category_id'

  validates :name, :type, presence: true
end
