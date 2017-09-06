require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/game'

class GameTest < MiniTest::Test

  def test_game_initializes
    game = Game.new

    assert_instance_of Game, game
    assert_instance_of Board, game.computer_board
    assert_equal false, game.game_in_progress
  end
  end
