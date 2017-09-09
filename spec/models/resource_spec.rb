# == Schema Information
#
# Table name: resources
#
#  id                 :integer          not null, primary key
#  name               :string
#  item_id            :integer
#  price              :integer
#  type               :string
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'spec_helper'

describe Resource, type: :model do
  it { is_expected.to belong_to(:item) }
  it { is_expected.to have_many(:location_resources) }
  it { is_expected.to have_many(:locations) }
  it { is_expected.to have_and_belong_to_many(:players) }
end
