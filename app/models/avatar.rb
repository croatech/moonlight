# == Schema Information
#
# Table name: avatars
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  private    :boolean          default(TRUE)
#  image      :string
#

class Avatar < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :players

  scope :not_private, -> { where(private: false) }
end
