#an octopus attempts to play DDR

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

#write a function to find the correct tile for the octopus to press in O(n) time
def slow_dance(tile_to_locate, tiles_array)
    tiles_array.each_with_index do |tile, index|
        return index if tile_to_locate == tile
    end
    return -1
end

p slow_dance("up", tiles_array)
#> 0
p slow_dance("right-down", tiles_array)
#> 3

#write a function to find the index of the tile in O(1) time.
tile_hash = {
    "up" => 0, 
    "right-up" => 1, 
    "right" => 2, 
    "right-down" => 3, 
    "down" => 4,
    "left-down" => 5,  
    "left" => 6, 
    "left-up" => 7
}
def fast_dance(tile, tile_hash)
    tile_hash[tile]
end
p fast_dance("up", tile_hash)
#> 0
p fast_dance("right-down", tile_hash)
#> 3
