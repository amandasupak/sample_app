require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "User@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    assert @user.name = "    "
    assert_not @user.valid? 
  end

  test "email should be present" do
    assert @user.email = "    "
    assert_not @user.valid? 
  end

  test "name should not be too long" do
    assert @user.name = "a" * 51
    assert_not @user.valid? 
  end

  test "email should not be too long" do
    assert @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid? 
  end
end
