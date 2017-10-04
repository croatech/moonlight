# == Schema Information
#
# Table name: tool_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Tool::Category, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to have_many(:items) }
end
