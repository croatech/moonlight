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

require 'spec_helper'

describe Avatar, type: :model do
  it { is_expected.to have_many(:players) }
end
