require "make_snippet"

RSpec.describe "make_snippet method" do
  it "for a one word string it returns that string" do
    expect(make_snippet("hello")).to eq "hello"
  end
  it "returns the first five words of a string plus '...'" do
    expect(make_snippet("hello, world, is it me you're looking for?")).to eq "hello, world, is it me..."
  end
end