class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      4.times { cup << :stone } unless (i == 6 || i == 13)
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12 || start_pos == 6 
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
    true
  end

  def make_move(start_pos, current_player_name)
    if current_player_name == @name1
      opponent_store_index = 13
    else
      opponent_store_index = 6
    end

    stones = @cups[start_pos]
    @cups[start_pos] = []
  
    current_pos = start_pos
    until stones.empty?
      current_pos = (current_pos + 1) % 14
      @cups[current_pos] << stones.pop unless (current_pos == opponent_store_index)
    end
    render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    cup = @cups[ending_cup_idx]
    store_pos = [6, 13]
    return :prompt if store_pos.include?(ending_cup_idx)
    return :switch if cup.length == 1
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = @cups[0..5]
    side2 = @cups[7..12]
    (side1.all?(&:empty?) || side2.all?(&:empty?))
  end

  def winner
    return :draw if store1.size == store2.size
    return @name1 if store1.size > store2.size
    @name2
  end

  private 
  
  def store1 
    @cups[6]
  end
  
  def store2
    @cups[13]
  end
end
