class Diary
  def initialize
    @entries =[]
  end

  def add(entry) # entry is an instance of DiaryEntry
    @entries << entry
  end

  def all
    # Returns a list of instances of DiaryEntry
    @entries
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    word_count = 0
    @entries.each do |entry|
      word_count += entry.count_words
    end
    return word_count
  end

  def reading_time(wpm) # wpm is an integer representing no of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes for all entries
    reading_time = count_words.to_f / wpm
    return reading_time.ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
       readable_words = wpm * minutes
    # record the word count of entry closest in word count to readable_words
    closest_wordcount = 0
    # record the title of said closest entry
    closest_entry =  nil
    @entries.each do |entry|
      current_entry_wordcount = entry.count_words
      if current_entry_wordcount <= readable_words && current_entry_wordcount > closest_wordcount
        closest_wordcount = current_entry_wordcount
        closest_entry = entry
      end
    end
    return closest_entry
  end
end