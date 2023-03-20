# File: lib/vowel_remover.rb

class VowelRemover
  def initialize(text)
    @text = text
    @vowels = ["a", "e", "i", "o", "u"]
  end

  def remove_vowels()
=begin
    i = 0
    length = @text.length
    while i < length
      # binding.irb
      puts "@text is #{@text}"
      puts "before incrementing, i is #{i}"
      if @vowels.include? @text[i].downcase
        @text = @text.slice(0,i) + @text.slice(i+1..-1)
      end
      i += 1
      puts "after incrementing, i is #{i}"
    end
    return @text
=end
    @text.chars.each do |c|
      if @vowels.include? c.downcase
        @text.delete!(c)
      end
    end
    @text
  end
end

remover = VowelRemover.new("aeioubbb")
result_no_vowels = remover.remove_vowels
puts "output is #{result_no_vowels}"