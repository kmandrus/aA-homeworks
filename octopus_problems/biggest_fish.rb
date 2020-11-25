
fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#find the longest fish in O(n^2) time
def slow_find(fish)
    sorted_fish = fish.dup
    
    sorted = false
    until sorted do
        sorted = true
        i = 0
        while i < fish.length - 1 do
            fish_1, fish_2 = sorted_fish[i..i+1]
            if fish_1.length > fish_2.length
                sorted_fish[i+1] = fish_1
                sorted_fish[i] = fish_2
                sorted = false
            end
            i += 1
        end
    end
    sorted_fish.last
end
puts slow_find(fish)

#find the longest fish in O(nlog n) time
def merge_sort(fish)
    return fish if fish.length == 1
    mid = fish.length / 2
    left, right = fish[0...mid], fish[mid..-1]
    left, right = merge_sort(left), merge_sort(right)
    
    sorted = []
    until left.empty? || right.empty?
        left_fish, right_fish = left.first, right.first
        if left_fish.length < right_fish.length
            sorted << left.shift
        else
            sorted << right.shift
        end
    end
    if left.empty?
        sorted += right
    else
        sorted += left
    end
    sorted
end
def fast_find(fish)
    merge_sort(fish).last
end

puts fast_find(fish)

#find the longest fish in O(n) time
def medium_find(fish)
    longest = fish.first
    fish.each do |current|
        longest = current if current.length > longest.length
    end
    longest
end
puts medium_find(fish)