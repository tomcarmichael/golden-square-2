class DiaryEntry

  def initialize(title, contents) # title, contents are strings
    fail "You provided an empty title." if title == ""
    fail "You provided an empty contents." if contents == ""
    @title = title
    @contents = contents
    # Initialise counter to keep track of the last word returned by reading_chunk
    @reading_chunk_index = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split.length
  end

  def reading_time(wpm)
    # wpm is an integer representing the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    reading_time = @contents.split.length / wpm.to_f
    # Round up to the nearest minute
    reading_time.ceil

  end

  def reading_chunk_index
    @reading_chunk_index
  end

  def reading_chunk_counter
    @reading_chunk_counter
  end

  def reading_chunk(wpm, minutes)
    # Split the contents into an array of words
    words_array = @contents.split
    chunk_end = @reading_chunk_index + (minutes * wpm)
    # If the chunk end point is beyond the bounds of the words array, end the chunk at the end of the array instead
    chunk_end = words_array.length if chunk_end > words_array.length
    # create a string of the words starting from either 0, or the next word after where the last chunk left off (every other method call)
    reading_chunk = words_array[@reading_chunk_index...chunk_end]
    # If all of the contents has already been returned by reading chunk:
    if chunk_end >= words_array.length
      # Reset index to 0
      @reading_chunk_index = 0
    # Else add the length in words of the current chunk to the index counter
    else
      @reading_chunk_index += reading_chunk.length
    end

    # Return the chunk, joined as a string of words
    return reading_chunk.join(' ')
  end
end