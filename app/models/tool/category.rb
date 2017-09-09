# == Schema Information
#
# Table name: tool_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tool::Category < ApplicationRecord

  has_many :items, class_name: 'Tool::Item', foreign_key: 'category_id'
  
  validates :name, :slug, presence: true
end
