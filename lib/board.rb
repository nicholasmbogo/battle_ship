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
    until second_ship_valid?(start_y_2_unit, start_x_2_unit, end_y_2_unit, end_x_2_unit)
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

    def second_ship_valid?(start_y, start_x, end_y, end_x)
      #binding.pry
       @board[start_y][start_x] == "" && @board[end_y][end_x] == ""
     rescue
       return false
    end

  def determine_ship_direction(start_y, start_x, end_y, end_x)

    if start_y == end_y
      return "horizontal"

    elsif start_x == end_x
      return "vertical"
    end
  end
end
