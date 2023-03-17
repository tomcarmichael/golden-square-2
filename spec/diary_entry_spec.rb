require "diary_entry"

RSpec.describe DiaryEntry do

  context "it fails if initialised with empty strings" do
    it "fails if passed an empty title" do
      expect { DiaryEntry.new("", "Help") }.to raise_error "You provided an empty title."
    end

    it "fails if passed an empty contents" do
      expect { DiaryEntry.new("Monday", "") }.to raise_error "You provided an empty contents."
    end
  end

  context "it initialises with a given title and returns it" do
    it "returns the title (Tuesday)" do
      entry = DiaryEntry.new("Tuesday", "Got confused by TDD")
      expect(entry.title).to eq "Tuesday"
    end
  
    it "returns the title (Wednesday)" do
      entry = DiaryEntry.new("Wednesday", "Got confused by everything")
      expect(entry.title).to eq "Wednesday"
    end
  end

  context "it initialises with a given contents and returns it" do
    it "returns the contents (everything)" do
      entry = DiaryEntry.new("Wednesday", "Got confused by everything")
      expect(entry.contents).to eq "Got confused by everything"
    end

    it "returns the contents (everything)" do
      entry = DiaryEntry.new("Monday", "Got confused by myself")
      expect(entry.contents).to eq "Got confused by myself"
    end
  end

  context "returns both title and contents" do
    it "returns title (Thurs) and contents (life)" do
      entry = DiaryEntry.new("Thursday", "Got confused by life")
      expect("#{entry.title}, #{entry.contents}").to eq "Thursday, Got confused by life"
    end

    it "returns title (Mon) and contents (OOP)" do
      entry = DiaryEntry.new("Monday", "Got confused by OOP")
      expect("#{entry.title}, #{entry.contents}").to eq "Monday, Got confused by OOP"
    end
  end

  context "returns the word count of its contents" do
    it "returns 1 for a single word contents" do
      entry = DiaryEntry.new("Thursday", "Hello")
      expect(entry.count_words).to eq 1
    end

    it "returns 2 for a two word contents" do
      entry = DiaryEntry.new("Tuesday", "Bye bye")
      expect(entry.count_words).to eq 2
    end
  end

  context "Returns the reading time of the contents" do
    it "returns 1 minute reading time for a contents of less words than the given words per min" do
      entry = DiaryEntry.new("Saturday", "Woke, got out of bed, dragged a comb across my head")
      expect(entry.reading_time(100)).to eq 1
    end

    it "returns 2 minute reading time for a contents exactly twice the length of words per min" do
      entry = DiaryEntry.new("Sunday", "Wake up you sleepy head. Put on some clothes, shake up your bed. Put another log on the fire for me, made some breakfast and coffee")
      expect(entry.reading_time(13)).to eq 2
    end
  end

  context "It has a functioning reading chunk method" do
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    it "Returns a string the first chunk of the contents (Pretty things) that the user could read in the given number of minutes." do
      entry = DiaryEntry.new("Sunday", "Wake up you sleepy head. Put on some clothes, shake up your bed. Put another log on the fire for me, made some breakfast and coffee")
      wpm = 2
      minutes = 5
      expect(entry.reading_chunk(wpm, minutes)).to eq "Wake up you sleepy head. Put on some clothes, shake"
    end

    it "Returns a string the first chunk of the contents (Day in the Life) that the user could read in the given number of minutes." do
      entry = DiaryEntry.new("Tues", "Woke up, got out of bed, dragged a comb across my head")
      wpm = 3
      minutes = 3
      expect(entry.reading_chunk(wpm, minutes)).to eq "Woke up, got out of bed, dragged a comb"
    end

    it "returns the 2nd chunk of contents correctly when called twice" do
      entry = DiaryEntry.new("Sunday", "Wake up you sleepy head. Put on some clothes, shake up your bed. Put another log on the fire for me, made some breakfast and coffee")
      wpm = 2
      minutes = 4
      entry.reading_chunk(wpm, minutes)
      expect(entry.reading_chunk(wpm, minutes)).to eq "clothes, shake up your bed. Put another log"
    end

    it "returns the 3rd chunk of contents correctly when called twice" do
      entry = DiaryEntry.new("Sunday", "Wake up you sleepy head. Put on some clothes, shake up your bed. Put another log on the fire for me, made some breakfast and coffee")
      wpm = 2
      minutes = 2
      2.times { entry.reading_chunk(wpm, minutes) }
      expect(entry.reading_chunk(wpm, minutes)).to eq "clothes, shake up your"
    end

    it "returns the 2nd chunk of contents when length of contents is NOT a multiple of wpm * minutes" do
      # Contents is 12 words long, each chunk will be 9 words long
      entry = DiaryEntry.new("Tues", "Woke up, got out of bed, dragged a comb across my head")
      wpm = 3
      minutes = 3
      entry.reading_chunk(wpm, minutes)
      expect(entry.reading_chunk(wpm, minutes)).to eq "across my head"
    end

    it "restarts from the beginning when the whole contents has been read and length of contents is a multiple of wpm * minutes" do
      # Contents is 12 words long, each chunk will be 6 words long
      entry = DiaryEntry.new("Tues", "Woke up, got out of bed, dragged a comb across my head")
      wpm = 3
      minutes = 2
      2.times { entry.reading_chunk(wpm, minutes) }
      expect(entry.reading_chunk(wpm, minutes)).to eq "Woke up, got out of bed,"
    end

    it "restarts from the beginning when the whole contents has been read and length of contents is NOT a multiple of wpm * minutes" do
      # Contents is 12 words long, each chunk will be 9 words long
      entry = DiaryEntry.new("Tues", "Woke up, got out of bed, dragged a comb across my head")
      wpm = 3
      minutes = 3
      2.times { entry.reading_chunk(wpm, minutes) }
      expect(entry.reading_chunk(wpm, minutes)).to eq "Woke up, got out of bed, dragged a comb"
    end


  end

end