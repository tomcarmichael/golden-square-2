require "make_snippet"

RSpec.describe "make_snippet mathod" do
  it "for a one word string it returns that string" do
    expect(make_snippet("hello")).to eq "hello"
  end
end