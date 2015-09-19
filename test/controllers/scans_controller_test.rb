require "test_helper"

class ScansControllerTest < ActionController::TestCase
  def test_high_low
    get :high_low
    assert_response :success
  end

end
