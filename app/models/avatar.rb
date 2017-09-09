# == Schema Information
#
# Table name: avatars
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  private            :boolean          default(TRUE)
#

class Avatar < ApplicationRecord
  has_attached_file :image, default_url: "/images/players/avatars/1.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :players

  scope :not_private, -> { where(private: false) }
end
