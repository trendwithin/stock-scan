require "test_helper"

class PagesControllerTest < ActionController::TestCase
  def test_examples
    get :examples
    assert_response :success
  end

  def test_about
    get :about
    assert_response :success
  end

  def test_contact
    get :contact
    assert_response :success
  end

end
