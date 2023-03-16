require "check_for_todo"

RSpec.describe "check_for_todo method" do
  it "fails with error message if passed an empty string" do
    expect{ check_for_todo('') }.to raise_error "does not contain any text"
  end

  context "returns true when text includes #TODO" do
    it "returns true for '#TODO'" do
      expect(check_for_todo('#TODO')).to eq true
    end

    it "returns true for 'hello, #TODO'" do
      expect(check_for_todo('hello, #TODO')).to eq true
    end

    it "returns true for '#TODO hi there world!'" do
      expect(check_for_todo('#TODO hi there world!')).to eq true
    end

    it "returns true for 'message: #TODO hi there world!'" do
      expect(check_for_todo('message: #TODO hi there world!')).to eq true
    end
  end

  context "Returns false when text does not include '#TODO'" do
    it "returns false for 'hello'" do
      expect(check_for_todo('hello')).to eq false
    end

    it "returns false for 'hello, world'" do
      expect(check_for_todo('hello, world')).to eq false
    end
  end
end