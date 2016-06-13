class Location < ActiveRecord::Base

  has_many :users
  
  validates :name, :slug, presence: true

  acts_as_tree order: 'name'
end
