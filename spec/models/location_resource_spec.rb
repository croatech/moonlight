# == Schema Information
#
# Table name: location_resources
#
#  id          :integer          not null, primary key
#  location_id :integer
#  resource_id :integer
#

require 'spec_helper'

describe LocationResource, type: :model do
  it { is_expected.to belong_to(:location) }
  it { is_expected.to belong_to(:resource) }
end
