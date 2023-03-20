require "diary"

RSpec.describe Diary do
  context "without any additions" do
    it "returns an empty list" do
      diary = Diary.new
      expect(diary.all).to eq []
    end
  end
end