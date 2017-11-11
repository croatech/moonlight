# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  cell       :boolean          default(FALSE)
#  inactive   :boolean          default(FALSE)
#

class LocationSerializer < ActiveModel::Serializer
  attributes :name, :children

  def children
    object.children.order(:id)
  end
end
