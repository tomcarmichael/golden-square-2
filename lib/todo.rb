# File: lib/todo.rb
class Todo
  def initialize(task) # task is a string
    @task = task
    @done = false
  end

  def task
    @task
  end

  def mark_done!
    @done = true
  end

  def done?
    @done
  end
end