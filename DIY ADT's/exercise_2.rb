class Queue
    def initialize
        @items = []
    end

    def enqueue(el)
        @items.push(el)
    end
    
    def dequeue
        @items.shift
    end

    def peek
        @items.first
    end

    def size
        @items.size
    end

    def inspect
        @items.inspect
    end
end

#testing
queue = Queue.new
str = "The master's tools will never dismantle the master's house."
str.split.each { |word| queue.enqueue(word) }
3.times {p queue.dequeue} #"the" "master's" "tools"
queue.enqueue("Your")
queue.enqueue("silence")
queue.enqueue("will")
p queue.peek #"will"
p queue.dequeue #"will"
p queue.peek #"never"
p queue.size #8
p queue
