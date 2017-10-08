# == Schema Information
#
# Table name: equipment_items
#
#  id                    :integer          not null, primary key
#  name                  :string
#  attack                :integer          default(0)
#  defense               :integer          default(0)
#  hp                    :integer          default(0)
#  required_level        :integer          default(1)
#  price                 :integer
#  artifact              :boolean          default(FALSE)
#  equipment_category_id :integer
#  image                 :string
#

require 'spec_helper'

describe Equipment::Item, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:equipment_category_id) }
  it { is_expected.to validate_presence_of(:required_level) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to belong_to(:category) }
end
