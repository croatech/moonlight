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

class AvatarSerializer < ActiveModel::Serializer
  attributes :url

  def url
    "#{Settings.host}#{object.url}"
  end
end
