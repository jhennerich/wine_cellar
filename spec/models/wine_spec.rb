require 'rails_helper'

RSpec.describe Wine, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:varietal)}
    it {should validate_presence_of(:in_stock)}
    it {should validate_presence_of(:year)}
    it {should validate_presence_of(:wine_score)}
  end
end
