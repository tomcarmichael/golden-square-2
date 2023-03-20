require "todo_list"
require "todo"

describe "integration test" do
  it "returns all incomplete todos" do
    todo = Todo.new("figure out keyboard")
    todo_list = TodoList.new
    todo_list.add(todo)
    expect(todo_list.incomplete).to eq [todo]
  end

  it "returns all complete todos" do
    todo = Todo.new("figure out keyboard")
    todo_list = TodoList.new
    todo_list.add(todo)
    todo.mark_done!
    expect(todo_list.complete).to eq [todo]
  end

  it "sets all tasks to complete" do
    todo_list = TodoList.new
    todo_1 = Todo.new("figure out keyboard")
    todo_2 = Todo.new("learn ruby")
    todo_3 = Todo.new("go to sleep")
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    todo_list.add(todo_3)
    todo_list.give_up!
    expect(todo_list.complete).to eq [todo_1, todo_2, todo_3]
  end
end