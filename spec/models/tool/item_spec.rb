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
#  tool_category_id   :integer
#

require 'spec_helper'

describe Tool::Item, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:tool_category_id) }
  it { is_expected.to validate_presence_of(:required_skill) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to have_one(:resource) }
end
