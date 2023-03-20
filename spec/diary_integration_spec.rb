require "diary"
require "diary_entry"

describe "integration" do
  it "returns a list containg the first diary_entry added" do
    diary = Diary.new
    entry = DiaryEntry.new("Mon","Lived, laughed, loved.")
    diary.add(entry)
    expect(diary.all).to eq [entry]
  end
  it "returns a list containg all instances of diary_entry added" do
    diary = Diary.new
    entry = DiaryEntry.new("Mon","Lived.")
    entry2 = DiaryEntry.new("Tues","Laughed.")
    diary.add(entry)
    diary.add(entry2)
    expect(diary.all).to eq [entry, entry2]
  end
  it "counts the words of all diary entries that have been added" do
    diary = Diary.new
    entry = DiaryEntry.new("Mon","Lived.")
    entry2 = DiaryEntry.new("Tues","Laughed.")
    diary.add(entry)
    diary.add(entry2)
    expect(diary.count_words).to eq 2
  end
  it "estimates total reading time for all added entries combined" do
    diary = Diary.new
    # Contents is 12 words long
    entry = DiaryEntry.new("Mon","Woke up, got out of bed, dragged a comb across my head")
    # Contents is 3 words long, making total 15
    entry2 = DiaryEntry.new("Tues","Lived, Laughed, Loved.")
    diary.add(entry)
    diary.add(entry2)
    expect(diary.reading_time(5)).to eq 3
  end
  it "find the entry that is closest in reading time to the given wpm/minutes" do
    diary = Diary.new
    # Contents is 12 words long
    entry = DiaryEntry.new("Mon","Woke up, got out of bed, dragged a comb across my head")
    # Contents is 3 words long
    entry2 = DiaryEntry.new("Tues","Lived, Laughed, Loved.")
    diary.add(entry)
    diary.add(entry2)
    # method takes two args (wpm, minutes)
    result = diary.find_best_entry_for_reading_time(5, 1)
    expect(result).to eq entry2
  end

end
