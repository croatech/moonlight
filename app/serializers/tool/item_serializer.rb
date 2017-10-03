# == Schema Information
#
# Table name: tool_items
#
#  id                 :integer          not null, primary key
#  name               :string
#  price              :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  required_skill     :integer
#  type               :string
#  tool_category_id   :integer
#

class Tool::ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :required_skill, :price
end
