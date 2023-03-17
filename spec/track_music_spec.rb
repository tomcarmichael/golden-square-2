require "track_music"

RSpec.describe MyTracks do
  
  it "returns empty array if nothing has been added" do
    favs = MyTracks.new
    expect(favs.list).to eq []
  end

  context "returns tracks added to list" do
    it "returns 1 track" do
      favs = MyTracks.new
      favs.add("lean on me")
      expect(favs.list).to eq ["lean on me"]
    end

    it "returns 2 tracks" do
      favs = MyTracks.new
      favs.add("lean on me")
      favs.add("still T.D.D")
      expect(favs.list).to eq ["lean on me", "still T.D.D"]
    end
  end

  context "Throws an error" do
    it "returns error if empty string" do
      favs = MyTracks.new
      expect { favs.add("") }.to raise_error "Can't save empty string"
    end

    it "returns error if given integer" do
      favs = MyTracks.new
      expect { favs.add(2) }.to raise_error "Must be a string"
    end

    it "returns error if given nil" do
      favs = MyTracks.new
      expect { favs.add }.to raise_error "Must be a string"
    end
  end
end