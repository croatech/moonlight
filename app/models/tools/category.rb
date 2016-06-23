class Tools::Category < ActiveRecord::Base

  validates :name, :slug, presence: true
end
