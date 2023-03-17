class ToDoList

  def initialize
    @tasks = [] 
  end

  def add(task)
    fail "Can't add empty string" if task.empty?
    @tasks << task
  end

  def list_tasks
    @tasks
  end
end