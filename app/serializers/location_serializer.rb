class LocationSerializer < ActiveModel::Serializer
  attributes :name, :children

  def children
    object.children.order(:id)
  end
end