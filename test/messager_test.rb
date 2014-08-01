gem 'minitest'
require 'minitest/autorun'
require './lib/messager'

class MessagerTest < Minitest::Test

  include Messager

  def test_it_can_receive_messages
    assert_equal "test", Messager.output("test")
  end

end
