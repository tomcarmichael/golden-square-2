def make_snippet(string)
  if string.length <= 5
    return string
  else
    first_5_words = string.split[0..4].join(' ')
    return "#{first_5_words}..."
  end
end