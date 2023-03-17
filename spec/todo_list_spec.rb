require 'todo_list'

RSpec.describe ToDoList do


  context "when an item is added" do
    it "returns that item" do
      list = ToDoList.new
      list.add("Walk the dog")
      expect(list.list_tasks).to eq ["Walk the dog"]
    end
  end


  it "when no ietms have been added it returns an empty list" do
    list = ToDoList.new
    expect(list.list_tasks).to eq []
  end


    it "raises an error when adding an empty string" do
      list = ToDoList.new
      expect{ list.add("") }.to raise_error "Can't add empty string"
    end


  describe "#complete" do
    xit "removes a completed task from the list" do
      list = ToDoList.new
      list.add("Walk the dog")
      list.complete("Walk the dog")
      expect.(list.list_tasks).to eq []
    end
  end

  xit "adds multiple items to the list" do
    list = ToDoList.new
    list.add("Walk the dog")
    list.add("Walk the cat")
    expect(list.list_tasks).to eq ["Walk the dog", "Walk the cat"]
  end
end
