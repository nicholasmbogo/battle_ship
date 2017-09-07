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

  def test_second_ship_doesnot_overlap
    board = Board.new
    board.place_ship(0,0, 0,2, 3)

    assert_equal true, board.ship_doesnot_overlap?(2, 2, 3, 2)
  end

  def test_second_3_unit_ship_doesnot_overlap
    board = Board.new
    board.place_ship(0,0, 0,2, 3)

    assert_equal true, board.ship_doesnot_overlap?(1, 2, 3, 2)
  end

  def test_second_ship_does_overlap
    board = Board.new
    board.place_ship(0,0, 0,2, 3)

    assert_equal false, board.ship_doesnot_overlap?(0, 0, 1, 0)
  end

  def test_second_3_unit_ship_does_overlap
    board = Board.new
    board.place_ship(0,0, 0,2, 3)

    assert_equal false, board.ship_doesnot_overlap?(0, 1, 0, 3)
  end

  def test_ship_doesnot_wrap
    board =Board.new

    assert_equal true, board.ship_doesnot_wrap(0,0, 0,2)
  end

  def test_ship_does_wrap
    board = Board.new

    assert_equal false, board.ship_doesnot_wrap(0,2, 0,0)
  end

  def test_vertical_ship_doesnot_wrap
    board =Board.new

    assert_equal true, board.ship_doesnot_wrap(0,0, 2,0)
  end

  def test_vertical_ship_does_wrap
    board = Board.new

    assert_equal false, board.ship_doesnot_wrap(2,0, 0,0)
  end

  def test_ship_is_horizontal_or_vertical
    board = Board.new

    assert_equal true, board.ship_direction_valid?(0,0, 2,0)
  end

  def test_ship_is_not_horizontal_or_vertical
    board = Board.new

    assert_equal false, board.ship_direction_valid?(0,0, 2,2)
  end

  def test_ship_is_correct_length
    board = Board.new

    assert_equal true, board.ship_is_correct_length?(0,0, 0,1, 2)
  end

  def test_unit_3_ship_is_correct_length
    board = Board.new

    assert_equal true, board.ship_is_correct_length?(0,0, 2,0, 3)
  end

  def test_ship_is_incorrect_length
    board = Board.new

    assert_equal false, board.ship_is_correct_length?(1,0, 2,0, 3)
  end

  def test_can_translate_user_coordinates
    board = Board.new

    assert_equal ({start_y: 0, start_x: 0, end_y:0, end_x: 1}), board.translate_user_coordinates("A1 A2")
  end
end
