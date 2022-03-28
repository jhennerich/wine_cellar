require 'rails_helper'

RSpec.describe Winecellar, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should allow_value(false).for(:full)}
    it {should validate_presence_of(:location)}
    it {should validate_presence_of(:capacity)}
  end

  describe "relationships" do
    it {should have_many :wines }
  end
  describe 'class methods' do
    xit '.sorted_by_created_at' do
    end
  end
end
