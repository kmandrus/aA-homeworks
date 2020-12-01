
    #Instructions
#Tonight we're going to use an array to implement a basic LRU Cache. This will 
#be a simple implementation that doesn't use a hash-map or linked list. We will 
#assume our input is limited to Integers, Strings, Arrays, Symbols, and Hashes. 
#We will allow the user to set the size of the cache.

    #Implementation
class LRUCache
    def initialize(size)
        @count = 0
        @max_size = size
        @store = []
    end

    def count
        @count
    end

    def add(el)
        # adds element to cache according to LRU principle
        @count += 1 if @count < @max_size
        @store.delete(el) if @store.include?(el)
        @store.shift if @store.size >= @max_size
        @store.push(el)
    end

    def show
        # shows the items in the cache, with the LRU item first
        p @store
    end

    private
    # helper methods go here!

end
    
    #Tests
johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
p johnny_cache.count