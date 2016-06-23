class Tool::Item < ActiveRecord::Base

  belongs_to :category, class_name: 'Tool::Category', foreign_key: 'category_id'

  validates :name, :category_id, :cost, presence: true
end
