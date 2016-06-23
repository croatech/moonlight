class Tool::Category < ActiveRecord::Base

  has_many :items, class_name: 'Tool::Item', foreign_key: 'category_id'
  
  validates :name, :slug, presence: true
end
