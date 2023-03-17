require 'grammar_stats'

describe GrammarStats do
  context "#check(text)" do
    it "throws error for empty string" do
      checker = GrammarStats.new
      expect{ checker.check("") }.to raise_error "Cannot check an empty string"
    end

    it "returns false for a one letter string" do
      checker = GrammarStats.new
      expect(checker.check("I")).to eq false
    end

    it "returns false for '!'" do
      checker = GrammarStats.new
      expect(checker.check("!")).to eq false
    end


    it "returns true for 'Hi!'" do
      checker = GrammarStats.new
      expect(checker.check("Hi!")).to eq true
    end
  end

  context "#percentage_good" do
    it "returns 0 when no texts have been checked" do
      checker = GrammarStats.new
      expect(checker.percentage_good).to eq 0
    end

    it "returns 100 when 1 correct text has been checked" do
      checker = GrammarStats.new
      checker.check("Hi!")
      expect(checker.percentage_good).to eq 100
    end

    it "returns 50 when 1 correct text & 1 incorrect text has been checked" do
      checker = GrammarStats.new
      checker.check("Hi!")
      checker.check("!")
      expect(checker.percentage_good).to eq 50
    end

    it "returns 66 when 2 correct texts & 1 incorrect text has been checked" do
      checker = GrammarStats.new
      checker.check("Hi!")
      checker.check("Why, hello.")
      checker.check("!")
      expect(checker.percentage_good).to eq 66
    end
  end
end