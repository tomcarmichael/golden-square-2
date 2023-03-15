require "count_words"

RSpec.describe "count_words method" do
  it "returns 1 for a string of only 1 word" do
    expect(count_words("hello")).to eq 1
  end

  it "return 2 for a string of 2 words" do
    expect(count_words("hello world")).to eq 2
  end

end