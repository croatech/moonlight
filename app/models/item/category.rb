class Item::Category < ActiveRecord::Base

  has_many :items, class_name: 'Item::Item', foreign_key: 'category_id'

  validates :name, presence: true
end
