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

require 'spec_helper'

describe Location, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:slug) }
  it { is_expected.to have_many(:players) }
  it { is_expected.to have_many(:location_bots) }
  it { is_expected.to have_many(:location_resources) }
  it { is_expected.to have_many(:bots) }
  it { is_expected.to have_many(:resources) }
end
