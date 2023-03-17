>As a user

>So that I can keep track of my tasks

>I want a program that I can add todo tasks to and see a list of them.

>As a user

>So that I can focus on tasks to complete

>I want to mark tasks as complete and have them disappear from the list.

## Design the Class Interface

```
class ToDoList
  def initialize
    # initialise an empty list
  end

  def add(task)
    # add to list
  end

  def list_tasks
    # returns a list of uncompleted tasks
  end

  def complete(task)
    # mark task complete
    # remove from list
  end


```

## Example tests

### 1
```
list = ToDoList.new
list.add("Walk the dog")
list.list_tasks => ["Walk the dog"]
```
### 2
```
list = ToDoList.new
list.list_tasks => []
```
### 3
```
list = ToDoList.new
list.add("") => Error: "Can't add empty string"
```
### 4
```
list = ToDoList.new
list.add("Walk the dog")
list.complete("Walk the dog")
list.list_tasks => []
```
### 5
```
list = ToDoList.new
list.add("Walk the dog")
list.add("Walk the cat")
list.list_tasks => ["Walk the dog", "Walk the cat"]
```