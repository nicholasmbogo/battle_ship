require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/board'

class BoardTest < MiniTest::Test

  def test_board_initializes
    board = Board.new

    assert_instance_of Board, board
    assert_equal [["", "", "", ""],
           ["", "", "", ""],
           ["", "", "", ""],
           ["", "", "", ""]], board.board
  end

  def test_board_can_determine_a_vertical_ship
    board = Board.new

    assert_equal "vertical", board.determine_ship_direction(1,3, 3,3)
  end

  def test_board_can_determine_a_horizontal_ship
    board = Board.new

    assert_equal "horizontal", board.determine_ship_direction(0,0, 0,2)
  end

  def test_it_can_place_a_3_unit_vertical_ship
    board = Board.new

    board.place_ship(0,0, 2,0, 3)
    #expected =
    assert_equal [[3, "", "", ""],[3, "", "", ""], [3, "", "", ""], ["", "", "", ""]], board.board
  end

  def test_it_can_place_a_3_unit_horizontal_ship
    board = Board.new

    board.place_ship(0,0, 0,2, 3)

    assert_equal [[3, 3, 3, ""],["", "", "", ""], ["", "", "", ""], ["", "", "", ""]], board.board
  end

  def test_can_set_up_computer_board_with_two_ship
    board = Board.new

    board.setup_computer_board
    assert_equal 3, board.board.flatten.delete_if {|value|value!=3}.length
    assert_equal 2, board.board.flatten.delete_if{|value|value!=2}.length
  end

  def test_can_validate_the_second_ship
    board = Board.new
    board.place_ship(0,0, 0,2, 3)

    assert_equal true, board.second_ship_valid?(3, 2, 2, 2)
  end

  def test_a_ship_off_board_is_invalid
    board = Board.new
    #board.place_ship(0,0, 0,2, 3)

    assert_equal false, board.second_ship_valid?(3, 2, 4, 4)
  end

  # def test_if_the_ship_next_to_each_other
  #   board = Board.new
  # end
end
