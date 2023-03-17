class MyTracks
  def initialize
    @tracks = []
  end

  def list
    @tracks
  end

  def add(track=nil)
    fail "Must be a string" unless track.is_a? String
    fail "Can't save empty string" if track.empty?
    @tracks << track
  end
end
