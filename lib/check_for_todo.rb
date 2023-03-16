def check_for_todo(text)
  if text == ''
    fail "does not contain any text"
  elsif text.include? "#TODO"
    true
  else
    false
  end
end