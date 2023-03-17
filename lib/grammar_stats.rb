class GrammarStats
  def initialize
    @correct_checks = 0
    @incorrect_checks = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    fail "Cannot check an empty string" if text == ""
    first_char = text.chars.first
    last_char = text.chars.last
    if (first_char.match(/[A-Z]/)) && (last_char.match(/[!?.]/))
      @correct_checks += 1
      true
    else
      @incorrect_checks += 1
      false
    end
  end

  def percentage_good
    return 0 if @correct_checks == 0 && @incorrect_checks == 0
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    no_checks_done = @correct_checks + @incorrect_checks
    fraction = @correct_checks / no_checks_done.to_f
    return (fraction * 100).to_i
  end
end