class Map

    def initialize
        @my_map = []
    end

    def set(key, value)
        @my_map.each_with_index do |pair, i|
            if pair.first == key
                @my_map[i] = [key, value]
                return value
            end
        end
        @my_map << [key, value]
        value
    end

    def get(key)
        @my_map.each do |pair| 
            if pair.first == key
                return pair.last
            end
        end
        nil
    end

    def delete(key)
        @my_map.each_with_index do |pair, i|
            if pair.first == key
                @my_map.delete_at(i)
                return pair.last
            end
        end
        nil
    end
    
    def show
        str = "{ "
        first_pair = true
        @my_map.each do |pair|
            pair_str = pair.join("'=>'")
            if first_pair
                str << "'#{pair_str}'"
                first_pair = false
            else
                str << ", '#{pair_str}'"
            end
        end
        str << " }"
        puts str
    end

    def include?(key)
        @my_map.any? do |pair|
            pair.first == key
        end
    end
end

map = Map.new
map.set("ice cream", "yummy")
map.set("sprouts", "amazing")
map.set("fascism", "terrible")
map.show

p map.include?("sprouts")
p map.delete("sprouts")
map.show
p map.include?("sprouts")

p map.get("pork")
p map.get("sprouts")
p map.get("ice cream")
p map.get("fascism")
