{{PROBLEM}} Class Design Recipe

1. Describe the Problem

# As a user
# So that I can keep track of my music listening
# I want to add tracks I've listened to and see a list of them.

2. Design the Class Interface

```

class MyTracks

  def initialize
  # initialize empty list
  end

  def add(track)
  # add track to list
  end

  def list
  # returns list of tracks
  end


3. Create Examples as Tests

Make a list of examples of how the class will behave in different situations.

```
favs = MyTracks.new
favs.list => []

favs = MyTracks.new
favs.add("lean on me")
favs.list => ["lean on me"]

favs = MyTracks.new
favs.add("lean on me", "still T.D.D")
favs.list => ["lean on me", "still T.D.D"]

favs = MyTracks.new
favs.add("") => error message

favs = MyTracks.new
favs.add(2) => error message

favs = MyTracks.new
favs.add() => error message









```

# EXAMPLE

# 1
reminder = Reminder("Kay")
reminder.remind_me_to("Walk the dog")
reminder.remind() # => "Walk the dog, Kay!"

# 2
reminder = Reminder("Kay")
reminder.remind() # fails with "No task set."

# 3
reminder = Reminder("Kay")
reminder.remind_me_to("")
reminder.remind() # => ", Kay!"
Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the