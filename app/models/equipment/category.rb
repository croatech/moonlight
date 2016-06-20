class Equipment::Category < ActiveRecord::Base

  has_many :items, class_name: 'Equipment::Item', foreign_key: 'category_id'

  validates :name, presence: true
end
