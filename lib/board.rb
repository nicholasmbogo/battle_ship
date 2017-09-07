require 'pry'
class Board

  attr_accessor :board

  def initialize

    @board = [["", "", "", ""],
             ["", "", "", ""],
             ["", "", "", ""],
             ["", "", "", ""]]

  end
  def setup_computer_board
    start_y_3_unit = rand(2)
    start_x_3_unit = rand(4)
    end_y_3_unit = start_y_3_unit + 2
    end_x_3_unit = start_x_3_unit

    place_ship(start_y_3_unit, start_x_3_unit, end_y_3_unit, end_x_3_unit, 3)#calling the method and passing in real arguments
    #place 3 unit ship vertically
    #pick start and location for the unit ship(if no ship place ship else pick new locations)
    start_y_2_unit = rand(4)
    start_x_2_unit = rand(3)
    end_y_2_unit = start_y_2_unit
    end_x_2_unit = start_x_2_unit+1

    # while @board[start_y_2_unit][start_x_2_unit] != "" || @board[end_y_2_unit][end_x_2_unit] != ""
    until ship_doesnot_overlap?(start_y_2_unit, start_x_2_unit, end_y_2_unit, end_x_2_unit)
      start_y_2_unit = rand(4)
      start_x_2_unit = rand(3)
      end_y_2_unit = start_y_2_unit
      end_x_2_unit = start_x_2_unit+1
    end
    place_ship(start_y_2_unit, start_x_2_unit, end_y_2_unit, end_x_2_unit, 2)
    #check if no ship and call the ship horizontally
    #place 2 unit ship horizontally
    #
  end
  def place_ship(start_y, start_x, end_y, end_x, num_units)
    @board[start_y][start_x] = num_units
    @board[end_y][end_x] = num_units
    if num_units == 3#we can only do the below methods or line if we only doing 3 ship coordinates
      ship_direction = determine_ship_direction(start_y, start_x, end_y, end_x)

      if ship_direction == "horizontal"
        @board[start_y][start_x+1] = num_units

      elsif ship_direction == "vertical"
        @board[start_y+1][start_x] = num_units

      end
    end
  end

  def determine_middle_value(start_y, start_x, ship_direction)
    #binding.pry
    if ship_direction == "horizontal"
      @board[start_y][start_x+1]

    elsif ship_direction == "vertical"
      @board[start_y+1][start_x]
    end

  end

  def ship_doesnot_overlap?(start_y, start_x, end_y, end_x)
      #binding.pry
      ship_direction = determine_ship_direction(start_y, start_x, end_y, end_x)
       @board[start_y][start_x] == "" && @board[end_y][end_x] == "" && determine_middle_value(start_y, start_x, ship_direction) == ""
     #rescue
       #return false
    end

  def determine_ship_direction(start_y, start_x, end_y, end_x)

    if start_y == end_y
      return "horizontal"

    elsif start_x == end_x
      return "vertical"

    else
      return false
    end
  end

  def ship_doesnot_wrap(start_y, start_x, end_y, end_x)
    ship_direction = determine_ship_direction(start_y, start_x, end_y, end_x)

    if ship_direction == "horizontal"
      start_x < end_x

    elsif ship_direction == "vertical"
      start_y < end_y
    end
  end

  def ship_direction_valid?(start_y, start_x, end_y, end_x)
    ship_direction = determine_ship_direction(start_y, start_x, end_y, end_x)

    if ship_direction
      return true

    else
      return false
    end
  end

  def ship_is_correct_length?(start_y, start_x, end_y, end_x, num_units)
    ship_direction = determine_ship_direction(start_y, start_x, end_y, end_x)

    if ship_direction == "horizontal"
      end_x - start_x == num_units - 1

    elsif ship_direction == "vertical"
      end_y - start_y == num_units - 1
    end
  end

  def translate_user_coordinates(user_coordinates)
    split_coordinates = user_coordinates.split(" ")
    y_map = {"A" => 0, "B" => 1, "C" => 2, "D" => 3}

    translated = {start_y: nil, start_x: nil, end_y:nil, end_x: nil}

    split_start = split_coordinates[0].chars
    translated[:start_y] = y_map[split_start[0]]
    translated[:start_x] = split_start[1].to_i - 1

    split_end = split_coordinates[1].chars
    translated[:end_y] = y_map[split_end[0]]
    translated[:end_x] = split_end[1].to_i - 1
    translated

  end
end
