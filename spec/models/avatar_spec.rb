# == Schema Information
#
# Table name: avatars
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  private            :boolean          default(TRUE)
#

require 'spec_helper'

describe Avatar, type: :model do
  it { is_expected.to have_many(:players) }
end
