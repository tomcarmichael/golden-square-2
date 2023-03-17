class ToDoList

  def initialize
    @tasks = [] 
  end

  def add(task)
    fail "Argument must be a string" unless task.is_a? String
    fail "Can't add empty string" if task.empty?
    @tasks << task
  end

  def list_tasks
    @tasks
  end

  def complete(task)
    @tasks.delete(task)
  end
end