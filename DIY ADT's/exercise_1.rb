  #Stack Class
  
  class Stack
    def initialize
      @items = []
    end

    def push(el)
      @items.push(el)
    end

    def pop
      @items.pop
    end

    def peek
      @items.last
    end
  end

#Tests

stack = Stack.new
stack.push("a")
stack.push("b")
stack.push("c")
p stack.pop
p stack.pop
stack.push("d")
stack.push("e")
p stack.pop
p stack
p stack.peek

#should print "c", "b", "e", then ["a", "d"], then "d"