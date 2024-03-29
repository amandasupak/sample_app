require "test_helper"

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:amanda)
  end
end

class InvalidPasswordTest < UserLoginTest
  test "login Path" do
    get login_path
    assert_template 'sessions/new'
  end

  test "login with valid email/invalid password" do
    post login_path, params: { session: { email: @user.email,
                                        password: "invalid" } }
    invalid_test
  end

  test "login with invalid email/password" do
    post login_path params: { session:  { email: "", password: "" } }
    invalid_test
  end

  def invalid_test
    assert_not is_logged_in?
    assert_response :unprocessable_entity
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end

class ValidLogin < UserLoginTest
  def setup
    super
    post login_path, params: { session: { email: @user.email,
                                          password: 'password' } }
  end
end

class ValidLoginTest < ValidLogin
  test "valid login" do
    assert is_logged_in?
    assert_redirected_to @user
  end

  test "redirect after login" do
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0 
    assert_select "a[href=?]", logout_path 
    assert_select "a[href=?]", user_path(@user)
  end
end

class Logout < UserLoginTest 
  def setup
    super
    delete logout_path
  end
end

class LogoutTest < Logout
  test "successful logout" do
    assert_not is_logged_in?
    assert_response :see_other
    assert_redirected_to root_url
  end

  test "redirect after logout" do
    follow_redirect!
    assert_select "a[href=?]", login_path 
    assert_select "a[href=?]", logout_path,       count: 0 
    assert_select "a[href=?]", user_path(@user),  count: 0 
  end
end