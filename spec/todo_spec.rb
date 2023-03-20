require "todo"

describe Todo do
  context "when created as a task" do
    it "returns that task" do
      todo = Todo.new("To learn ruby")
      expect(todo.task).to eq "To learn ruby"
    end

    it "it tell us if the task is done" do
      todo = Todo.new("To learn ruby")
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end
end