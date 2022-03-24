require 'rails_helper'

RSpec.describe Winecellar, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:full)}
    it {should validate_presence_of(:location)}
    it {should validate_presence_of(:capacity)}
  end
end
