class MyTracks
  def initialize
    @tracks = []
  end

  def list
    @tracks
  end

  def add(track)
    @tracks << track
  end
end
