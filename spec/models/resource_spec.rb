# == Schema Information
#
# Table name: resources
#
#  id      :integer          not null, primary key
#  name    :string
#  item_id :integer
#  price   :integer
#  type    :string
#  image   :string
#

require 'spec_helper'

describe Resource, type: :model do
  it { is_expected.to belong_to(:item) }
  it { is_expected.to have_many(:location_resources) }
  it { is_expected.to have_many(:locations) }
end
